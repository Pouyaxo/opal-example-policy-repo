package xolab.generated.conditionset

import future.keywords.in

import data.xolab.generated.abac.utils.attributes

default userset_test = false

userset_test {
	attributes.user.location == "USA"
}