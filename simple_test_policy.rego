package simple_test

# Default deny
default allow = false

# Simple allow rule
allow {
    input.user.key == "test-user5@test.com"
    input.action == "subscribe"
    input.resource.type == "services"
}
