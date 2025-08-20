package xolab.generated.conditionset

import future.keywords.in

import data.xolab.generated.abac.utils.attributes

default resourceset_equipment = false

resourceset_equipment {
	attributes.resource.type == "equipment"

}