package xolab.generated.conditionset

import future.keywords.in

import data.xolab.generated.abac.utils.attributes

default debug_attributes = false

debug_attributes {
	# Test if we can access user attributes
	attributes.user.subscriptionPlan == "free"
	attributes.user.currentTrackCount == 5
	# Test if we can access resource attributes
	attributes.resource.type == "track"
	attributes.resource.planTrackLimit == 10
	# Test the actual comparison - this should be TRUE (10 > 5)
	attributes.resource.planTrackLimit > attributes.user.currentTrackCount
}
