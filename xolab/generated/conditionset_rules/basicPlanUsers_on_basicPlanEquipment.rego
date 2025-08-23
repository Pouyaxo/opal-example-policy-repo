package xolab.generated.conditionset.rules

import future.keywords.in

import data.xolab.generated.abac.utils.attributes
import data.xolab.generated.abac.utils.condition_set_permissions
import data.xolab.generated.conditionset

default basicPlanUsers_on_basicPlanEquipment = false

basicPlanUsers_on_basicPlanEquipment {
	conditionset.userset_basicPlanUsers
	conditionset.resourceset_basicPlanEquipment
	input.action in condition_set_permissions.basicPlanUsers.basicPlanEquipment[input.resource.type]
}