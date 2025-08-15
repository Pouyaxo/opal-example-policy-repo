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
    some user_set_item
    user_set_item := data.user_sets[_]
    user_set_item.role_id == user.role
    
    some user_condition_item
    user_condition_item := data.user_set_conditions[_]
    user_condition_item.user_set_id == user_set_item.id
    
    # Check if the condition is satisfied
    attr_name := user_condition_item.attribute_name
    attr_value := input.user.attributes[attr_name]
    user_condition_item.operator == "equals"
    attr_value == user_condition_item.comparison_value
    
    # Check if resource matches any resource set conditions
    some resource_set_item
    resource_set_item := data.resource_sets[_]
    resource_set_item.key == "services"  # For services resource type
    
    some resource_condition_item
    resource_condition_item := data.resource_set_conditions[_]
    resource_condition_item.resource_set_id == resource_set_item.id
    
    # Check if the resource condition is satisfied
    resource_attr_name := resource_condition_item.attribute_name
    resource_attr_value := input.resource.attributes[resource_attr_name]
    
    # Handle different operators
    (resource_condition_item.operator == "equals" && resource_attr_value == resource_condition_item.comparison_value) ||
    (resource_condition_item.operator == "less-than" && to_number(resource_attr_value) < to_number(resource_condition_item.comparison_value)) ||
    (resource_condition_item.operator == "greater-than-or-equals" && to_number(resource_attr_value) >= to_number(resource_condition_item.comparison_value))
}

# Convert string to number
to_number(value) = output {
    output := to_number(value)
}
