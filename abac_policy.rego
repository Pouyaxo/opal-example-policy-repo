package abac

# Default deny
default allow = false

# Simple ABAC policy - test basic functionality first
allow {
    # Get user data
    user := data.users[input.user.key]
    
    # Get user's role
    user_role := user.role
    
    # Check if user has any permissions for this action and resource type
    some permission_idx
    permission := data.permissions[permission_idx]
    permission.role_id == user_role
    permission.resource_type == input.resource.type
    permission.action == input.action
    permission.is_granted == true
}
