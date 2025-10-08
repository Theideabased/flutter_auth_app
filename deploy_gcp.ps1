# GCP Deployment Script for Flutter App
# This script deploys your Flutter app to Google Cloud Platform

Write-Host "========================================" -ForegroundColor Cyan
Write-Host "  Flutter App - GCP Deployment" -ForegroundColor Cyan
Write-Host "========================================" -ForegroundColor Cyan
Write-Host ""

# Check if gcloud is installed
try {
    $gcloudVersion = gcloud --version 2>&1
    Write-Host "✓ Google Cloud CLI is installed" -ForegroundColor Green
} catch {
    Write-Host "✗ Google Cloud CLI not found!" -ForegroundColor Red
    Write-Host ""
    Write-Host "Please install Google Cloud CLI:" -ForegroundColor Yellow
    Write-Host "https://cloud.google.com/sdk/docs/install" -ForegroundColor Cyan
    Write-Host ""
    Write-Host "After installation, restart this terminal and run this script again." -ForegroundColor Yellow
    exit 1
}

Write-Host ""

# Get project ID
$projectId = Read-Host "Enter your GCP Project ID"

if ([string]::IsNullOrWhiteSpace($projectId)) {
    Write-Host "✗ Project ID is required!" -ForegroundColor Red
    exit 1
}

# Set the project
Write-Host "`nSetting GCP project to: $projectId" -ForegroundColor Yellow
gcloud config set project $projectId

Write-Host ""
Write-Host "Choose deployment method:" -ForegroundColor Yellow
Write-Host "1. Cloud Run (Recommended - containerized, auto-scaling)" -ForegroundColor White
Write-Host "2. App Engine (Static hosting)" -ForegroundColor White
Write-Host "3. Firebase Hosting (Fast, CDN-enabled)" -ForegroundColor White
Write-Host "4. Just build Docker image locally (for testing)" -ForegroundColor White
Write-Host ""

$choice = Read-Host "Enter your choice (1-4)"

switch ($choice) {
    "1" {
        Write-Host "`n=== Deploying to Cloud Run ===" -ForegroundColor Cyan
        
        # Enable required APIs
        Write-Host "`nEnabling required APIs..." -ForegroundColor Yellow
        gcloud services enable cloudbuild.googleapis.com
        gcloud services enable run.googleapis.com
        gcloud services enable containerregistry.googleapis.com
        
        # Build and push image
        Write-Host "`nBuilding and pushing Docker image to GCR..." -ForegroundColor Yellow
        Write-Host "This may take 10-15 minutes..." -ForegroundColor Gray
        gcloud builds submit --tag gcr.io/$projectId/flutter-app
        
        if ($LASTEXITCODE -eq 0) {
            # Deploy to Cloud Run
            Write-Host "`nDeploying to Cloud Run..." -ForegroundColor Yellow
            gcloud run deploy flutter-app `
                --image gcr.io/$projectId/flutter-app `
                --platform managed `
                --region us-central1 `
                --allow-unauthenticated `
                --port 80
            
            if ($LASTEXITCODE -eq 0) {
                Write-Host "`n✓ Deployment successful!" -ForegroundColor Green
                
                # Get the service URL
                $serviceUrl = gcloud run services describe flutter-app --region us-central1 --format 'value(status.url)'
                Write-Host "`nYour app is live at:" -ForegroundColor Green
                Write-Host $serviceUrl -ForegroundColor Cyan
                
                Write-Host "`n⚠️  IMPORTANT: Update Auth0 Callbacks!" -ForegroundColor Yellow
                Write-Host "Add this URL to your Auth0 dashboard:" -ForegroundColor White
                Write-Host "  Allowed Callback URLs: $serviceUrl" -ForegroundColor Cyan
                Write-Host "  Allowed Logout URLs: $serviceUrl" -ForegroundColor Cyan
            }
        } else {
            Write-Host "`n✗ Build failed!" -ForegroundColor Red
        }
    }
    
    "2" {
        Write-Host "`n=== Deploying to App Engine ===" -ForegroundColor Cyan
        Write-Host "⚠️  Note: You need to build Flutter web locally first" -ForegroundColor Yellow
        Write-Host "This requires Flutter to be working on your machine." -ForegroundColor Yellow
        Write-Host ""
        
        $continue = Read-Host "Do you have build/web folder ready? (y/n)"
        
        if ($continue -eq 'y') {
            gcloud app deploy app.yaml
            
            if ($LASTEXITCODE -eq 0) {
                Write-Host "`n✓ Deployment successful!" -ForegroundColor Green
                gcloud app browse
            }
        } else {
            Write-Host "Please build your app first with: flutter build web --release" -ForegroundColor Yellow
        }
    }
    
    "3" {
        Write-Host "`n=== Deploying to Firebase Hosting ===" -ForegroundColor Cyan
        
        # Check if Firebase CLI is installed
        try {
            firebase --version 2>&1 | Out-Null
            Write-Host "✓ Firebase CLI is installed" -ForegroundColor Green
        } catch {
            Write-Host "Installing Firebase CLI..." -ForegroundColor Yellow
            npm install -g firebase-tools
        }
        
        Write-Host "`nInitializing Firebase..." -ForegroundColor Yellow
        firebase login
        
        Write-Host "`nRun these commands manually:" -ForegroundColor Yellow
        Write-Host "  firebase init hosting" -ForegroundColor Cyan
        Write-Host "  firebase deploy --only hosting" -ForegroundColor Cyan
    }
    
    "4" {
        Write-Host "`n=== Building Docker Image Locally ===" -ForegroundColor Cyan
        
        # Check if Docker is installed
        try {
            docker --version 2>&1 | Out-Null
            Write-Host "✓ Docker is installed" -ForegroundColor Green
        } catch {
            Write-Host "✗ Docker not found!" -ForegroundColor Red
            Write-Host "Please install Docker Desktop: https://www.docker.com/products/docker-desktop" -ForegroundColor Yellow
            exit 1
        }
        
        Write-Host "`nBuilding Docker image..." -ForegroundColor Yellow
        docker build -t flutter-app .
        
        if ($LASTEXITCODE -eq 0) {
            Write-Host "`n✓ Build successful!" -ForegroundColor Green
            Write-Host "`nTo run locally:" -ForegroundColor Yellow
            Write-Host "  docker run -p 8080:80 flutter-app" -ForegroundColor Cyan
            Write-Host "`nThen open: http://localhost:8080" -ForegroundColor Cyan
            
            $runNow = Read-Host "`nRun the container now? (y/n)"
            if ($runNow -eq 'y') {
                Write-Host "`nStarting container..." -ForegroundColor Yellow
                Write-Host "Press Ctrl+C to stop" -ForegroundColor Gray
                docker run -p 8080:80 flutter-app
            }
        } else {
            Write-Host "`n✗ Build failed!" -ForegroundColor Red
        }
    }
    
    default {
        Write-Host "Invalid choice!" -ForegroundColor Red
    }
}

Write-Host "`nDone!" -ForegroundColor Green
