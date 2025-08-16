package xolab.abac

import future.keywords.in

import data.xolab.generated.conditionset
import data.xolab.generated.abac.utils.attributes

default allow := false

allow {
	count(allowing_rules) > 0
}

allowing_rules[rule] {
	some rule, value in conditionset.rules
	value == true
}

# Helper function to decode condition set keys
decode_condition_set_key(key) = value {
	value := data.condition_sets[key].key
} else = key {
	true
}

# Find matching usersets
matching_usersets[userset] {
	some set, value in conditionset
	startswith(set, "userset_")
	value == true
	userset := decode_condition_set_key(set)
}

# Find matching resourcesets
matching_resourcesets[resourceset] {
	some set, value in conditionset
	startswith(set, "resourceset_")
	value == true
	resourceset := decode_condition_set_key(set)
}

# Get permissions for usersets
userset_permissions[userset] := resourceset_permissions {
	some userset in matching_usersets
	resourceset_permissions := {resourceset: permissions |
		some resourceset in matching_resourcesets
		permissions := attributes.condition_set_permissions[userset][resourceset]
	}
}

# Get all usersets
usersets[set] {
	some _set, _ in conditionset
	startswith(_set, "userset_")
	not startswith(_set, "userset__5f_5fautogen")
	set := decode_condition_set_key(_set)
}

# Get all resourcesets
resourcesets[set] {
	some _set, _ in conditionset
	startswith(_set, "resourceset_")
	not startswith(_set, "resourceset__5f_5fautogen")
	set := decode_condition_set_key(_set)
}

default activated := false

# ABAC is activated if there are any usersets or resourcesets
activated {
	count(usersets) > 0
}

activated {
	count(resourcesets) > 0
}