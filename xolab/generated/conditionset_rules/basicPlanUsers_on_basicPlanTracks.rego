package xolab.generated.conditionset.rules

import future.keywords.in

import data.xolab.generated.abac.utils.attributes
import data.xolab.generated.abac.utils.condition_set_permissions
import data.xolab.generated.conditionset

default basicPlanUsers_on_basicPlanTracks = false

basicPlanUsers_on_basicPlanTracks {
	conditionset.userset_basicPlanUsers
	conditionset.resourceset_basicPlanTracks
	input.action in condition_set_permissions.basicPlanUsers.basicPlanTracks[input.resource.type]
}