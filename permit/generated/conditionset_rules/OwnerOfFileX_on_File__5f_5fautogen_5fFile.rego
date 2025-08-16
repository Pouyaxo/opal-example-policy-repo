package permit.generated.conditionset.rules

import future.keywords.in

import data.permit.generated.abac.utils.attributes
import data.permit.generated.abac.utils.condition_set_permissions
import data.permit.generated.conditionset

default OwnerOfFileX_5fon_5fFile_5f_5f5f_5f5fautogen_5f5fFile = false

OwnerOfFileX_5fon_5fFile_5f_5f5f_5f5fautogen_5f5fFile {
	conditionset.userset_OwnerOfFileX
	conditionset.resourceset__5f_5fautogen_5fFile
	input.action in condition_set_permissions.OwnerOfFileX.__autogen_File[input.resource.type]
}
