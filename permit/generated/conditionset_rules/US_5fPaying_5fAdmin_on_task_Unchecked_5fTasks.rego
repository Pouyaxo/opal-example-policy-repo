package permit.generated.conditionset.rules

import future.keywords.in

import data.permit.generated.abac.utils.attributes
import data.permit.generated.abac.utils.condition_set_permissions
import data.permit.generated.conditionset

default US_5f5fPaying_5f5fAdmin_5fon_5ftask_5fUnchecked_5f5fTasks = false

US_5f5fPaying_5f5fAdmin_5fon_5ftask_5fUnchecked_5f5fTasks {
	conditionset.userset_US_5fPaying_5fAdmin
	conditionset.resourceset_Unchecked_5fTasks
	input.action in condition_set_permissions.US_Paying_Admin.Unchecked_Tasks[input.resource.type]
}
