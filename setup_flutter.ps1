# Flutter Setup Script for Your Project
Write-Host "Setting up Flutter..." -ForegroundColor Green

# Add Flutter to PATH for current session
$flutterPath = "C:\src\flutter\bin"
$env:Path += ";$flutterPath"

# Add Flutter to PATH permanently
Write-Host "Adding Flutter to system PATH..." -ForegroundColor Yellow
[Environment]::SetEnvironmentVariable("Path", [Environment]::GetEnvironmentVariable("Path", "User") + ";$flutterPath", "User")

# Run Flutter Doctor
Write-Host "`nRunning Flutter Doctor..." -ForegroundColor Yellow
flutter doctor

# Get project dependencies
Write-Host "`nInstalling project dependencies..." -ForegroundColor Yellow
cd C:\Users\PC\Desktop\sample
flutter pub get

Write-Host "`n✅ Setup complete! You can now run 'flutter run' to start your app." -ForegroundColor Green
Write-Host "`nMake sure you have:" -ForegroundColor Cyan
Write-Host "  - Android Studio installed (for Android development)" -ForegroundColor White
Write-Host "  - Chrome installed (for web development)" -ForegroundColor White
Write-Host "  - A device connected or emulator running" -ForegroundColor White
