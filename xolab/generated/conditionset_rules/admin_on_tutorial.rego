package xolab.generated.conditionset.rules

import future.keywords.in

import data.xolab.generated.abac.utils.attributes
import data.xolab.generated.abac.utils.condition_set_permissions
import data.xolab.generated.conditionset

default admin_on_tutorial = false

admin_on_tutorial {
	conditionset.userset_admin
	conditionset.resourceset_tutorial
	input.action in condition_set_permissions.admin.tutorial[input.resource.type]
}