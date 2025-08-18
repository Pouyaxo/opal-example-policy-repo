package xolab.generated.conditionset

import future.keywords.in

import data.xolab.generated.abac.utils.attributes

default userset_testRoleKey = false

userset_testRoleKey {
	"testRoleKey" in attributes.user.roles
}