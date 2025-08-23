package xolab.generated.conditionset.rules

import future.keywords.in

import data.xolab.generated.abac.utils.attributes
import data.xolab.generated.abac.utils.condition_set_permissions
import data.xolab.generated.conditionset

default buyer_on_track = false

buyer_on_track {
	conditionset.userset_buyer
	conditionset.resourceset_track
	input.action in condition_set_permissions.buyer.track[input.resource.type]
}