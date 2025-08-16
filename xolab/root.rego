package xolab.policies

import data.xolab.abac
import data.xolab.rbac

default allow := false

allow {
	rbac.allow
}

__allow_sources["rbac"] {
	rbac.allow
}

allow {
	abac.allow
}

__allow_sources["abac"] {
	abac.allow
}