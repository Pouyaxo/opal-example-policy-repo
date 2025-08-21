package xolab.generated.conditionset.rules

import future.keywords.in

import data.xolab.generated.abac.utils.attributes
import data.xolab.generated.abac.utils.condition_set_permissions
import data.xolab.generated.conditionset

default starterPlanUsers_on_starterPlanTrackCollaborators = false

starterPlanUsers_on_starterPlanTrackCollaborators {
	conditionset.userset_starterPlanUsers
	conditionset.resourceset_starterPlanTrackCollaborators
	input.action in condition_set_permissions.starterPlanUsers.starterPlanTrackCollaborators[input.resource.type]
}