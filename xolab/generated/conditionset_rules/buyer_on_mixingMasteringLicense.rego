package xolab.generated.conditionset.rules

import future.keywords.in

import data.xolab.generated.abac.utils.attributes
import data.xolab.generated.conditionset

default buyer_on_mixingMasteringLicense = false

buyer_on_mixingMasteringLicense {
	conditionset.userset_buyer
	conditionset.resourceset_mixingMasteringLicense
	input.action in data.condition_set_rules.buyer.mixingMasteringLicense[input.resource.type]
}