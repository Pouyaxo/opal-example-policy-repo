package xolab.generated.conditionset.rules

import future.keywords.in

import data.xolab.generated.abac.utils.attributes
import data.xolab.generated.abac.utils.condition_set_permissions
import data.xolab.generated.conditionset

default admin_on_track = false

admin_on_track {
	conditionset.userset_admin
	conditionset.resourceset_track
	input.action in condition_set_permissions.admin.track[input.resource.type]
}