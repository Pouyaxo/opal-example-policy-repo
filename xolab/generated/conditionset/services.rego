package xolab.generated.conditionset

import future.keywords.in

import data.xolab.generated.abac.utils.attributes

default resourceset_services = false

resourceset_services {
	attributes.resource.type == "services"

}