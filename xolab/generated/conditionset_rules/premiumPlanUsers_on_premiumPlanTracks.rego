package xolab.generated.conditionset.rules

import future.keywords.in

import data.xolab.generated.abac.utils.attributes
import data.xolab.generated.abac.utils.condition_set_permissions
import data.xolab.generated.conditionset

default premiumPlanUsers_on_premiumPlanTracks = false

premiumPlanUsers_on_premiumPlanTracks {
	conditionset.userset_premiumPlanUsers
	conditionset.resourceset_premiumPlanTracks
	input.action in condition_set_permissions.__autogen_premiumPlanUsers.premiumPlanTracks[input.resource.type]
}