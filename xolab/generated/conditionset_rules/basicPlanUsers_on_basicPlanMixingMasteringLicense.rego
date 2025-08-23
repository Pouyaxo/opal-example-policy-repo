package xolab.generated.conditionset.rules

import future.keywords.in

import data.xolab.generated.abac.utils.attributes
import data.xolab.generated.abac.utils.condition_set_permissions
import data.xolab.generated.conditionset

default basicPlanUsers_on_basicPlanMixingMasteringLicense = false

basicPlanUsers_on_basicPlanMixingMasteringLicense {
	conditionset.userset_basicPlanUsers
	conditionset.resourceset_basicPlanMixingMasteringLicense
	input.action in condition_set_permissions.basicPlanUsers.basicPlanMixingMasteringLicense[input.resource.type]
}