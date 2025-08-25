package xolab.debug.abac

import data.xolab.abac
import data.xolab.conditionset
import future.keywords.in

# Simple debug output that just shows the essential information
details = {
    "allow": abac.allow,
    "activated": abac.activated,
    "matching_usersets": abac.matching_usersets,
    "matching_resourcesets": abac.matching_resourcesets,
    "code": abac.allow ? "allow" : "deny",
    "reason": abac.allow ? 
        sprintf("user '%s' matched userset conditions and resource matched resourceset conditions", [input.user.key]) :
        sprintf("user '%s' does not have the '%s' permission on resources of type '%s'", [input.user.key, input.action, input.resource.type])
}
