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
    has_permission(user_role, input.resource.type, input.action)
    
    # Check if user matches any user set conditions
    user_matches_conditions(user_role, input.user.attributes)
    
    # Check if resource matches any resource set conditions
    resource_matches_conditions(input.resource.attributes)
}

# Check if user has permission
has_permission(role_id, resource_type, action) {
    some permission_var
    permission_var := data.permissions[_]
    permission_var.role_id == role_id
    permission_var.resource_type == resource_type
    permission_var.action == action
    permission_var.is_granted == true
}

# Check if user matches user set conditions
user_matches_conditions(role_id, user_attributes) {
    some user_set_var
    user_set_var := data.user_sets[_]
    user_set_var.role_id == role_id
    
    some user_condition_var
    user_condition_var := data.user_set_conditions[_]
    user_condition_var.user_set_id == user_set_var.id
    
    # Check if the condition is satisfied
    attr_name := user_condition_var.attribute_name
    attr_value := user_attributes[attr_name]
    user_condition_var.operator == "equals"
    attr_value == user_condition_var.comparison_value
}

# Check if resource matches resource set conditions
resource_matches_conditions(resource_attributes) {
    some resource_set_var
    resource_set_var := data.resource_sets[_]
    resource_set_var.key == "services"  # For services resource type
    
    some resource_condition_var
    resource_condition_var := data.resource_set_conditions[_]
    resource_condition_var.resource_set_id == resource_set_var.id
    
    # Check if the resource condition is satisfied
    resource_condition_satisfied(resource_condition_var, resource_attributes)
}

# Helper rule for equals operator
resource_condition_satisfied(condition, attributes) {
    condition.operator == "equals"
    attr_name := condition.attribute_name
    attr_value := attributes[attr_name]
    attr_value == condition.comparison_value
}

# Helper rule for less-than operator
resource_condition_satisfied(condition, attributes) {
    condition.operator == "less-than"
    attr_name := condition.attribute_name
    attr_value := attributes[attr_name]
    to_number(attr_value) < to_number(condition.comparison_value)
}

# Helper rule for greater-than-or-equals operator
resource_condition_satisfied(condition, attributes) {
    condition.operator == "greater-than-or-equals"
    attr_name := condition.attribute_name
    attr_value := attributes[attr_name]
    to_number(attr_value) >= to_number(condition.comparison_value)
}

# Convert string to number
to_number(value) = output {
    output := to_number(value)
}
