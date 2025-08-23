package xolab.generated.conditionset.rules

import future.keywords.in

import data.xolab.generated.abac.utils.attributes
import data.xolab.generated.abac.utils.condition_set_permissions
import data.xolab.generated.conditionset

default standardPlanUsers_on_standardPlanMixingMasteringLicense = false

standardPlanUsers_on_standardPlanMixingMasteringLicense {
	conditionset.userset_standardPlanUsers
	conditionset.resourceset_standardPlanMixingMasteringLicense
	input.action in condition_set_permissions.standardPlanUsers.standardPlanMixingMasteringLicense[input.resource.type]
}