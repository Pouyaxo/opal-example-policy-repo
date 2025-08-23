package xolab.generated.conditionset.rules

import future.keywords.in

import data.xolab.generated.abac.utils.attributes
import data.xolab.generated.abac.utils.condition_set_permissions
import data.xolab.generated.conditionset

default basicPlanUsers_on_basicPlanAudioComparison = false

basicPlanUsers_on_basicPlanAudioComparison {
	conditionset.userset_basicPlanUsers
	conditionset.resourceset_basicPlanAudioComparison
	input.action in condition_set_permissions.basicPlanUsers.basicPlanAudioComparison[input.resource.type]
}