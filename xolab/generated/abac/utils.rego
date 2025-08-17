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

# Transform flat role_permissions data into nested structure for policies
# This function builds the nested structure that policies expect
build_condition_set_permissions() = result {
  result := {
    userSetKey: {
      resourceSetKey: {
        resourceType: actions
      }
    } | some userSetKey, resourceSetKey, resourceType, actions
    # Find all userSet permissions
    some permission in data.permissions
    permission.role_type == "userSet"
    permission.resource_type == "resourceSet"
    permission.is_granted == true
    
         # Get the user set key by searching through the array
     some userSet in data.user_sets
     userSet.id == permission.role_id
     userSetKey := userSet.key
     
     # Get the resource set key by searching through the array
     some resourceSet in data.resource_sets
     resourceSet.id == permission.resource_id
     resourceSetKey := resourceSet.key
     
     # Get the resource type by searching through the array
     some resource in data.resources
     resource.id == resourceSet.resource_type_id
     resourceType := resource.key
    
    # Get all actions for this userSet-resourceSet combination
    actions := {action | some action; some perm in data.permissions; perm.role_type == "userSet"; perm.resource_type == "resourceSet"; perm.is_granted == true; perm.role_id == permission.role_id; perm.resource_id == permission.resource_id; action := perm.action}
  }
}

condition_set_permissions := build_condition_set_permissions()
