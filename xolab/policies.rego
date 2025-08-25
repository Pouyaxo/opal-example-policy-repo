package xolab.policies

import data.xolab.abac
import data.xolab.rbac

default allow := false

# Require BOTH RBAC and ABAC to allow for proper tenant isolation
# This ensures that:
# 1. RBAC checks tenant + role permissions
# 2. ABAC checks plan limits and resource attributes
allow {
	rbac.allow      # ✅ Checks tenant + role
	abac.allow      # ✅ Checks plan limits
}

# Debug information to help troubleshoot authorization decisions
debug = {
	"rbac_allowed": rbac.allow,
	"abac_allowed": abac.allow,
	"rbac_debug": rbac.debug,
	"abac_debug": abac.debug,
}
