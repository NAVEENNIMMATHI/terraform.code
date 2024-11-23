param
(
    [Parameter (Mandatory=$false)]
    [string] $ResourceGroupName,
	[Parameter (Mandatory=$false)]
    [string] $VMScaleSetName,
	[Parameter (Mandatory=$false)]
    [string] $InstanceId,
	[Parameter (Mandatory=$false)]
    [string] $SubscriptionName
)
Write-Output $ResourceGroupName
Write-Output $VMScaleSetName
Write-Output $InstanceId
Write-Output $SubscriptionName


try {
        $AzureContext = (Connect-AzAccount -Identity).context
    }
catch{
        Write-Output "There is no system-assigned user identity. Aborting."; 
        exit
    }

# set and store context
$AzureContext = Set-AzContext -SubscriptionName $SubscriptionName -DefaultProfile $AzureContext
Start-Sleep -s 120
Remove-AzVmss -ResourceGroupName $ResourceGroupName -VMScaleSetName $VMScaleSetName -InstanceId $InstanceId -Confirm:$false -Force