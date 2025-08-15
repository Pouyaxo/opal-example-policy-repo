package simple

# Simple test to see if we can access users data
test_users {
    data.users.result
}

# Test if we can find our specific user
test_find_user {
    some user_idx
    user := data.users.result[user_idx]
    user.email == "test-user5@test.com"
}
