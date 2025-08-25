package xolab.debug

import future.keywords.in

import data.xolab.custom
import data.xolab.debug.abac
import data.xolab.debug.rbac
import data.xolab.policies
import data.xolab.root
import data.xolab.utils
import data.xolab.utils.abac as abac_utils

default __debug_tenant = null

__debug_tenant = input.resource.tenant {
	utils.has_key(data.tenants, input.resource.tenant)
}

default __debug_action := null

__debug_action = input.action {
	utils.has_key(input, "action")
}

default __debug_user := null

default __debug_user_attributes := {}

__debug_user_attributes = abac_utils.attributes.user

default __debug_user_synced := false

__debug_user_synced = utils.has_key(data.users, input.user.key)

__debug_user = utils.merge_objects(
	input.user,
	{
		"synced": __debug_user_synced,
		"attributes": __debug_user_attributes,
	},
)

default __debug_resource := null

__debug_resource = {
	"type": input.resource.type,
	"attributes": abac_utils.attributes.resource,
}

__debug_details["rbac"] = result {
	# always show rbac debug for rbac allowed requests
	rbac.allow
	result := rbac.details
}

__debug_details["rbac"] = result {
	# show rbac deny debug only if no other model allowed the request
	not rbac.allow
	not abac.allow
	not custom.allow
	result := rbac.details
}

__debug_details["abac"] = result {
	# show abac debug for abac allowed requests
	abac.allow
	result := {
		"allow": abac.allow,
		"allowing_rules": abac.allowing_rules,
		"matching_usersets": abac.matching_usersets,
		"matching_resourcesets": abac.matching_resourcesets,
		"code": count(abac.allowing_rules) > 0 ? "allow" : "no_matching_rules",
		"reason": count(abac.allowing_rules) > 0 ? 
			sprintf("user has permission through rules: %s", [concat(", ", abac.allowing_rules)]) :
			"user does not match any rule that grants permission"
	}
}

__debug_details["abac"] = result {
	# show abac debug for abac denied requests
	not abac.allow
	abac.activated
	result := {
		"allow": abac.allow,
		"matching_usersets": abac.matching_usersets,
		"matching_resourcesets": abac.matching_resourcesets,
		"code": count(abac.matching_usersets) == 0 ? "no_matching_usersets" : 
			count(abac.matching_resourcesets) == 0 ? "no_matching_resourcesets" : "no_matching_rules",
		"reason": count(abac.matching_usersets) == 0 ? 
			sprintf("user '%s' did not match any userset conditions", [input.user.key]) :
			count(abac.matching_resourcesets) == 0 ? 
			"the given resource did not match any resourceset conditions" :
			sprintf("user '%s' does not match any rule that grants him the '%s' permission on the given resource of type '%s'", 
				[input.user.key, input.action, input.resource.type])
	}
}

__debug_details["custom"] = result {
	# show custom debug for custom allowed requests
	custom.allow
	result := {
		"allow": custom.allow,
		"code": "custom_policy",
	}
}

default debug := null

debug = utils.merge_objects(
	{"request": {
		"user": __debug_user,
		"tenant": __debug_tenant,
		"action": __debug_action,
		"resource": __debug_resource,
	}},
	__debug_details,
)
