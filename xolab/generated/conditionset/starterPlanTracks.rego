package xolab.generated.conditionset

import future.keywords.in

import data.xolab.generated.abac.utils.attributes

default resourceset_starterPlanTracks = false

resourceset_starterPlanTracks {
	attributes.resource.type == "track"
	attributes.resource.planTrackLimit > attributes.user.currentTrackCount
}