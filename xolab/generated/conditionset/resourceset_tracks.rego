package xolab.generated.conditionset

import future.keywords.in

import data.xolab.generated.abac.utils.attributes

default resourceset_tracks = false

resourceset_tracks {
	attributes.resource.type == "track"
}
