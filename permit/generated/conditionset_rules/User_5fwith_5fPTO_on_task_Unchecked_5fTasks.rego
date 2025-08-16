package permit.generated.conditionset.rules

import future.keywords.in

import data.permit.generated.abac.utils.attributes
import data.permit.generated.abac.utils.condition_set_permissions
import data.permit.generated.conditionset

default User_5f5fwith_5f5fPTO_5fon_5ftask_5fUnchecked_5f5fTasks = false

User_5f5fwith_5f5fPTO_5fon_5ftask_5fUnchecked_5f5fTasks {
	conditionset.userset_User_5fwith_5fPTO
	conditionset.resourceset_Unchecked_5fTasks
	input.action in condition_set_permissions.User_with_PTO.Unchecked_Tasks[input.resource.type]
}
