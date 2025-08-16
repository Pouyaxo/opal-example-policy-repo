package xolab.generated.conditionset

import future.keywords.in

import data.xolab.generated.abac.utils.attributes

default resourceset_servicesBelow500USD = false

resourceset_servicesBelow500USD {
	attributes.resource.type == "Services"
	attributes.resource.cost lessThan "500"
		attributes.resource.hasApproval equals true
}