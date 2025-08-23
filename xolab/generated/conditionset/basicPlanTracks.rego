package xolab.generated.conditionset

import future.keywords.in

import data.xolab.generated.abac.utils.attributes

default resourceset_basicPlanTracks = false

resourceset_basicPlanTracks {
	attributes.resource.type == "track"
	attributes.resource.basicPlanTrackLimit < attributes.user.currentTrackCount
}