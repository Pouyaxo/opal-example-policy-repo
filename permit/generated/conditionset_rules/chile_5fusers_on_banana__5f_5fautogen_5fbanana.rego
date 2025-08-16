package permit.generated.conditionset.rules

import future.keywords.in

import data.permit.generated.abac.utils.attributes
import data.permit.generated.abac.utils.condition_set_permissions
import data.permit.generated.conditionset

default chile_5f5fusers_5fon_5fbanana_5f_5f5f_5f5fautogen_5f5fbanana = false

chile_5f5fusers_5fon_5fbanana_5f_5f5f_5f5fautogen_5f5fbanana {
	conditionset.userset_chile_5fusers
	conditionset.resourceset__5f_5fautogen_5fbanana
	input.action in condition_set_permissions.chile_users.__autogen_banana[input.resource.type]
}
