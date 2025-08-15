package abac

# Default deny
default allow = false

# Allow if user has permission based on ABAC evaluation
# Using unique variable names to avoid scoping conflicts
allow {
    # Get user data
    user := data.users[input.user.key]
    
    # Get user's role
    user_role := user.role
    
    # Check if user has any permissions for this action and resource type
    some permission_idx_1
    permission_1 := data.permissions[permission_idx_1]
    permission_1.role_id == user_role
    permission_1.resource_type == input.resource.type
    permission_1.action == input.action
    permission_1.is_granted == true
    
    # Check if user matches any user set conditions
    some user_set_idx_1
    user_set_1 := data.user_sets[user_set_idx_1]
    user_set_1.role_id == user_role
    
    some user_condition_idx_1
    user_condition_1 := data.user_set_conditions[user_condition_idx_1]
    user_condition_1.user_set_id == user_set_1.id
    
    # Check if the user condition is satisfied
    user_attr_name_1 := user_condition_1.attribute_name
    user_attr_value_1 := input.user.attributes[user_attr_name_1]
    user_condition_1.operator == "equals"
    user_attr_value_1 == user_condition_1.comparison_value
    
    # Check if resource matches any resource set conditions
    some resource_set_idx_1
    resource_set_1 := data.resource_sets[resource_set_idx_1]
    resource_set_1.key == "services"  # For services resource type
    
    some resource_condition_idx_1
    resource_condition_1 := data.resource_set_conditions[resource_condition_idx_1]
    resource_condition_1.resource_set_id == resource_set_1.id
    
    # Check if the resource condition is satisfied
    resource_attr_name_1 := resource_condition_1.attribute_name
    resource_attr_value_1 := input.resource.attributes[resource_attr_name_1]
    
    # Handle different operators using inline logic
    (resource_condition_1.operator == "equals" && resource_attr_value_1 == resource_condition_1.comparison_value) ||
    (resource_condition_1.operator == "less-than" && to_number(resource_attr_value_1) < to_number(resource_condition_1.comparison_value)) ||
    (resource_condition_1.operator == "greater-than-or-equals" && to_number(resource_attr_value_1) >= to_number(resource_condition_1.comparison_value))
}

# Convert string to number
to_number(value) = output {
    output := to_number(value)
}
