# Check privilege
if ($ExecutionContext.SessionState.CurrentScope.RunAsAdministrator -eq $false) {
    Write-Host "This script requires administrator privileges. Please open it with 'Run as administrator'."
    return
}

# File path
$filePath = Read-Host "Enter the path to the file you want to delete:"


$cred = Get-Credential

Start-Process powershell.exe -Credential $cred -ArgumentList "-Command Remove-Item '$filePath' -Force -Recurse" -WindowStyle Hidden