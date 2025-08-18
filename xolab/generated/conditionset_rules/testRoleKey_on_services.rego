package xolab.generated.conditionset.rules

import future.keywords.in

import data.xolab.generated.abac.utils.attributes
import data.xolab.generated.abac.utils.condition_set_permissions
import data.xolab.generated.conditionset

default testRoleKey_on_services = false

testRoleKey_on_services {
	conditionset.userset_testRoleKey
	conditionset.resourceset_services
	input.action in condition_set_permissions.testRoleKey.services[input.resource.type]
}