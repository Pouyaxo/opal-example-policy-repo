package xolab.generated.conditionset

import future.keywords.in

import data.xolab.generated.abac.utils.attributes

default userset_USA = false

userset_USA {
	attributes.user.location == "USA"
	attributes.user.department == "Eng"
}