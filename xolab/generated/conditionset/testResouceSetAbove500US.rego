package xolab.generated.conditionset

import future.keywords.in

import data.xolab.generated.abac.utils.attributes

default resourceset_testResouceSetAbove500US = false

resourceset_testResouceSetAbove500US {
	attributes.resource.type == "services"
	attributes.resource.cost >= 500
		attributes.resource.hasApproval == true
}