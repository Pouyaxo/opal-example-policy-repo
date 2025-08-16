package xolab.generated.conditionset.rules

import future.keywords.in

import data.xolab.generated.abac.utils.attributes
import data.xolab.generated.conditionset

default buyer_on_services = false

buyer_on_services {
	conditionset.userset_buyer
	conditionset.resourceset_services
	input.action in data.condition_set_rules.buyer.services[input.resource.type]
}