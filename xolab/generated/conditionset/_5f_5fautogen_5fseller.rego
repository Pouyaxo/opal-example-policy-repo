package xolab.generated.conditionset

import future.keywords.in

import data.xolab.generated.abac.utils.attributes

default userset__5f_5fautogen_5fseller = false

userset__5f_5fautogen_5fseller {
	"seller" in attributes.user.roles
}