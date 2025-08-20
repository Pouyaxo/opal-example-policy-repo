package xolab.generated.conditionset

import future.keywords.in

import data.xolab.generated.abac.utils.attributes

default resourceset_portfolio = false

resourceset_portfolio {
	attributes.resource.type == "portfolio"

}