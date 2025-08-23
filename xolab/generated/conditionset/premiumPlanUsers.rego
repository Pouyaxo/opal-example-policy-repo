package xolab.generated.conditionset

import future.keywords.in

import data.xolab.generated.abac.utils.attributes

default userset_premiumPlanUsers = false

userset_premiumPlanUsers {
	attributes.user.subscriptionPlan == "premium"
}