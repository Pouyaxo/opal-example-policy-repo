package xolab.generated.conditionset

import future.keywords.in

import data.xolab.generated.abac.utils.attributes

default userset_proPlanUsers = false

userset_proPlanUsers {
	attributes.user.subscriptionPlan == "pro"
}