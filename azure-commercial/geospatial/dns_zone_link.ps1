# Query AKS private DNS zone and then link it to custom DNS VNet.

param (
    [Parameter(Mandatory=$True)]
    [string]$DNS_VNET,
    [Parameter(Mandatory=$True)]
    [string]$NODE_RGP
)

Write-Host $DNS_VNET
Write-Host $NODE_RGP

$RETRIES = 0
$DNS_OUTPUT
while (($DNS_OUTPUT -eq $null) -and ($RETRIES -lt 300)) {
    $DNS_OUTPUT = Get-AzPrivateDnsZone -ErrorAction SilentlyContinue -ResourceGroupName $NODE_RGP
    Write-Host "waiting for DNS zone..."
    $RETRIES++
    Start-Sleep -Seconds 10
}
$ZONE_NAME = (Get-AzPrivateDnsZone -ResourceGroupName $NODE_RGP).Name
Write-Host "DNS Zone Name: ", $ZONE_NAME

try {
    Write-Host "creating the Virtual Network link..."  
    New-AzPrivateDnsVirtualNetworkLink -ResourceGroupName $NODE_RGP -ZoneName $ZONE_NAME -Name "adds" -VirtualNetworkId $DNS_VNET
    

}


catch {
    try {
        Write-Host "something went wrong, trying again..."
        Start-Sleep -Seconds 10
        New-AzPrivateDnsVirtualNetworkLink -ResourceGroupName $NODE_RGP -ZoneName $ZONE_NAME -Name "adds" -VirtualNetworkId $DNS_VNET
        
    }
    catch {
        Write-Host "unable to create the Virtual Network link"
    }
}