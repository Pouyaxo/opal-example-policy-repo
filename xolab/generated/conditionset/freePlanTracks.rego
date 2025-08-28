package xolab.generated.conditionset

import future.keywords.in

import data.xolab.generated.abac.utils.attributes

default resourceset_freePlanTracks = false

resourceset_freePlanTracks {
	attributes.resource.type == "track"
	attributes.resource.trackId == "tyh"
}