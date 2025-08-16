package xolab.generated.conditionset

import future.keywords.in

import data.xolab.generated.abac.utils.attributes

default resourceset_servicesAbove500USD = false

resourceset_servicesAbove500USD {
	attributes.resource.type == "Services"
	attributes.resource.cost greaterThanOrEqual "500"
		attributes.resource.hasApproval equals true
}