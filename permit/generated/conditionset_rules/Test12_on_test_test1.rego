package permit.generated.conditionset.rules

import future.keywords.in

import data.permit.generated.abac.utils.attributes
import data.permit.generated.abac.utils.condition_set_permissions
import data.permit.generated.conditionset

default Test12_5fon_5ftest_5ftest1 = false

Test12_5fon_5ftest_5ftest1 {
	conditionset.userset_Test12
	conditionset.resourceset_test1
	input.action in condition_set_permissions.Test12.test1[input.resource.type]
}
