package abac

import data.result

# Default deny
default allow = false

# Allow if user has permission based on ABAC evaluation
allow {
    # Get user data
    user := result.users[input.user.key]
    
    # Get user's role
    user_role := user.role
    
    # Check if user has any permissions for this action and resource type
    some permission
    permission := result.permissions[_]
    permission.role_id == user_role
    permission.resource_type == input.resource.type
    permission.action == input.action
    permission.is_granted == true
    
    # Check if user matches any user set conditions
    user_matches_user_set(user, input.user.attributes)
    
    # Check if resource matches any resource set conditions
    resource_matches_resource_set(input.resource.attributes)
}

# Helper function to check if user matches user set conditions
user_matches_user_set(user, user_attributes) {
    # Find a user set that matches the user's role
    some user_set
    user_set := result.user_sets[_]
    
    # Check if user set has the right role
    user_set.role_id == user.role
    
    # Check if user attributes match user set conditions
    user_attributes_match_conditions(user_attributes, user_set.id)
}

# Helper function to check if user attributes match user set conditions
user_attributes_match_conditions(user_attrs, user_set_id) {
    # Get all conditions for this user set
    some condition
    condition := result.user_set_conditions[_]
    condition.user_set_id == user_set_id
    
    # Check if the condition is satisfied
    condition_satisfied(condition, user_attrs)
}

# Helper function to check if a condition is satisfied
condition_satisfied(condition, user_attrs) {
    # Extract attribute name from condition
    attr_name := condition.attribute_name
    
    # Get attribute value from user attributes
    attr_value := user_attrs[attr_name]
    
    # Apply the operator
    apply_operator(condition.operator, attr_value, condition.comparison_value)
}

# Helper function to apply operators
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

# Helper function to check if resource matches resource set conditions
resource_matches_resource_set(resource_attrs) {
    # Find a resource set that matches the resource type
    some resource_set
    resource_set := result.resource_sets[_]
    resource_set.key == "services"  # For services resource type
    
    # Check if resource attributes match resource set conditions
    resource_attributes_match_conditions(resource_attrs, resource_set.id)
}

# Helper function to check if resource attributes match resource set conditions
resource_attributes_match_conditions(resource_attrs, resource_set_id) {
    # Get all conditions for this resource set
    some condition
    condition := result.resource_set_conditions[_]
    condition.resource_set_id == resource_set_id
    
    # Check if the condition is satisfied
    resource_condition_satisfied(condition, resource_attrs)
}

# Helper function to check if a resource condition is satisfied
resource_condition_satisfied(condition, resource_attrs) {
    # Extract attribute name from condition
    attr_name := condition.attribute_name
    
    # Get attribute value from resource attributes
    attr_value := resource_attrs[attr_name]
    
    # Apply the operator
    apply_operator(condition.operator, attr_value, condition.comparison_value)
}

# Helper function to convert string to number
to_number(value) = output {
    output := to_number(value)
}
