package xolab.generated.conditionset

import future.keywords.in

import data.xolab.generated.abac.utils.attributes

default resourceset_standardPlanTracks = false

resourceset_standardPlanTracks {
	attributes.resource.type == "track"
	attributes.resource.standardPlanTrackLimit >= attributes.user.currentTrackCount
}