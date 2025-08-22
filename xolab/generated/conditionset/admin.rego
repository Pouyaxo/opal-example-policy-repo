package xolab.generated.conditionset

import future.keywords.in

import data.xolab.generated.abac.utils.attributes

default userset_admin = false

userset_admin {
	"admin" in attributes.user.roles
}