package xolab.generated.conditionset.rules

import future.keywords.in

import data.xolab.generated.abac.utils.attributes
import data.xolab.generated.abac.utils.condition_set_permissions
import data.xolab.generated.conditionset

default testRole_on_servicesBelow500USD = false

testRole_on_servicesBelow500USD {
	conditionset.userset_testRole
	conditionset.resourceset_servicesBelow500USD
	input.action in condition_set_permissions.testRole.servicesBelow500USD[input.resource.type]
}