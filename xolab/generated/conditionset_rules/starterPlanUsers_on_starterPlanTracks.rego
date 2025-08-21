package xolab.generated.conditionset.rules

import future.keywords.in

import data.xolab.generated.abac.utils.attributes
import data.xolab.generated.abac.utils.condition_set_permissions
import data.xolab.generated.conditionset

default starterPlanUsers_on_starterPlanTracks = false

starterPlanUsers_on_starterPlanTracks {
	conditionset.userset_starterPlanUsers
	conditionset.resourceset_starterPlanTracks
	input.action in condition_set_permissions.starterPlanUsers.starterPlanTracks[input.resource.type]
}