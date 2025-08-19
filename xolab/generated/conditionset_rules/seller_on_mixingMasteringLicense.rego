package xolab.generated.conditionset.rules

import future.keywords.in

import data.xolab.generated.abac.utils.attributes
import data.xolab.generated.abac.utils.condition_set_permissions
import data.xolab.generated.conditionset

default seller_on_mixingMasteringLicense = false

seller_on_mixingMasteringLicense {
	conditionset.userset_seller
	conditionset.resourceset_mixingMasteringLicense
	input.action in condition_set_permissions.seller.mixingMasteringLicense[input.resource.type]
}