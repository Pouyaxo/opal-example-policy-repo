package permit.generated.conditionset.rules

import future.keywords.in

import data.permit.generated.abac.utils.attributes
import data.permit.generated.abac.utils.condition_set_permissions
import data.permit.generated.conditionset

default User_5f5fwith_5f5fPTO_5fon_5fjapan_5fjapan_5f5fch_5f5f2 = false

User_5f5fwith_5f5fPTO_5fon_5fjapan_5fjapan_5f5fch_5f5f2 {
	conditionset.userset_User_5fwith_5fPTO
	conditionset.resourceset_japan_5fch_5f2
	input.action in condition_set_permissions.User_with_PTO.japan_ch_2[input.resource.type]
}
