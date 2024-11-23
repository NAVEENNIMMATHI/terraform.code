param
(
    [Parameter (Mandatory=$false)]
    [object] $WebhookData
)
$ErrorActionPreference = "stop"

Write-Output "Request Body"
Write-Output $WebhookData.RequestBody

try 
{
	$WebhookBody = $WebhookData.RequestBody | ConvertFrom-Json
}
catch 
{
	$WebhookJson = $WebhookData | ConvertFrom-Json
	$WebhookBody = $WebhookJson.RequestBody | ConvertFrom-Json
}

if ($WebhookData)
{
    # Get the data object from WebhookData
    #$webhookBody = (ConvertFrom-Json -InputObject $jsonObject.RequestBody)
	#$webhookBody = $jsonObject
    # Get the info needed to identify the VM (depends on the payload schema)
    $schemaId = $WebhookBody.schemaId
    Write-Output "schemaId: $schemaId"
    if ($schemaId -eq "azureMonitorCommonAlertSchema") {
        # This is the common Metric Alert schema (released March 2019)
        $Essentials = [object] ($WebhookBody.data).essentials
        # Get the first target only as this script doesn't handle multiple
        $alertTargetIdArray = (($Essentials.alertTargetIds)[0]).Split("/")
        $SubId = ($alertTargetIdArray)[2]
        $ResourceGroupName = ($alertTargetIdArray)[4]
        $ResourceType = ($alertTargetIdArray)[6] + "/" + ($alertTargetIdArray)[7]
        $ResourceName = ($alertTargetIdArray)[-1]
        $status = $Essentials.monitorCondition
    }
    elseif ($schemaId -eq "AzureMonitorMetricAlert") {
        # This is the near-real-time Metric Alert schema
        $AlertContext = [object] ($WebhookBody.data).context
        $SubId = $AlertContext.subscriptionId
        $ResourceGroupName = $AlertContext.resourceGroupName
        $ResourceType = $AlertContext.resourceType
        $ResourceName = $AlertContext.resourceName
        $status = ($WebhookBody.data).status
    }
    elseif ($schemaId -eq "Microsoft.Insights/activityLogs") {
        # This is the Activity Log Alert schema
        $AlertContext = [object] (($WebhookBody.data).context).activityLog
        $SubId = $AlertContext.subscriptionId
        $ResourceGroupName = $AlertContext.resourceGroupName
        $ResourceType = $AlertContext.resourceType
        $ResourceName = (($AlertContext.resourceId).Split("/"))[-1]
        $status = ($WebhookBody.data).status
    }
    elseif ($schemaId -eq $null) {
        # This is the original Metric Alert schema
        $AlertContext = [object] $WebhookBody.context
        $SubId = $AlertContext.subscriptionId
        $ResourceGroupName = $AlertContext.resourceGroupName
        $ResourceType = $AlertContext.resourceType
        $ResourceName = $AlertContext.resourceName
        $status = $WebhookBody.status
    }
    else {
        # Schema not supported
        Write-Error "The alert data schema - $schemaId - is not supported."
    }

    Write-Output "status: $status" -Verbose
    if (($status -eq "Activated") -or ($status -eq "Fired"))
    {
        Write-Output "resourceType: $ResourceType" -Verbose
        Write-Output "resourceName: $ResourceName" -Verbose
        Write-Output "resourceGroupName: $ResourceGroupName" -Verbose
        Write-Output "subscriptionId: $SubId" -Verbose

        # Determine code path depending on the resourceType
        if ($ResourceType -eq "Microsoft.Compute/virtualMachines")
        {
            # This is an Resource Manager VM
            Write-Output "This is an Resource Manager VM." -Verbose

	        # Ensures you do not inherit an AzContext in your runbook
	        Disable-AzContextAutosave -Scope Process

	        # Connect to Azure with system-assigned managed identity
	        $AzureContext = (Connect-AzAccount -Identity).context

	        # set and store context
	        $AzureContext = Set-AzContext -SubscriptionName $AzureContext.Subscription -DefaultProfile $AzureContext

            # Stop the Resource Manager VM
			# Wait 30 minutes, if the VM is still powered off then we can deallocate it, otherwise it was probably just restarted and no action is needed
			Write-Output "Waiting 30 Minutes" -Verbose
			Start-Sleep -s 1800
			$vm = Get-AzVM -Name $ResourceName -Status
			if ($vm.PowerState -eq "VM stopped")
			{
            	Write-Output "Deallocating the VM: $ResourceName in resource group $ResourceGroupName" -Verbose
            	Stop-AzVM -Name $ResourceName -ResourceGroupName $ResourceGroupName -DefaultProfile $AzureContext -Force
				$vmSize = $vm.HardwareProfile.VmSize
				$timeStamp = Get-Date -format "MM-dd-yyyy HH:mm:ss"
				# Set up Storage for Logging
				$StorageAccountRG = Get-AutomationVariable -Name 'StorageAccountRG'
				$StorageAccountName = Get-AutomationVariable -Name 'StorageAccountName'
				Set-AzContext -SubscriptionId (Get-AutomationVariable -Name 'StorageAccountSubscriptionId')
				$storageKey = (Get-AzStorageAccountKey -ResourceGroupName $StorageAccountRG -Name $StorageAccountName)[0].Value
				$storageContext = New-AzStorageContext -StorageAccountName $StorageAccountName -StorageAccountKey $storageKey
				# Log the Shutdown
				Get-AzStorageBlobContent -Container deallocatevm -Blob DeallocateVM_Log.txt -Context $storageContext -ErrorAction SilentlyContinue -Destination .\shutdowndata.txt
				$shutdownData = "$($ResourceName),$($timeStamp),$($vmSize)"
				$shutdownData | Out-File -Append .\shutdowndata.txt -Force
				Set-AzStorageBlobContent -File .\shutdowndata.txt -Container deallocatevm -Blob DeallocateVM_Log.txt -Context $storageContext -Force			
			}
			else
			{
				Write-Output "No action taken, the VM was not in a stopped state" -Verbose
			}
            # [OutputType(PSAzureOperationResponse")]
        }
        else {
            # ResourceType not supported
            Write-Error "$ResourceType is not a supported resource type for this runbook."
        }
    }
    else {
        # The alert status was not 'Activated' or 'Fired' so no action taken
        Write-Output ("No action taken. Alert status: " + $status) -Verbose
    }
}
else {
    # Error
    Write-Error "This runbook is meant to be started from an Azure alert webhook only."
}