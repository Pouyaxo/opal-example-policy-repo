package permit.generated.conditionset.rules

import future.keywords.in

import data.permit.generated.abac.utils.attributes
import data.permit.generated.abac.utils.condition_set_permissions
import data.permit.generated.conditionset

default admins_5f5fin_5f5feurope_5fon_5fpets_5f_5f5f_5f5fautogen_5f5fpets = false

admins_5f5fin_5f5feurope_5fon_5fpets_5f_5f5f_5f5fautogen_5f5fpets {
	conditionset.userset_admins_5fin_5feurope
	conditionset.resourceset__5f_5fautogen_5fpets
	input.action in condition_set_permissions.admins_in_europe.__autogen_pets[input.resource.type]
}
