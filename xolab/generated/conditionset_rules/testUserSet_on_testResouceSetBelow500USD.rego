package xolab.generated.conditionset.rules

import future.keywords.in

import data.xolab.generated.abac.utils.attributes
import data.xolab.generated.abac.utils.condition_set_permissions
import data.xolab.generated.conditionset

default testUserSet_on_testResouceSetBelow500USD = false

testUserSet_on_testResouceSetBelow500USD {
	conditionset.userset_testUserSet
	conditionset.resourceset_testResouceSetBelow500USD
	input.action in condition_set_permissions.testUserSet.testResouceSetBelow500USD[input.resource.type]
}