package permit.generated.conditionset.rules

import future.keywords.in

import data.permit.generated.abac.utils.attributes
import data.permit.generated.abac.utils.condition_set_permissions
import data.permit.generated.conditionset

default User_5f5fwith_5f5fPTO_5fon_5ftask_5fowned_5f5ftask = false

User_5f5fwith_5f5fPTO_5fon_5ftask_5fowned_5f5ftask {
	conditionset.userset_User_5fwith_5fPTO
	conditionset.resourceset_owned_5ftask
	input.action in condition_set_permissions.User_with_PTO.owned_task[input.resource.type]
}
