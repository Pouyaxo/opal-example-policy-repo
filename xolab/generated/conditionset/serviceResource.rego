package xolab.generated.conditionset

import future.keywords.in

import data.xolab.generated.abac.utils.attributes

default resourceset_serviceResource = false

resourceset_serviceResource {
	attributes.resource.type == "serviceResource"

}