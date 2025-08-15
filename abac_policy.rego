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
    some permission_idx
    permission := data.permissions[permission_idx]
    permission.role_id == user_role
    permission.resource_type == input.resource.type
    permission.action == input.action
    permission.is_granted == true
    
    # Check if user matches any user set conditions
    some user_set_idx
    user_set := data.user_sets[user_set_idx]
    user_set.role_id == user.role
    
    some user_condition_idx
    user_condition := data.user_set_conditions[user_condition_idx]
    user_condition.user_set_id == user_set.id
    
    # Get the attribute name from the joined data
    attr_name := user_condition.attribute_name
    attr_value := input.user.attributes[attr_name]
    
    # Check if the condition is satisfied
    user_condition.operator == "equals"
    attr_value == user_condition.comparison_value
    
    # Check if resource matches any resource set conditions
    some resource_set_idx
    resource_set := data.resource_sets[resource_set_idx]
    resource_set.key == "services"
    
    some resource_condition_idx
    resource_condition := data.resource_set_conditions[resource_condition_idx]
    resource_condition.resource_set_id == resource_set.id
    
    # Get the resource attribute name from the joined data
    resource_attr_name := resource_condition.attribute_name
    resource_attr_value := input.resource.attributes[resource_attr_name]
    
    # Check resource conditions based on operator
    (resource_condition.operator == "equals" && resource_attr_value == resource_condition.comparison_value) ||
    (resource_condition.operator == "less-than" && to_number(resource_attr_value) < to_number(resource_condition.comparison_value)) ||
    (resource_condition.operator == "greater-than-or-equals" && to_number(resource_attr_value) >= to_number(resource_condition.comparison_value))
}

# Helper function to convert string to number
to_number(value) = output {
    output := to_number(value)
}
