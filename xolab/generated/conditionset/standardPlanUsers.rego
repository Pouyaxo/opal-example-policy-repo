package xolab.generated.conditionset

import future.keywords.in

import data.xolab.generated.abac.utils.attributes

default userset_standardPlanUsers = false

userset_standardPlanUsers {
	attributes.user.subscriptionPlan == "standard"
}