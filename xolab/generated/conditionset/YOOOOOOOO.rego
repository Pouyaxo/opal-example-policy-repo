package xolab.generated.conditionset

import future.keywords.in

import data.xolab.generated.abac.utils.attributes

default resourceset_YOOOOOOOO = false

resourceset_YOOOOOOOO {
	attributes.resource.type == "trackCollaborators"
	attributes.resource.cost < attributes.user.trackUploadCount
}