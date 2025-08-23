package xolab.generated.conditionset.rules

import future.keywords.in

import data.xolab.generated.abac.utils.attributes
import data.xolab.generated.abac.utils.condition_set_permissions
import data.xolab.generated.conditionset

default standardPlanUsers_on_trackCollaborator = false

standardPlanUsers_on_trackCollaborator {
	conditionset.userset_standardPlanUsers
	conditionset.resourceset_trackCollaborator
	input.action in condition_set_permissions.standardPlanUsers.trackCollaborator[input.resource.type]
}