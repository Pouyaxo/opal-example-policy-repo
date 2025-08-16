package xolab.generated.conditionset.rules

import future.keywords.in

import data.xolab.generated.abac.utils.attributes
import data.xolab.generated.conditionset

default engineerManagersUSA_on_servicesBelow500USD = false

engineerManagersUSA_on_servicesBelow500USD {
	conditionset.userset_engineerManagersUSA
	conditionset.resourceset_servicesBelow500USD
	input.action in data.condition_set_rules.engineerManagersUSA.servicesBelow500USD[input.resource.type]
}