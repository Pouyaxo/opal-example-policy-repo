package xolab.debug.abac

import data.xolab.abac
import data.xolab.conditionset
import future.keywords.in

default details := null

details = details {
    # if the request was made from a cloud pdp
    input.context.pdp_type == "cloud"
    count(data.condition_sets) > 0
    details := codes("cloud_pdp_not_supporting_abac")
} else = details {
	# in case of abac not activated, return disabled
	not activated
	details := codes("disabled")
} else = details {
	# in case of abac allow, return the allowing rules
	allow
	details := {
		"allow": allow,
		"allowing_rules": abac.allowing_rules,
		"matching_usersets": abac.matching_usersets,
		"matching_resourcesets": abac.matching_resourcesets,
		"code": "allow",
		"reason": sprintf("user has permission through rules: %s", [concat(", ", abac.allowing_rules)])
	}
} else = details {
	# if there are no matching usersets
	count(abac.matching_usersets) == 0
	details := codes("no_matching_usersets")
} else = details {
	# if there are no matching resourcesets
	count(abac.matching_resourcesets) == 0
	details := codes("no_matching_resourcesets")
} else = details {
	# if the user does not have the required permissions ( grants )
	details := codes("no_matching_rules")
}
