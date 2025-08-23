package xolab.generated.conditionset

import future.keywords.in

import data.xolab.generated.abac.utils.attributes

default userset_basicPlanUsers = false

userset_basicPlanUsers {
	attributes.user.subscriptionPlan == "basic"
}