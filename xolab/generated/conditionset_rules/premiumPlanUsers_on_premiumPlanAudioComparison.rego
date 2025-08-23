package xolab.generated.conditionset.rules

import future.keywords.in

import data.xolab.generated.abac.utils.attributes
import data.xolab.generated.abac.utils.condition_set_permissions
import data.xolab.generated.conditionset

default premiumPlanUsers_on_premiumPlanAudioComparison = false

premiumPlanUsers_on_premiumPlanAudioComparison {
	conditionset.userset_premiumPlanUsers
	conditionset.resourceset_premiumPlanAudioComparison
	input.action in condition_set_permissions.premiumPlanUsers.premiumPlanAudioComparison[input.resource.type]
}