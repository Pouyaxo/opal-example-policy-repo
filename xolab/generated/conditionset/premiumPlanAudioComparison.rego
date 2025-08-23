package xolab.generated.conditionset

import future.keywords.in

import data.xolab.generated.abac.utils.attributes

default resourceset_premiumPlanAudioComparison = false

resourceset_premiumPlanAudioComparison {
	attributes.resource.type == "audioComparison"
	attributes.resource.basicPlanAudioComparisonLimit >= attributes.user.currentAudioComparisonCount
}