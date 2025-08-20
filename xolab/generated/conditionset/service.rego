package xolab.generated.conditionset

import future.keywords.in

import data.xolab.generated.abac.utils.attributes

default resourceset_service = false

resourceset_service {
	attributes.resource.type == "service"

}