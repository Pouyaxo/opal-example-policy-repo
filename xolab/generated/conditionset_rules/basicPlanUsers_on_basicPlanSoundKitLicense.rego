package xolab.generated.conditionset.rules

import future.keywords.in

import data.xolab.generated.abac.utils.attributes
import data.xolab.generated.abac.utils.condition_set_permissions
import data.xolab.generated.conditionset

default basicPlanUsers_on_basicPlanSoundKitLicense = false

basicPlanUsers_on_basicPlanSoundKitLicense {
	conditionset.userset_basicPlanUsers
	conditionset.resourceset_basicPlanSoundKitLicense
	input.action in condition_set_permissions.basicPlanUsers.basicPlanSoundKitLicense[input.resource.type]
}