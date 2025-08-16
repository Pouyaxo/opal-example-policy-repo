package permit.generated.conditionset

import future.keywords.in

import data.permit.generated.abac.utils.attributes

default resourceset_Checked_5fTasks = false

resourceset_Checked_5fTasks {
	attributes.resource.checked == true
	attributes.resource.type == "task"
}
