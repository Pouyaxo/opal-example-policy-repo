package xolab.root

import data.xolab.custom
import data.xolab.debug
import data.xolab.policies

default allow := false

allow {
	policies.allow
}

# NOTE: you can add more conditions here to get an AND effect
# i.e: assume you added my_custom_rule here
# The policy will allow if BOTH policies.allow and my_custom_rule are true

allow {
	custom.allow
}

debug = debug.debug
