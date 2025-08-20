package xolab.generated.conditionset

import future.keywords.in

import data.xolab.generated.abac.utils.attributes

default resourceset_tracksWithinPlanLimit = false

resourceset_tracksWithinPlanLimit {
	attributes.resource.type == "track"
	attributes.resource.planTrackLimit > attributes.user.currentTrackCount
}
