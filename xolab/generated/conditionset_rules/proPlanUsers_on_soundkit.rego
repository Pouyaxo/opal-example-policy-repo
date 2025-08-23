package xolab.generated.conditionset.rules

import future.keywords.in

import data.xolab.generated.abac.utils.attributes
import data.xolab.generated.abac.utils.condition_set_permissions
import data.xolab.generated.conditionset

default proPlanUsers_on_soundkit = false

proPlanUsers_on_soundkit {
	conditionset.userset_proPlanUsers
	conditionset.resourceset_soundkit
	input.action in condition_set_permissions.proPlanUsers.soundkit[input.resource.type]
}