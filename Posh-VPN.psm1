if (Get-Module Posh-VPN) { return }

if ($PSVersionTable.PSVersion.Major -lt 3)
{
  Write-Error "Posh-VPN work only on Powershell 3.0 and higher"
  exit
}

Push-Location $PSScriptRoot
. .\Get-AnyConnect.ps1
. .\Get-VPNProfile.ps1
. .\Get-VPNStatus.ps1
. .\Disconnect-VPN.ps1
. .\Connect-VPN.ps1
Pop-Location

Export-ModuleMember `
  -Function @(
    'Get-VPNProfile',
    'Get-VPNStatus',
    'Connect-VPN',
    'Disconnect-VPN'
  )
