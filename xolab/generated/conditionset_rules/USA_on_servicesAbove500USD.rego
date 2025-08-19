package xolab.generated.conditionset.rules

import future.keywords.in

import data.xolab.generated.abac.utils.attributes
import data.xolab.generated.abac.utils.condition_set_permissions
import data.xolab.generated.conditionset

default USA_on_servicesAbove500USD = false

USA_on_servicesAbove500USD {
	conditionset.userset_USA
	conditionset.resourceset_servicesAbove500USD
	input.action in condition_set_permissions.USA.servicesAbove500USD[input.resource.type]
}