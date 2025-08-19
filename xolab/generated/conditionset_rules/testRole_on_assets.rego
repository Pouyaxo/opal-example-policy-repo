package xolab.generated.conditionset.rules

import future.keywords.in

import data.xolab.generated.abac.utils.attributes
import data.xolab.generated.abac.utils.condition_set_permissions
import data.xolab.generated.conditionset

default testRole_on_assets = false

testRole_on_assets {
	conditionset.userset_testRole
	conditionset.resourceset_assets
	input.action in condition_set_permissions.testRole.assets[input.resource.type]
}
