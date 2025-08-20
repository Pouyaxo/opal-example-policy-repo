package xolab.generated.conditionset

import future.keywords.in

import data.xolab.generated.abac.utils.attributes

default resourceset_example_ref = false

resourceset_example_ref {
	attributes.resource.type == "voiceTags"
	attributes.resource.attr_0f32a8ae-71aa-41c8-8875-f65b30dd00ac lessThan_ref attributes.user.ref_ceef3e35-a888-42e4-9f19-a0907319583d
}