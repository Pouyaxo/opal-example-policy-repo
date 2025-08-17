package xolab.generated.conditionset

import future.keywords.in

import data.xolab.generated.abac.utils.attributes

default resourceset_testResouceSetBelow500USD = false

resourceset_testResouceSetBelow500USD {
	attributes.resource.type == "services"
	attributes.resource.cost < 500
		attributes.resource.hasApproval == true
}