package xolab.generated.conditionset

import future.keywords.in

import data.xolab.generated.abac.utils.attributes

default debug_resource_set = false

debug_resource_set {
	# Test first condition
	attributes.resource.type == "track"
}

default debug_resource_set_condition1 = false

debug_resource_set_condition1 {
	# Test first condition only
	attributes.resource.type == "track"
}

default debug_resource_set_condition2 = false

debug_resource_set_condition2 {
	# Test second condition only
	attributes.resource.planTrackLimit > attributes.user.currentTrackCount
}
