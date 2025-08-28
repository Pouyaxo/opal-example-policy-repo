package xolab.generated.conditionset

import future.keywords.in

import data.xolab.generated.abac.utils.attributes

default userset_csscs = false

userset_csscs {
	"csscs" in attributes.user.roles
}