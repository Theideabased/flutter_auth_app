# Flutter PowerShell Wrapper
# Sets up environment and runs Flutter commands

param(
    [Parameter(ValueFromRemainingArguments=$true)]
    [string[]]$FlutterArgs
)

# Set up PATH with Git and Flutter
$env:PATH = "C:\Program Files\Git\cmd;C:\Program Files\Git\bin;C:\Program Files\Git\usr\bin;C:\src\flutter\bin;$env:PATH"

# Change to Flutter directory
Push-Location C:\src\flutter\bin

# Run Flutter command
$command = ".\flutter.bat " + ($FlutterArgs -join " ")
Write-Host "Running: $command" -ForegroundColor Cyan

Invoke-Expression $command

Pop-Location
