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
	# in case of rbac deny, return the denying roles
	not activated
	details := codes("disabled")
} else = details {
	# in case of rbac allow, return the allowing roles
	allow
	details := codes("allow")
} else = details {
	# if there are no matching usersets
	count(abac.matching_usersets) == 0
	details := codes("no_matching_usersets")
} else = details {
	# if there are no matching resourcesets
	count(abac.matching_resourcesets) == 0
	details := codes("no_matching_resourcesets")
} else = details {
	# Check if there are actually allowing rules
	count(allowing_rules) > 0
	details := codes("allow")
} else = details {
	# if the user does not have the required permissions ( grants )
	details := codes("no_matching_rules")
}
