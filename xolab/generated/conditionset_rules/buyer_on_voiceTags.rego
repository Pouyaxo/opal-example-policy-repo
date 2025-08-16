package xolab.generated.conditionset.rules

import future.keywords.in

import data.xolab.generated.abac.utils.attributes
import data.xolab.generated.conditionset

default buyer_on_voiceTags = false

buyer_on_voiceTags {
	conditionset.userset_buyer
	conditionset.resourceset_voiceTags
	input.action in data.condition_set_rules.buyer.voiceTags[input.resource.type]
}