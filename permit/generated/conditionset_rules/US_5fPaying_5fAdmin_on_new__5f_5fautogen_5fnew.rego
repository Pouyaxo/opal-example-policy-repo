package permit.generated.conditionset.rules

import future.keywords.in

import data.permit.generated.abac.utils.attributes
import data.permit.generated.abac.utils.condition_set_permissions
import data.permit.generated.conditionset

default US_5f5fPaying_5f5fAdmin_5fon_5fnew_5f_5f5f_5f5fautogen_5f5fnew = false

US_5f5fPaying_5f5fAdmin_5fon_5fnew_5f_5f5f_5f5fautogen_5f5fnew {
	conditionset.userset_US_5fPaying_5fAdmin
	conditionset.resourceset__5f_5fautogen_5fnew
	input.action in condition_set_permissions.US_Paying_Admin.__autogen_new[input.resource.type]
}
