package permit.generated.conditionset.rules

import future.keywords.in

import data.permit.generated.abac.utils.attributes
import data.permit.generated.abac.utils.condition_set_permissions
import data.permit.generated.conditionset

default US_5f5fPaying_5f5fAdmin_5fon_5fjapan_5fjapan_5f5fch_5f5f2 = false

US_5f5fPaying_5f5fAdmin_5fon_5fjapan_5fjapan_5f5fch_5f5f2 {
	conditionset.userset_US_5fPaying_5fAdmin
	conditionset.resourceset_japan_5fch_5f2
	input.action in condition_set_permissions.US_Paying_Admin.japan_ch_2[input.resource.type]
}
