$path = $env:windir + '\System32\drivers\etc\hosts'
function Add-HostMapValues
{
    param(
        $path,
        $neededValues
    )
    $neededValues | foreach-object{
        if(-not (get-content $path).Contains($_))
        {
            Add-Content -path $path -Value $_
            Write-Output "Adding $($_) to hosts"
        }
        else{
            Write-Output "NOT adding $_ to hosts"
        }
    }
}
$neededValues = @(
    "10.51.38.10     rconnect.fulcrumdev.kpmgcloudops.com",
    "10.51.38.9      rpm.fulcrumdev.kpmgcloudops.com",
    "10.51.38.11     rpro.fulcrumdev.kpmgcloudops.com"
)
Add-HostMapValues -path $path -neededValues $neededValues