# Flutter Runner Script - Run this to start your app locally

Write-Host "==================================" -ForegroundColor Cyan
Write-Host " Starting Flutter App Locally" -ForegroundColor Cyan
Write-Host "==================================" -ForegroundColor Cyan

# Set up environment
$env:PATH = "C:\Program Files\Git\mingw64\bin;C:\Program Files\Git\bin;C:\Program Files\Git\cmd;C:\src\flutter\bin;C:\src\flutter\bin\cache\dart-sdk\bin;" + $env:PATH
$env:GIT_HOME = "C:\Program Files\Git"
$env:FLUTTER_ROOT = "C:\src\flutter"

# Change to project directory
Set-Location "C:\Users\PC\Desktop\sample"

Write-Host "`nChecking Flutter..." -ForegroundColor Yellow

# Try to run Flutter directly
try {
    $flutterExe = "C:\src\flutter\bin\flutter.bat"
    
    Write-Host "`nInstalling dependencies..." -ForegroundColor Yellow
    & cmd /c "`"$flutterExe`" pub get"
    
    Write-Host "`nSelect a device when prompted..." -ForegroundColor Green
    Write-Host "Available options:" -ForegroundColor Cyan
    Write-Host "  - Chrome (for web)" -ForegroundColor White
    Write-Host "  - Windows (for desktop)" -ForegroundColor White  
    Write-Host "  - Android device/emulator (if connected)" -ForegroundColor White
    Write-Host ""
    
    & cmd /c "`"$flutterExe`" run"
    
} catch {
    Write-Host "`nError running Flutter: $_" -ForegroundColor Red
    Write-Host "`n=== MANUAL INSTRUCTIONS ===" -ForegroundColor Yellow
    Write-Host "1. Open a NEW PowerShell terminal (close this one)" -ForegroundColor White
    Write-Host "2. Run these commands:" -ForegroundColor White
    Write-Host "   cd C:\Users\PC\Desktop\sample" -ForegroundColor Cyan
    Write-Host "   C:\src\flutter\bin\flutter.bat doctor" -ForegroundColor Cyan
    Write-Host "   C:\src\flutter\bin\flutter.bat pub get" -ForegroundColor Cyan
    Write-Host "   C:\src\flutter\bin\flutter.bat run" -ForegroundColor Cyan
}

Write-Host "`nPress any key to exit..." -ForegroundColor Gray
$null = $Host.UI.RawUI.ReadKey("NoEcho,IncludeKeyDown")
