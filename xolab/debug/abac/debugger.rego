package xolab.debug.abac

import data.xolab.abac
import data.xolab.conditionset
import future.keywords.in

default details := null

details = details {
    # Simple case: if ABAC allows, show allow
    abac.allow
    details := {
        "allow": true,
        "code": "allow",
        "matching_usersets": abac.matching_usersets,
        "matching_resourcesets": abac.matching_resourcesets,
        "reason": sprintf(
            "user '%s' matched userset conditions and resource matched resourceset conditions",
            [input.user.key]
        )
    }
} else = details {
    # If ABAC is not activated
    not abac.activated
    details := {
        "allow": false,
        "code": "disabled",
        "reason": "ABAC is not activated"
    }
} else = details {
    # If no matching usersets
    count(abac.matching_usersets) == 0
    details := {
        "allow": false,
        "code": "no_matching_usersets",
        "reason": sprintf(
            "user '%s' did not match any userset conditions",
            [input.user.key]
        )
    }
} else = details {
    # If no matching resourcesets
    count(abac.matching_resourcesets) == 0
    details := {
        "allow": false,
        "code": "no_matching_resourcesets",
        "reason": sprintf(
            "resource did not match any resourceset conditions"
        )
    }
} else = details {
    # Default case: no matching rules
    details := {
        "allow": false,
        "code": "no_matching_rules",
        "matching_usersets": abac.matching_usersets,
        "matching_resourcesets": abac.matching_resourcesets,
        "reason": sprintf(
            "user '%s' does not have the '%s' permission on resources of type '%s'",
            [input.user.key, input.action, input.resource.type]
        )
    }
}
