param(
    [string] $environment,
    [string] $azureuserPassword
)

# Resource group names for RStudio that contains the 3 Linux VMs we want to rotate keys on
$resourceGroupNames = @{
    dv  = "RGP-USE-RSTU-DV"
    qa  = "RGP-USE-RSTU-QA"
    uat = "RGP-USE-RSTU-UAT"
    stg = "RGP-USE-RSTU-STG"
    pd  = "co-p-eastus-rstudio-rg"
}

$keyVaultNames = @{
    dv  = "kvl-use-rstu2-dv"
    qa  = "kvl-use-rstu2-qa"
    uat = "kvl-use-rstu2-uat"
    stg = "kvl-use-rstu2-stg"
    pd  = "kvl-use-rstudio2-p"
}

# VM names for RStudio that we want to rotate keys on
$linuxVmNames = @{
    dv  = $("VMLUSERSTUCO2DV", "VMLUSERSTURP2DV", "VMLUSERSTUSP2DV")
    qa  = $("VMLUSERSTUCO2QA", "VMLUSERSTURP2QA", "VMLUSERSTUSP2QA")
    uat = $("VMLUSERSTUCO2UA", "VMLUSERSTURP2UA", "VMLUSERSTUSP2UA")
    stg = $("VMLUSERSTUCO2SG", "VMLUSERSTURP2SG", "VMLUSERSTUSP2SG")
    pd  = $("VMLUSERSTUCO2PD", "VMLUSERSTURP2PD", "VMLUSERSTUSP2PD")
}

# Get the items from the collections above based on the environment being passed in from the pipeline stage
$resourceGroupName = $resourceGroupNames[$environment]
$keyVaultName = $keyVaultNames[$environment]
$linuxVmNamesCurrent = $linuxVmNames[$environment]

Write-Host ""
Write-Host "---------------------------"
Write-Host "-------- VARIABLES --------"
Write-Host "---------------------------"
Write-Host ""
Write-Host "environment: $environment"
Write-Host "resourceGroupName: $resourceGroupName"
Write-Host "keyVaultName: $keyVaultName"
Write-Host "vmList: $linuxVmNamesCurrent"
Write-Host ""

# Go get all running linux VMs from the resource group and VM names above
$rStudioVMs = Get-AzVM -ResourceGroupName $resourceGroupName -Status | Where-Object { $_.PowerState -eq "VM running" -and $_.StorageProfile.OSDisk.OSType -eq "Linux" -and $_.ProvisioningState -eq "Succeeded" -and $_.Name -in $linuxVmNamesCurrent }

$sshTempPath = "$ENV:USERPROFILE\sshtemp\"

# Remove working directory if it exists, then re-create it
$existingSshTempDir = Get-Item -LiteralPath $sshTempPath -ErrorAction SilentlyContinue

if ($existingSshTempDir) {
    Write-Host "Removing SSH Temp Directory: $sshTempPath"
    $existingSshTempDir | Remove-Item -Force -Recurse
}

Write-Host "Creating SSH Temp Directory: $sshTempPath"
New-Item -ItemType Directory -Path $sshTempPath -ErrorAction SilentlyContinue

# Add script execution dir to the path environment variable
$directorypath = Split-Path $MyInvocation.MyCommand.Path
$env:Path += ";$directorypath"

# Show contents of working dir, generate key pair, wait for keys to show up in the dir, & show contents again with keys in it
Get-ChildItem $sshTempPath

Write-Host "Generate ssh key pair using ssh-keygen started.."
Start-Process "C:/Program Files/Git/usr/bin/ssh-keygen.exe" "-q -b 2048 -t rsa -N '' -f $sshTempPath/sshkey"
Write-Host "Generate ssh key pair using ssh-keygen finished.."

while ($true) {
    try {
        Get-Content $sshTempPath/sshkey | Out-Null
        break
    }
    catch {
        start-sleep -Milliseconds 50
    }
}

start-sleep -Seconds 1
Get-ChildItem $sshTempPath

#Write-Host "Installing OpenSSH.."
#
### Set network connection protocol to TLS 1.2
### Define the OpenSSH latest release url
#$url = 'https://github.com/PowerShell/Win32-OpenSSH/releases/latest/'
### Create a web request to retrieve the latest release download link
#$request = [System.Net.WebRequest]::Create($url)
#$request.AllowAutoRedirect = $false
#$response = $request.GetResponse()
#$source = $([String]$response.GetResponseHeader("Location")).Replace('tag', 'download') + '/OpenSSH-Win64.zip'
### Download the latest OpenSSH for Windows package to the current working directory
#$webClient = [System.Net.WebClient]::new()
#$webClient.DownloadFile($source, (Get-Location).Path + '\OpenSSH-Win64.zip')
#
#Get-ChildItem *.zip
#
## Extract the ZIP to a temporary location
#Expand-Archive -Path .\OpenSSH-Win64.zip -DestinationPath ($env:temp) -Force
## Move the extracted ZIP contents from the temporary location to C:\Program Files\OpenSSH\
#Move-Item "$($env:temp)\OpenSSH-Win64" -Destination "C:\Program Files\OpenSSH\" -Force
## Unblock the files in C:\Program Files\OpenSSH\
#Get-ChildItem -Path "C:\Program Files\OpenSSH\" | Unblock-File
#
#& 'C:\Program Files\OpenSSH\install-sshd.ps1'
#
#Write-Host "Done Installing OpenSSH.."
#
# Extract the keys from the 2 key files, create key vault secrets and store them
$privateKey = (Get-Content $sshTempPath/sshkey -Raw)
$publicKey = (Get-Content $sshTempPath/sshkey.pub -Raw) -replace '([^\s]+\s[^\s]+).+', '$1'

$privateKeySecret = Set-AzKeyVaultSecret -VaultName $keyVaultName -Name "rstu-private-key" -SecretValue (ConvertTo-SecureString $privateKey -AsPlainText -Force)
$publicKeySecret = Set-AzKeyVaultSecret -VaultName $keyVaultName -Name "rstu-public-key" -SecretValue (ConvertTo-SecureString $publicKey -AsPlainText -Force)

Write-Host ""
Write-Host "Starting RunVmCommand on the [$resourceGroupName] VMs [$linuxVmNamesCurrent]: " -ForegroundColor Cyan

# Run shell script on the 3 Linux VMs that will add the public key to /home/azureuser/.ssh/authorized_keys
$rStudioVMs | ForEach-Object {
    Write-Host "Running on $($_.Name)"
    $out = Invoke-AzVMRunCommand -ResourceGroupName $_.ResourceGroupName -VMName $_.Name -CommandId 'RunShellScript' -ScriptPath "azure-commercial/rstudio/key_rotation/rotate-ssh-key.sh" -Parameter @{pineapple = "--pub_data `"$($publicKey)`" --azureuser_password `"$($azureuserPassword)`"" }

    $output = $_.Name + " " + $out.Value[0].Message
    $output
    
    Write-Host "Creating known_hosts file.."
    New-Item -Path "~\.ssh" -Name "known_hosts" -ItemType "file" -Value "" -ErrorAction SilentlyContinue

    # Run keyscan against the VMs to scan their public keys, generate hashes, and put them in the known_hosts file of this machine (likely build agent)
    Write-Host "Adding Known Hosts for $($_.Name)"
    Invoke-Expression "cmd /c `"C:\Program Files\Git\usr\bin\ssh-keyscan.exe`" -H $($_.Name)" | Out-File -Append "~\.ssh\known_hosts"
}
