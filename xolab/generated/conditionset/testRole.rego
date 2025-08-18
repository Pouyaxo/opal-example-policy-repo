package xolab.generated.conditionset

import future.keywords.in

import data.xolab.generated.abac.utils.attributes

default userset_testRole = false

userset_testRole {
	"testRole" in attributes.user.roles
}