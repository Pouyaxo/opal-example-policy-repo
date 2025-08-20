package xolab.generated.conditionset

import future.keywords.in

import data.xolab.generated.abac.utils.attributes

default resourceset_test-resource = false

resourceset_test-resource {
	attributes.resource.type == "test-resource"

}