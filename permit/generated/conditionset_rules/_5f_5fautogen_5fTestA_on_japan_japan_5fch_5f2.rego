package permit.generated.conditionset.rules

import future.keywords.in

import data.permit.generated.abac.utils.attributes
import data.permit.generated.abac.utils.condition_set_permissions
import data.permit.generated.conditionset

default _5f5f_5f5fautogen_5f5fTestA_5fon_5fjapan_5fjapan_5f5fch_5f5f2 = false

_5f5f_5f5fautogen_5f5fTestA_5fon_5fjapan_5fjapan_5f5fch_5f5f2 {
	conditionset.userset__5f_5fautogen_5fTestA
	conditionset.resourceset_japan_5fch_5f2
	input.action in condition_set_permissions.__autogen_TestA.japan_ch_2[input.resource.type]
}
