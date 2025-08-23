package xolab.generated.conditionset

import future.keywords.in

import data.xolab.generated.abac.utils.attributes

default resourceset_premiumPlanTracks = false

resourceset_premiumPlanTracks {
	attributes.resource.type == "track"
	attributes.resource.premiumPlanTrackLimit  >= attributes.user.currentTrackCount
}