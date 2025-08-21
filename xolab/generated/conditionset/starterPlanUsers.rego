package xolab.generated.conditionset

import future.keywords.in

import data.xolab.generated.abac.utils.attributes

default userset_starterPlanUsers = false

userset_starterPlanUsers {
	attributes.user.subscriptionPlan == "starter"
}