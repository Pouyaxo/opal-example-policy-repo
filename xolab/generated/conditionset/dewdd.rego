package xolab.generated.conditionset

import future.keywords.in

import data.xolab.generated.abac.utils.attributes

default userset_dewdd = false

userset_dewdd {
	"dewdd" in attributes.user.roles
}