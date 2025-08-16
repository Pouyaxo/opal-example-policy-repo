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

# Get user roles from database (this was missing!)
roles[roleKey] {
	some roleKey in data.users[input.user.key].roleAssignments[input.resource.tenant]
}

# Use dynamic roles instead of static default
__generated_user_attributes = {"roles": roles}

__generated_resource_attributes = {"type": input.resource.type}

default __stored_user_attributes = {}

default __input_user_attributes = {}

default __input_resource_attributes = {}

default __input_context_attributes = {}

# Get stored user attributes from database
__stored_user_attributes = data.users[input.user.key].attributes

# Get input attributes from request
__input_user_attributes = input.user.attributes
__input_resource_attributes = input.resource.attributes
__input_context_attributes = input.context

# Merge all user attributes (stored + input + generated)
__user_attributes = merge_objects(__input_user_attributes, __stored_user_attributes)

# Final attributes object
attributes = {
	"user": merge_objects(__user_attributes, __generated_user_attributes),
	"resource": merge_objects(__input_resource_attributes, __generated_resource_attributes),
	"context": __input_context_attributes,
}

# Load permissions from database
condition_set_permissions := data.condition_set_rules