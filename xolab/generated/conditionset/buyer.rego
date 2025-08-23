package xolab.generated.conditionset

import future.keywords.in

import data.xolab.generated.abac.utils.attributes

default userset_buyer = false

userset_buyer {
	"buyer" in attributes.user.roles
}