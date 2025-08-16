package xolab.generated.conditionset.rules

import future.keywords.in

import data.xolab.generated.abac.utils.attributes
import data.xolab.generated.conditionset

default buyer_on_proPage = false

buyer_on_proPage {
	conditionset.userset_buyer
	conditionset.resourceset_proPage
	input.action in data.condition_set_rules.buyer.proPage[input.resource.type]
}