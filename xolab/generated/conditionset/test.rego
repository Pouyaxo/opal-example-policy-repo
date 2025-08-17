package xolab.generated.conditionset

import future.keywords.in

import data.xolab.generated.abac.utils.attributes

default resourceset_test = false

resourceset_test {
	attributes.resource.type == "services"
	attributes.resource.cost < 500
		attributes.resource.hasApproval == true
}