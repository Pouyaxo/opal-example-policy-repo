package permit.generated.conditionset.rules

import future.keywords.in

import data.permit.generated.abac.utils.attributes
import data.permit.generated.abac.utils.condition_set_permissions
import data.permit.generated.conditionset

default _5f5f_5f5fautogen_5f5fmanager_5fon_5ftest_5ftest1 = false

_5f5f_5f5fautogen_5f5fmanager_5fon_5ftest_5ftest1 {
	conditionset.userset__5f_5fautogen_5fmanager
	conditionset.resourceset_test1
	input.action in condition_set_permissions.__autogen_manager.test1[input.resource.type]
}
