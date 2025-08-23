package xolab.generated.conditionset.rules

import future.keywords.in

import data.xolab.generated.abac.utils.attributes
import data.xolab.generated.abac.utils.condition_set_permissions
import data.xolab.generated.conditionset

default premiumPlanUsers_on_portfolio = false

premiumPlanUsers_on_portfolio {
	conditionset.userset_premiumPlanUsers
	conditionset.resourceset_portfolio
	input.action in condition_set_permissions.premiumPlanUsers.portfolio[input.resource.type]
}