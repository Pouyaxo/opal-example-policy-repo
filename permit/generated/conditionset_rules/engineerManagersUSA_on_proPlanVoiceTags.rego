package permit.generated.conditionset.rules

import future.keywords.in

import data.permit.generated.abac.utils.attributes
import data.permit.generated.abac.utils.condition_set_permissions
import data.permit.generated.conditionset

default engineerManagersUSA_on_proPlanVoiceTags = false

engineerManagersUSA_on_proPlanVoiceTags {
	conditionset.userset_engineerManagersUSA
	conditionset.resourceset_proPlanVoiceTags
	input.action in condition_set_permissions.engineerManagersUSA.proPlanVoiceTags[input.resource.type]
}