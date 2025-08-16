package permit.generated.conditionset

import future.keywords.in

import data.permit.generated.abac.utils.attributes

default userset_US_5fPaying_5fAdmin = false

userset_US_5fPaying_5fAdmin {
	"admin" in attributes.user.roles
	attributes.user.location == "US"
	attributes.user.paying == true
}
