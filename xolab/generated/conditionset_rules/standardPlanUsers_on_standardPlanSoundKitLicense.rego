package xolab.generated.conditionset.rules

import future.keywords.in

import data.xolab.generated.abac.utils.attributes
import data.xolab.generated.abac.utils.condition_set_permissions
import data.xolab.generated.conditionset

default standardPlanUsers_on_standardPlanSoundKitLicense = false

standardPlanUsers_on_standardPlanSoundKitLicense {
	conditionset.userset_standardPlanUsers
	conditionset.resourceset_standardPlanSoundKitLicense
	input.action in condition_set_permissions.standardPlanUsers.standardPlanSoundKitLicense[input.resource.type]
}