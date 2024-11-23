This module provides the below functionalities

1. Provision VM of type resource "azurerm_windows_virtual_machine"
2. Provision Disks of type resource "azurerm_managed_disk"
3. Provision attachment of disks to VM with type of resource "azurerm_virtual_machine_data_disk_attachment"
4. Provision azurerm_virtual_machine_extension of customscriptExtension
how we should use the two variable:
   A.data_disk_count
   B.data_disk_size
A.data_disk_count : This variable is used for how many data disk you want to add in a VM.
  if data_disk_count = 5 it means 5 data disk it will create
  if you select data_disk_count =0  no data disk will get created.
  
B.data_disk_size :-  Specifies the size of the managed disk to create in gigabytes.
in this module this is an array element.
example :-
       data_disk_size             = [250,300,400,500,600]
      per VM it will create 5 datadisk of size 250,300,400,500,600.
  logically length of the data_disk_size is equal to data_disk_count.     

6. if you select count_value = 0 no VM will get created.
7. selection of data disks are dynamic 
       
8. Option to select an Azure Hardened Image ID, or select Azure Defalt MarketPlace Image, based on flags.
9. Option to enforce new naming convention, and also utilse  old naming convention by setting the flag "enforce_vm_naming_convention=false".
10. Achieves the granularity of OS and Data Disk Configuration, for disk type and size.
11. Terraform 12 code compatible.
