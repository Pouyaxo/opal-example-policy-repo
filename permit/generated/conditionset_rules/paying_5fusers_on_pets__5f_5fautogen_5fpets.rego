package permit.generated.conditionset.rules

import future.keywords.in

import data.permit.generated.abac.utils.attributes
import data.permit.generated.abac.utils.condition_set_permissions
import data.permit.generated.conditionset

default paying_5f5fusers_5fon_5fpets_5f_5f5f_5f5fautogen_5f5fpets = false

paying_5f5fusers_5fon_5fpets_5f_5f5f_5f5fautogen_5f5fpets {
	conditionset.userset_paying_5fusers
	conditionset.resourceset__5f_5fautogen_5fpets
	input.action in condition_set_permissions.paying_users.__autogen_pets[input.resource.type]
}
