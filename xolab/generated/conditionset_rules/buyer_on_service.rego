package xolab.generated.conditionset.rules

import future.keywords.in

import data.xolab.generated.abac.utils.attributes
import data.xolab.generated.abac.utils.condition_set_permissions
import data.xolab.generated.conditionset

default buyer_on_service = false

buyer_on_service {
	conditionset.userset_buyer
	conditionset.resourceset_service
	input.action in condition_set_permissions.buyer.service[input.resource.type]
}