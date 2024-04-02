# Get general system information
$computerInfo = Get-ComputerInfo

# Get operating system information
$osInfo = Get-CimInstance -ClassName CIM_OperatingSystem

# Get BIOS information including serial number
$biosInfo = Get-CimInstance -ClassName Win32_BIOS

# Get network adapter configuration for LAN and WiFi
$networkInfo = Get-CimInstance -ClassName Win32_NetworkAdapterConfiguration -Filter "IPEnabled = TRUE"

# Extracting the details
$assetName = $computerInfo.CsName
$osName = $osInfo.Caption

# 'License key retrieval is not adviced via PowerShell due to security reasons'
$licenseKey = wmic path softwarelicensingservice get OA3xOriginalProductKey

#$biosInfo.SerialNumber
$serialNumber = wmic bios get Serialnumber

# Assuming the first enabled network adapter is Wifi
$wifiIP = $networkInfo[0].IPAddress[0]
$wifiMAC = $networkInfo[0].MACAddress


# Assuming the second enabled network adapter is LAN
$lanIP = $networkInfo[1].IPAddress[0]
$lanMAC = $networkInfo[1].MACAddress

# Output the information
Write-Host "Asset Name: $assetName"
Write-Host "OS: $osName"
Write-Host "License Key: $licenseKey"
Write-Host "Serial Number: $serialNumber"
Write-Host "WIFI IP: $wifiIP"
Write-Host "WIFI MAC: $wifiMAC"
Write-Host "LAN IP: $lanIP"
Write-Host "LAN MAC: $lanMAC"
