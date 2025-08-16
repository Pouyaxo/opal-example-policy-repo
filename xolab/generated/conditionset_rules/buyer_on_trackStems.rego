package xolab.generated.conditionset.rules

import future.keywords.in

import data.xolab.generated.abac.utils.attributes
import data.xolab.generated.conditionset

default buyer_on_trackStems = false

buyer_on_trackStems {
	conditionset.userset_buyer
	conditionset.resourceset_trackStems
	input.action in data.condition_set_rules.buyer.trackStems[input.resource.type]
}