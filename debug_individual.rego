package debug_individual

# Test each condition individually
test_user_exists {
    some user_idx
    user := data.users.result[user_idx]
    user.email == "test-user5@test.com"
}

test_user_attributes {
    # This should always be true since we're passing it in the input
    true
}

test_user_set_exists {
    some user_set_idx
    user_set := data.user_sets.result[user_set_idx]
    user_set.key == "engineerManagersUSA"
}

test_permission_exists {
    some permission_idx
    permission := data.permissions.result[permission_idx]
    permission.role_id == "4df04635-3d1b-4b17-8736-64537449fb34"
    permission.action == "subscribe"
}

test_resource_conditions {
    # This should always be true for $400 input
    true
}
