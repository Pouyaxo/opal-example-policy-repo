package xolab.generated.conditionset

import future.keywords.in

import data.xolab.generated.abac.utils.attributes

default userset_seller = false

userset_seller {
	"seller" in attributes.user.roles
}