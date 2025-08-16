#!/bin/bash

# OPAL Policy Repository Version Manager
# Automatically increments version and pushes changes to Git

set -e  # Exit on any error

# Automatically change to the script's directory
cd "$(dirname "$0")"

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

# Version file
VERSION_FILE="VERSION"
TAG_PREFIX="v"

# Function to print colored output
print_status() {
    echo -e "${BLUE}[INFO]${NC} $1"
}

print_success() {
    echo -e "${GREEN}[SUCCESS]${NC} $1"
}

print_warning() {
    echo -e "${YELLOW}[WARNING]${NC} $1"
}

print_error() {
    echo -e "${RED}[ERROR]${NC} $1"
}

# Function to get current version
get_current_version() {
    if [ -f "$VERSION_FILE" ]; then
        cat "$VERSION_FILE"
    else
        echo "0.1.0"  # Default starting version
    fi
}

# Function to increment version
increment_version() {
    local version_type="$1"
    local current_version=$(get_current_version)
    
    # Parse version components
    IFS='.' read -ra VERSION_PARTS <<< "$current_version"
    local major="${VERSION_PARTS[0]:-0}"
    local minor="${VERSION_PARTS[1]:-0}"
    local patch="${VERSION_PARTS[2]:-0}"
    
    case "$version_type" in
        "major")
            major=$((major + 1))
            minor=0
            patch=0
            ;;
        "minor")
            minor=$((minor + 1))
            patch=0
            ;;
        "patch"|*)
            patch=$((patch + 1))
            ;;
    esac
    
    echo "$major.$minor.$patch"
}

# Function to create version file
create_version_file() {
    local version="$1"
    echo "$version" > "$VERSION_FILE"
    print_status "Created version file with version: $version"
}

# Function to update version file
update_version_file() {
    local new_version="$1"
    echo "$new_version" > "$VERSION_FILE"
    print_status "Updated version to: $new_version"
}

# Function to check if tag exists
tag_exists() {
    local tag="$1"
    git tag -l "$tag" | grep -q "^$tag$"
}

# Function to show usage
show_usage() {
    echo "Usage: $0 [OPTIONS] [COMMIT_MESSAGE]"
    echo ""
    echo "Options:"
    echo "  -m, --major     Increment major version (x.0.0)"
    echo "  -i, --minor     Increment minor version (0.x.0)"
    echo "  -p, --patch     Increment patch version (0.0.x) [default]"
    echo "  -s, --show      Show current version"
    echo "  -h, --help      Show this help message"
    echo ""
    echo "Examples:"
    echo "  $0 -p 'Fix ABAC policy paths'     # Increment patch version"
    echo "  $0 -i 'Add new RBAC features'     # Increment minor version"
    echo "  $0 -m 'Breaking changes'          # Increment major version"
    echo "  $0 'Quick fix'                    # Default patch increment"
}

# Parse command line arguments
VERSION_TYPE="patch"
COMMIT_MESSAGE=""

while [[ $# -gt 0 ]]; do
    case $1 in
        -m|--major)
            VERSION_TYPE="major"
            shift
            ;;
        -i|--minor)
            VERSION_TYPE="minor"
            shift
            ;;
        -p|--patch)
            VERSION_TYPE="patch"
            shift
            ;;
        -s|--show)
            print_status "Current version: $(get_current_version)"
            exit 0
            ;;
        -h|--help)
            show_usage
            exit 0
            ;;
        -*)
            print_error "Unknown option: $1"
            show_usage
            exit 1
            ;;
        *)
            COMMIT_MESSAGE="$1"
            shift
            ;;
    esac
done

# Check if we're in a git repository
if ! git rev-parse --git-dir > /dev/null 2>&1; then
    print_error "Not in a git repository!"
    exit 1
fi

# Check if there are changes to commit
if git diff-index --quiet HEAD --; then
    print_warning "No changes to commit. Working directory is clean."
    exit 0
fi

# Get current version and increment
CURRENT_VERSION=$(get_current_version)
NEW_VERSION=$(increment_version "$VERSION_TYPE")

print_status "Current version: $CURRENT_VERSION"
print_status "Incrementing $VERSION_TYPE version..."
print_status "New version: $NEW_VERSION"

# Create or update version file
if [ ! -f "$VERSION_FILE" ]; then
    create_version_file "$NEW_VERSION"
else
    update_version_file "$NEW_VERSION"
fi

# Set default commit message if none provided
if [ -z "$COMMIT_MESSAGE" ]; then
    COMMIT_MESSAGE="Update to version $NEW_VERSION"
fi

# Add all changes including the version file
print_status "Adding all changes to git..."
git add .

# Commit changes
print_status "Committing changes..."
git commit -m "$COMMIT_MESSAGE (version $NEW_VERSION)"

# Create and push tag
TAG_NAME="${TAG_PREFIX}${NEW_VERSION}"

# Check if tag already exists and handle it
if tag_exists "$TAG_NAME"; then
    print_warning "Tag $TAG_NAME already exists. Deleting old tag..."
    git tag -d "$TAG_NAME" 2>/dev/null || true
    print_status "Deleted local tag: $TAG_NAME"
    
    # Try to delete remote tag if it exists
    if git ls-remote --tags origin | grep -q "refs/tags/$TAG_NAME"; then
        print_status "Deleting remote tag: $TAG_NAME"
        git push origin ":refs/tags/$TAG_NAME" 2>/dev/null || true
    fi
fi

print_status "Creating tag: $TAG_NAME"
git tag "$TAG_NAME"

# Push changes and tags
print_status "Pushing changes to remote..."
git push origin master

print_status "Pushing tags to remote..."
git push origin "$TAG_NAME"

print_success "Successfully pushed version $NEW_VERSION to remote repository!"
print_status "Tag: $TAG_NAME"
print_status "Commit: $(git rev-parse --short HEAD)"