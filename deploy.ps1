# Quick Deployment Script for Flutter App
# Run this after restarting your terminal

Write-Host "==================================" -ForegroundColor Cyan
Write-Host "   Flutter Deployment Helper" -ForegroundColor Cyan
Write-Host "==================================" -ForegroundColor Cyan
Write-Host ""

# Check if Flutter is available
try {
    $flutterVersion = flutter --version 2>&1
    Write-Host "✓ Flutter is installed" -ForegroundColor Green
} catch {
    Write-Host "✗ Flutter not found. Please restart your terminal first!" -ForegroundColor Red
    exit 1
}

# Navigate to project
cd C:\Users\PC\Desktop\sample

Write-Host "`nWhat would you like to build?" -ForegroundColor Yellow
Write-Host "1. Run locally (for testing)"
Write-Host "2. Build Android APK (for testing/distribution)"
Write-Host "3. Build Android App Bundle (for Google Play Store)"
Write-Host "4. Build Web (for hosting)"
Write-Host "5. Build Windows Desktop"
Write-Host "6. Run Flutter Doctor"
Write-Host ""

$choice = Read-Host "Enter your choice (1-6)"

switch ($choice) {
    "1" {
        Write-Host "`nGetting dependencies..." -ForegroundColor Yellow
        flutter pub get
        Write-Host "`nRunning app..." -ForegroundColor Green
        flutter run
    }
    "2" {
        Write-Host "`nBuilding Android APK..." -ForegroundColor Yellow
        flutter build apk --release
        Write-Host "`n✓ APK created at: build\app\outputs\flutter-apk\app-release.apk" -ForegroundColor Green
        Write-Host "You can install this on any Android device!" -ForegroundColor Cyan
    }
    "3" {
        Write-Host "`nBuilding Android App Bundle..." -ForegroundColor Yellow
        flutter build appbundle --release
        Write-Host "`n✓ App Bundle created at: build\app\outputs\bundle\release\app-release.aab" -ForegroundColor Green
        Write-Host "Upload this to Google Play Console!" -ForegroundColor Cyan
    }
    "4" {
        Write-Host "`nBuilding Web app..." -ForegroundColor Yellow
        flutter build web --release
        Write-Host "`n✓ Web build created at: build\web\" -ForegroundColor Green
        Write-Host "Deploy this folder to any web hosting service!" -ForegroundColor Cyan
    }
    "5" {
        Write-Host "`nBuilding Windows app..." -ForegroundColor Yellow
        flutter build windows --release
        Write-Host "`n✓ Windows app created at: build\windows\runner\Release\" -ForegroundColor Green
        Write-Host "Distribute the entire Release folder!" -ForegroundColor Cyan
    }
    "6" {
        Write-Host "`nRunning Flutter Doctor..." -ForegroundColor Yellow
        flutter doctor -v
    }
    default {
        Write-Host "Invalid choice!" -ForegroundColor Red
    }
}

Write-Host "`nDone! Check DEPLOYMENT_GUIDE.md for more details." -ForegroundColor Green
