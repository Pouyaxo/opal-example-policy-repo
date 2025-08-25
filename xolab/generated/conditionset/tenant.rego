package xolab.generated.conditionset

import future.keywords.in

import data.xolab.generated.abac.utils.attributes

default resourceset_tenant = false

resourceset_tenant {
	attributes.resource.type == "tenant"
}