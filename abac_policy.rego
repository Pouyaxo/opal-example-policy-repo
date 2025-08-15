package abac

# Default deny - secure by default
default allow = false

# Simple ABAC Policy: Allow access based on basic conditions
allow {
    # Get user data from the database (data is nested under .result)
    some user_idx
    user := data.users.result[user_idx]
    user.email == input.user.key
    
    # Get user's role
    user_role := user.role
    
    # Check if user has permission for this action and resource type
    some permission_idx
    permission := data.permissions.result[permission_idx]
    permission.role_id == user_role
    permission.resource_type == input.resource.type
    permission.action == input.action
    permission.is_granted == true
}
