package xolab.generated.conditionset.rules

import future.keywords.in

import data.xolab.generated.abac.utils.attributes
import data.xolab.generated.abac.utils.condition_set_permissions
import data.xolab.generated.conditionset

default basicPlanUsers_on_trackStem = false

basicPlanUsers_on_trackStem {
	conditionset.userset_basicPlanUsers
	conditionset.resourceset_trackStem
	input.action in condition_set_permissions.basicPlanUsers.trackStem[input.resource.type]
}