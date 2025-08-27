package xolab.generated.conditionset.rules

import future.keywords.in

import data.xolab.generated.abac.utils.attributes
import data.xolab.generated.abac.utils.condition_set_permissions
import data.xolab.generated.conditionset

default seller_on_ownedTracks = false

seller_on_ownedTracks {
	conditionset.userset_seller
	conditionset.resourceset_ownedTracks
	input.action in condition_set_permissions.seller.ownedTracks[input.resource.type]
}