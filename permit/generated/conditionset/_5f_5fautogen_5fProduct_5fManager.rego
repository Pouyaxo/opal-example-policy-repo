package permit.generated.conditionset

import future.keywords.in

import data.permit.generated.abac.utils.attributes

default userset__5f_5fautogen_5fProduct_5fManager = false

userset__5f_5fautogen_5fProduct_5fManager {
	"Product_Manager" in attributes.user.roles
}
