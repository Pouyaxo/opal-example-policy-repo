package abac

# Default deny
default allow = false

# Allow if user has permission based on ABAC evaluation
allow {
    # Get user data
    user := data.users[input.user.key]
    
    # Get user's role
    user_role := user.role
    
    # Check if user has any permissions for this action and resource type
    some permission_item
    permission_item := data.permissions[_]
    permission_item.role_id == user_role
    permission_item.resource_type == input.resource.type
    permission_item.action == input.action
    permission_item.is_granted == true
    
    # Check if user matches any user set conditions
    user_matches_user_set(user, input.user.attributes)
    
    # Check if resource matches any resource set conditions
    resource_matches_resource_set(input.resource.attributes)
}

# Check if user matches user set conditions
user_matches_user_set(user, user_attributes) {
    # Find a user set that matches the user's role
    some user_set_item
    user_set_item := data.user_sets[_]
    user_set_item.role_id == user.role
    
    # Check if user attributes match user set conditions
    some user_condition_item
    user_condition_item := data.user_set_conditions[_]
    user_condition_item.user_set_id == user_set_item.id
    
    # Check if the condition is satisfied
    condition_satisfied(user_condition_item, user_attributes)
}

# Check if a condition is satisfied
condition_satisfied(condition_item, user_attrs) {
    # Extract attribute name from condition
    attr_name := condition_item.attribute_name
    
    # Get attribute value from user attributes
    attr_value := user_attrs[attr_name]
    
    # Apply the operator
    apply_operator(condition_item.operator, attr_value, condition_item.comparison_value)
}

# Apply operators
apply_operator(operator, value, comparison_value) {
    operator == "equals"
    value == comparison_value
}

apply_operator(operator, value, comparison_value) {
    operator == "greater-than"
    to_number(value) > to_number(comparison_value)
}

apply_operator(operator, value, comparison_value) {
    operator == "less-than"
    to_number(value) < to_number(comparison_value)
}

apply_operator(operator, value, comparison_value) {
    operator == "greater-than-or-equals"
    to_number(value) >= to_number(comparison_value)
}

apply_operator(operator, value, comparison_value) {
    operator == "less-than-or-equals"
    to_number(value) <= to_number(comparison_value)
}

# Check if resource matches resource set conditions
resource_matches_resource_set(resource_attrs) {
    # Find a resource set that matches the resource type
    some resource_set_item
    resource_set_item := data.resource_sets[_]
    resource_set_item.key == "services"  # For services resource type
    
    # Check if resource attributes match resource set conditions
    some resource_condition_item
    resource_condition_item := data.resource_set_conditions[_]
    resource_condition_item.resource_set_id == resource_set_item.id
    
    # Check if the condition is satisfied
    resource_condition_satisfied(resource_condition_item, resource_attrs)
}

# Check if a resource condition is satisfied
resource_condition_satisfied(condition_item, resource_attrs) {
    # Extract attribute name from condition
    attr_name := condition_item.attribute_name
    
    # Get attribute value from resource attributes
    attr_value := resource_attrs[attr_name]
    
    # Apply the operator
    apply_operator(condition_item.operator, attr_value, condition_item.comparison_value)
}

# Convert string to number
to_number(value) = output {
    output := to_number(value)
}
