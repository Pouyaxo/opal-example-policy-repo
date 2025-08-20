package xolab.generated.conditionset.rules

import future.keywords.in

import data.xolab.generated.abac.utils.attributes
import data.xolab.generated.abac.utils.condition_set_permissions
import data.xolab.generated.conditionset

default USA_on_services = false

USA_on_services {
	conditionset.userset_USA
	conditionset.resourceset_services
	input.action in condition_set_permissions.USA.services[input.resource.type]
}