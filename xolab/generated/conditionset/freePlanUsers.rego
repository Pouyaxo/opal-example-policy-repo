package xolab.generated.conditionset

import future.keywords.in

import data.xolab.generated.abac.utils.attributes

default userset_freePlanUsers = false

userset_freePlanUsers {
	attributes.user.subscriptionPlan == "free"
}