package xolab.generated.conditionset

import future.keywords.in

import data.xolab.generated.abac.utils.attributes

default userset_testUserSet = false

userset_testUserSet {
	attributes.user.department == "Eng"
		attributes.user.location == "NL"
}