package xolab.generated.conditionset

import future.keywords.in

import data.xolab.generated.abac.utils.attributes

default resourceset_ownedTracks = false

resourceset_ownedTracks {
	attributes.resource.type == "track"
	attributes.resource.sellerId == attributes.user.sellerId
}