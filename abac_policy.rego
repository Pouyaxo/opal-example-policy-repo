package abac

# Default deny - secure by default
default allow = false

# ABAC Policy: Allow access based on user and resource attributes
allow {
    # Get user data from the database
    some user_idx
    user := data.users.result[user_idx]
    user.email == input.user.key
    
    # Check if user matches user set conditions (location, department, etc.)
    some user_set_idx
    user_set := data.user_sets.result[user_set_idx]
    
    # Check if user set is active
    user_set.is_active == true
    
    # Check if user matches user set conditions
    some user_condition_idx
    user_condition := data.user_set_conditions.result[user_condition_idx]
    user_condition.user_set_id == user_set.id
    
    # Get the attribute name and value from the condition
    attr_name := user_condition.attribute_name
    user_attr_value := input.user.attributes[attr_name]
    
    # Check if the user condition is satisfied
    user_condition.operator == "equals"
    user_attr_value == user_condition.comparison_value
    
    # Check if user has permission for this action and resource type
    some permission_idx
    permission := data.permissions.result[permission_idx]
    permission.role_id == user_set.id
    permission.role_type == "userSet"
    permission.resource_type == "resourceSet"
    permission.action == input.action
    permission.is_granted == true
    
    # Get the resource set that permission grants access to
    some resource_set_idx
    resource_set := data.resource_sets.result[resource_set_idx]
    resource_set.id == permission.resource_id
    resource_set.is_active == true
    
    # Check if resource matches resource set conditions
    some resource_condition_idx
    resource_condition := data.resource_set_conditions.result[resource_condition_idx]
    resource_condition.resource_set_id == resource_set.id
    
    # Get the resource attribute name and value
    resource_attr_name := resource_condition.attribute_name
    resource_attr_value := input.resource.attributes[resource_attr_name]
    
    # Check resource conditions based on operator
    check_resource_condition(resource_condition.operator, resource_attr_value, resource_condition.comparison_value)
}

# Helper function to check resource conditions
check_resource_condition(operator, attr_value, comparison_value) {
    operator == "equals"
    attr_value == comparison_value
}

check_resource_condition(operator, attr_value, comparison_value) {
    operator == "lessThan"
    to_number(attr_value) < to_number(comparison_value)
}

check_resource_condition(operator, attr_value, comparison_value) {
    operator == "greaterThanOrEqual"
    to_number(attr_value) >= to_number(comparison_value)
}
