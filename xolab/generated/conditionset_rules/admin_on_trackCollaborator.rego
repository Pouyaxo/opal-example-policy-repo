package xolab.generated.conditionset.rules

import future.keywords.in

import data.xolab.generated.abac.utils.attributes
import data.xolab.generated.abac.utils.condition_set_permissions
import data.xolab.generated.conditionset

default admin_on_trackCollaborator = false

admin_on_trackCollaborator {
	conditionset.userset_admin
	conditionset.resourceset_trackCollaborator
	input.action in condition_set_permissions.admin.trackCollaborator[input.resource.type]
}