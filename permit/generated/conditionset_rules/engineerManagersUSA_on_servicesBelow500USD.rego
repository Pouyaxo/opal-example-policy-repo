package permit.generated.conditionset.rules

import future.keywords.in

import data.permit.generated.abac.utils.attributes
import data.permit.generated.abac.utils.condition_set_permissions
import data.permit.generated.conditionset

default engineerManagersUSA_on_servicesBelow500USD = false

engineerManagersUSA_on_servicesBelow500USD {
	conditionset.userset_engineerManagersUSA
	conditionset.resourceset_servicesBelow500USD
	input.action in condition_set_permissions.engineerManagersUSA.servicesBelow500USD[input.resource.type]
}