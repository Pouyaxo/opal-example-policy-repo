package xolab.generated.conditionset.rules

import future.keywords.in

import data.xolab.generated.abac.utils.attributes
import data.xolab.generated.abac.utils.condition_set_permissions
import data.xolab.generated.conditionset

default proPlanUsers_on_proPlanTracks = false

proPlanUsers_on_proPlanTracks {
	conditionset.userset_proPlanUsers
	conditionset.resourceset_proPlanTracks
	input.action in condition_set_permissions.proPlanUsers.proPlanTracks[input.resource.type]
}