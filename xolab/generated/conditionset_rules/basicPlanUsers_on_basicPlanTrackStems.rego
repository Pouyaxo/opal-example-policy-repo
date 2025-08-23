package xolab.generated.conditionset.rules

import future.keywords.in

import data.xolab.generated.abac.utils.attributes
import data.xolab.generated.abac.utils.condition_set_permissions
import data.xolab.generated.conditionset

default basicPlanUsers_on_basicPlanTrackStems = false

basicPlanUsers_on_basicPlanTrackStems {
	conditionset.userset_basicPlanUsers
	conditionset.resourceset_basicPlanTrackStems
	input.action in condition_set_permissions.basicPlanUsers.basicPlanTrackStems[input.resource.type]
}