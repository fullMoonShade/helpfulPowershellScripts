# System information
$systemInfo = Get-ComputerInfo

# OS information
$osInfo = Get-CimInstance -ClassName Win32_OperatingSystem
$osName = $osInfo.Caption
$osVersion = $osInfo.Version
$osBuild = $osInfo.BuildNumber

# CPU information
$cpuInfo = Get-CimInstance -ClassName Win32_Processor
$cpuModel = $cpuInfo.Name
$cpuCores = $cpuInfo.NumberOfCores

# Memory information
$memoryInfo = Get-CimInstance -ClassName Win32_PhysicalMemory
$totalMemory = $memoryInfo.Capacity | Measure-Object -Sum

# Network information
$networkInfo = Get-NetAdapter | Select-Object -Property Name, Description, PhysicalAdapterConnection, MacAddress, Status

# Output layout
Write-Host "System Information"
Write-Host "----------------"
Write-Host "Operating System:"
Write-Host "  Name: $osName"
Write-Host "  Version: $osVersion"
Write-Host "  Build: $osBuild"
Write-Host "CPU:"
Write-Host "  Model: $cpuModel"
Write-Host "  Cores: $cpuCores"
Write-Host "Memory:"
Write-Host "  Total: $($totalMemory.Sum / 1GB) GB"
Write-Host "Network Adapters:"
$networkInfo | Format-Table -AutoSize


Read-Host "Press any key to continue..."
