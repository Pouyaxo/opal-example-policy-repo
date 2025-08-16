package xolab.generated.conditionset.rules

import future.keywords.in

import data.xolab.generated.abac.utils.attributes
import data.xolab.generated.conditionset

default engineerManagersUSA_on_proPlanVoiceTags = false

engineerManagersUSA_on_proPlanVoiceTags {
	conditionset.userset_engineerManagersUSA
	conditionset.resourceset_proPlanVoiceTags
	input.action in data.condition_set_rules.engineerManagersUSA.proPlanVoiceTags[input.resource.type]
}