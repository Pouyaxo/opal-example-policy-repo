package xolab.generated.conditionset.rules

import future.keywords.in

import data.xolab.generated.abac.utils.attributes
import data.xolab.generated.conditionset

default buyer_on_trackCollaborators = false

buyer_on_trackCollaborators {
	conditionset.userset_buyer
	conditionset.resourceset_trackCollaborators
	input.action in data.condition_set_rules.buyer.trackCollaborators[input.resource.type]
}