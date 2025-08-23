package xolab.generated.conditionset.rules

import future.keywords.in

import data.xolab.generated.abac.utils.attributes
import data.xolab.generated.abac.utils.condition_set_permissions
import data.xolab.generated.conditionset

default basicPlanUsers_on_basicPlanCouponDiscount = false

basicPlanUsers_on_basicPlanCouponDiscount {
	conditionset.userset_basicPlanUsers
	conditionset.resourceset_basicPlanCouponDiscount
	input.action in condition_set_permissions.basicPlanUsers.basicPlanCouponDiscount[input.resource.type]
}