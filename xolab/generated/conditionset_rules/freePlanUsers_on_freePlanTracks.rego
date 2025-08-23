package xolab.generated.conditionset.rules

import future.keywords.in

import data.xolab.generated.abac.utils.attributes
import data.xolab.generated.abac.utils.condition_set_permissions
import data.xolab.generated.conditionset

default freePlanUsers_on_freePlanTracks = false

freePlanUsers_on_freePlanTracks {
	conditionset.userset_freePlanUsers
	conditionset.resourceset_freePlanTracks
	input.action in condition_set_permissions.freePlanUsers.freePlanTracks[input.resource.type]
}