package xolab.generated.conditionset.rules

import future.keywords.in

import data.xolab.generated.abac.utils.attributes
import data.xolab.generated.abac.utils.condition_set_permissions
import data.xolab.generated.conditionset

default seller_on_proPage = false

seller_on_proPage {
	conditionset.userset__5f_5fautogen_5fseller
	conditionset.resourceset__5f_5fautogen_5fproPage
	input.action in condition_set_permissions.__autogen_seller.__autogen_proPage[input.resource.type]
}