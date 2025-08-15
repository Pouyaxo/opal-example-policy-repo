package simple_abac

default allow = false

allow {
    # User exists
    some user_idx
    user := data.users.result[user_idx]
    user.email == input.user.key
    
    # User attributes match
    input.user.attributes.location == "USA"
    input.user.attributes.department == "Eng"
    
    # User set exists
    some user_set_idx
    user_set := data.user_sets.result[user_set_idx]
    user_set.key == "engineerManagersUSA"
    
    # Permission exists
    some permission_idx
    permission := data.permissions.result[permission_idx]
    permission.role_id == "4df04635-3d1b-4b17-8736-64537449fb34"
    permission.action == "subscribe"
    
    # Resource conditions match
    input.resource.attributes.hasApproval == true
    input.resource.attributes.cost < 500
}
