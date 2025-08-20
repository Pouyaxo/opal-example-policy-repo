package xolab.generated.conditionset

import future.keywords.in

import data.xolab.generated.abac.utils.attributes

default resourceset_freePlanTracks = false

resourceset_freePlanTracks {
	attributes.resource.type == "track"
	attributes.resource.attr_182b645d-21e3-4885-a79b-5a3b97ea609d >= attributes.user.attr_65e3726d-f908-419d-8741-02ee7488321b
}