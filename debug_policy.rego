package debug

# Test if user exists
user_exists {
    some user_idx
    user := data.users.result[user_idx]
    user.email == input.user.key
}

# Test if user has location attribute
user_has_location {
    some user_idx
    user := data.users.result[user_idx]
    user.email == input.user.key
    
    some user_attr_idx
    user_attr := data.user_attributes.result[user_attr_idx]
    user_attr.user_id == user.id
    user_attr.attribute_name == "location"
    user_attr.value == input.user.attributes.location
}

# Test if user has department attribute
user_has_department {
    some user_idx
    user := data.users.result[user_idx]
    user.email == input.user.key
    
    some user_attr_idx
    user_attr := data.user_attributes.result[user_attr_idx]
    user_attr.user_id == user.id
    user_attr.attribute_name == "department"
    user_attr.value == input.user.attributes.department
}

# Test if user set exists
user_set_exists {
    some user_set_idx
    user_set := data.user_sets.result[user_set_idx]
    user_set.key == "engineerManagersUSA"
    user_set.is_active == true
}

# Test if user set conditions match
user_set_conditions_match {
    some user_idx
    user := data.users.result[user_idx]
    user.email == input.user.key
    
    some user_set_idx
    user_set := data.user_sets.result[user_set_idx]
    user_set.key == "engineerManagersUSA"
    user_set.is_active == true
    
    some user_condition_idx
    user_condition := data.user_set_conditions.result[user_condition_idx]
    user_condition.user_set_id == user_set.id
    
    some user_attr_idx
    user_attr := data.user_attributes.result[user_attr_idx]
    user_attr.user_id == user.id
    user_attr.attribute_name == user_condition.attribute_name
    user_attr.value == user_condition.comparison_value
}
