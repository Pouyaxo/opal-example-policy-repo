package xolab.generated.abac.utils

import future.keywords.in

# not undefined if object 'x' has a key 'k'
has_key(x, k) {
	_ := x[k]
}

# If a field 'k' relies in both 'a' and 'b' objects, pick its value from 'a'.
pick_first(k, a, b) = a[k] {
	has_key(a, k)
}

else = b[k] {
	true
}

# Merging objects a & b. If a field relies in both of them, pick it's value from a.
merge_objects(a, b) = c {
	ks := {k | some k; _ = a[k]} | {k | some k; _ = b[k]}
	c := {k: v | some k; ks[k]; v := pick_first(k, b, a)}
}

roles[roleKey] {
	some roleKey in data.users[input.user.key].roleAssignments[input.resource.tenant]
}

__generated_user_attributes = {"roles": roles}

__generated_resource_attributes = {"type": input.resource.type}

default __stored_user_attributes = {}

__stored_user_attributes = data.users[input.user.key].attributes

default __input_user_attributes = {}

default __input_resource_attributes = {}

default __input_context_attributes = {}

__input_user_attributes = input.user.attributes

__input_resource_attributes = input.resource.attributes

__input_context_attributes = input.context

__user_attributes = merge_objects(__input_user_attributes, __stored_user_attributes)

attributes = {
	"user": merge_objects(__user_attributes, __generated_user_attributes),
	"resource": merge_objects(__input_resource_attributes, __generated_resource_attributes),
	"context": __input_context_attributes,
	# TODO: When we want to add data from system, use these
	#	"resource": merge_objects(__input_resource_attributes, data.resource[input.resource.id].attributes),
	#	"environment": merge_objects(__input_context_environment, data.environment.attributes),

}

# Build condition set permissions using simple rules
# This avoids all variable declaration conflicts by using basic rule syntax

# Test rule to see if we can access the data
test_permission := {
  "role_id": "e45bc594-13a3-4dcd-8adf-ce9790f15f85",
  "resource_id": "0cfa3683-7e60-4ddf-8c76-04bb906d49da",
  "action": "subscribe"
}

# Test individual parts of the logic
test_user_set_key := usk {
  some i
  permission := data.permissions[i]
  permission.role_type == "userSet"
  permission.resource_type == "resourceSet"
  permission.is_granted == true
  permission.role_id == "e45bc594-13a3-4dcd-8adf-ce9790f15f85"
  usk := data.user_sets[permission.role_id].key
}

test_resource_set_key := rsk {
  some i
  permission := data.permissions[i]
  permission.role_type == "userSet"
  permission.resource_type == "resourceSet"
  permission.is_granted == true
  permission.resource_id == "0cfa3683-7e60-4ddf-8c76-04bb906d49da"
  rsk := data.resource_sets[permission.resource_id].key
}

test_resource_type := rt {
  some i
  permission := data.permissions[i]
  permission.role_type == "userSet"
  permission.resource_type == "resourceSet"
  permission.is_granted == true
  permission.resource_id == "0cfa3683-7e60-4ddf-8c76-04bb906d49da"
  resource_type_id := data.resource_sets[permission.resource_id].resource_type_id
  rt := data.resources[resource_type_id].key
}

# Rule to add an action to a specific userSet-resourceSet-resourceType combination
condition_set_permissions[usk][rsk][rt] := action {
  some i
  permission := data.permissions[i]
  permission.role_type == "userSet"
  permission.resource_type == "resourceSet"
  permission.is_granted == true
  
  usk := data.user_sets[permission.role_id].key
  rsk := data.resource_sets[permission.resource_id].key
  
  # Get the resource type from the resource set's resource_type_id, then look up the resource type
  resource_type_id := data.resource_sets[permission.resource_id].resource_type_id
  rt := data.resources[resource_type_id].key
  
  action := permission.action
}