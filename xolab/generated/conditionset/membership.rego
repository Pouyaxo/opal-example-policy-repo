package xolab.generated.conditionset

import future.keywords.in

import data.xolab.generated.abac.utils.attributes

default resourceset_membership = false

resourceset_membership {
	attributes.resource.type == "membership"

}