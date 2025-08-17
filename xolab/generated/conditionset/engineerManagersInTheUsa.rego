package xolab.generated.conditionset

import future.keywords.in

import data.xolab.generated.abac.utils.attributes

default userset_engineerManagersInTheUsa = false

userset_engineerManagersInTheUsa {
	attributes.user.department == "Eng"
		attributes.user.location == "USA"
}