#!/bin/bash

#role assignment for Data factory MSI in Data lake store as "Storage Data blob Contributor"

#declaring variables
role="__role__"
msi_obj_id="__msi_obj_id__"
sub_id="__sub_id__"
rg_name="__rg_name__"
str_name="__str_name__"

#Role Assignment
az role assignment create --role "$role" --assignee-object-id $msi_obj_id --scope "/subscriptions/$sub_id/resourceGroups/$rg_name/providers/Microsoft.Storage/storageAccounts/$str_name"