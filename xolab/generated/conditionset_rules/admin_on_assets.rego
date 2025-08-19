package xolab.generated.conditionset.rules

import future.keywords.in

import data.xolab.generated.abac.utils.attributes
import data.xolab.generated.abac.utils.condition_set_permissions
import data.xolab.generated.conditionset

default admin_on_assets = false

admin_on_assets {
	"admin" in attributes.user.roles
	conditionset.resourceset_assets
	input.action in condition_set_permissions.admin.assets[input.resource.type]
}
