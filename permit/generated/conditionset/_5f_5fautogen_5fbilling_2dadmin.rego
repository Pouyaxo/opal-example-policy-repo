package permit.generated.conditionset

import future.keywords.in

import data.permit.generated.abac.utils.attributes

default userset__5f_5fautogen_5fbilling_2dadmin = false

userset__5f_5fautogen_5fbilling_2dadmin {
	"billing-admin" in attributes.user.roles
}
