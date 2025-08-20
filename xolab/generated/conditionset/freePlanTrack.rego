package xolab.generated.conditionset

import future.keywords.in

import data.xolab.generated.abac.utils.attributes

default resourceset_freePlanTrack = false

resourceset_freePlanTrack {
	attributes.resource.type == "track"
	attributes.resource.planTrackLimit < attributes.user.currentTrackCount
}