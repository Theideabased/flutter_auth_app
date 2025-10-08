# Vercel Deployment Helper Script

Write-Host "========================================" -ForegroundColor Cyan
Write-Host "  Deploy Flutter App to Vercel" -ForegroundColor Cyan
Write-Host "========================================" -ForegroundColor Cyan
Write-Host ""

$projectPath = "C:\Users\PC\Desktop\sample"
cd $projectPath

Write-Host "Choose your deployment method:" -ForegroundColor Yellow
Write-Host ""
Write-Host "1. Deploy via GitHub + Vercel (Recommended - No installs needed!)" -ForegroundColor White
Write-Host "2. Deploy via Vercel CLI (Requires Node.js)" -ForegroundColor White
Write-Host "3. Setup Git and push to GitHub (First step for option 1)" -ForegroundColor White
Write-Host "4. Just show me the instructions" -ForegroundColor White
Write-Host ""

$choice = Read-Host "Enter your choice (1-4)"

switch ($choice) {
    "1" {
        Write-Host "`n=== GitHub + Vercel Deployment ===" -ForegroundColor Cyan
        Write-Host ""
        Write-Host "📋 Follow these steps:" -ForegroundColor Yellow
        Write-Host ""
        Write-Host "1. Create a new repository on GitHub:" -ForegroundColor White
        Write-Host "   → https://github.com/new" -ForegroundColor Cyan
        Write-Host ""
        Write-Host "2. Run these commands to push your code:" -ForegroundColor White
        Write-Host ""
        Write-Host "   cd C:\Users\PC\Desktop\sample" -ForegroundColor Cyan
        Write-Host "   git init" -ForegroundColor Cyan
        Write-Host "   git add ." -ForegroundColor Cyan
        Write-Host '   git commit -m "Initial commit"' -ForegroundColor Cyan
        Write-Host "   git remote add origin https://github.com/YOUR_USERNAME/REPO_NAME.git" -ForegroundColor Cyan
        Write-Host "   git branch -M main" -ForegroundColor Cyan
        Write-Host "   git push -u origin main" -ForegroundColor Cyan
        Write-Host ""
        Write-Host "3. Go to Vercel and import your repository:" -ForegroundColor White
        Write-Host "   → https://vercel.com/new" -ForegroundColor Cyan
        Write-Host ""
        Write-Host "4. Configure build settings:" -ForegroundColor White
        Write-Host "   Build Command: chmod +x build.sh && ./build.sh" -ForegroundColor Cyan
        Write-Host "   Output Directory: build/web" -ForegroundColor Cyan
        Write-Host ""
        Write-Host "5. Click Deploy and wait ~10 minutes!" -ForegroundColor White
        Write-Host ""
        Write-Host "✨ Your app will be live at: https://your-app.vercel.app" -ForegroundColor Green
    }
    
    "2" {
        Write-Host "`n=== Vercel CLI Deployment ===" -ForegroundColor Cyan
        
        # Check if npm is installed
        try {
            npm --version 2>&1 | Out-Null
            Write-Host "✓ npm is installed" -ForegroundColor Green
            
            Write-Host "`nInstalling Vercel CLI..." -ForegroundColor Yellow
            npm install -g vercel
            
            Write-Host "`nLogging in to Vercel..." -ForegroundColor Yellow
            vercel login
            
            Write-Host "`nDeploying to Vercel..." -ForegroundColor Yellow
            Write-Host "⚠️  Note: This will fail because Flutter needs to be built in Vercel's environment" -ForegroundColor Yellow
            Write-Host "Use Option 1 (GitHub + Vercel) instead for automatic builds!" -ForegroundColor Yellow
            
            $continue = Read-Host "`nContinue anyway? (y/n)"
            if ($continue -eq 'y') {
                vercel
            }
            
        } catch {
            Write-Host "✗ npm not found!" -ForegroundColor Red
            Write-Host ""
            Write-Host "Please install Node.js first:" -ForegroundColor Yellow
            Write-Host "→ https://nodejs.org/" -ForegroundColor Cyan
            Write-Host ""
            Write-Host "After installation, restart this terminal and try again." -ForegroundColor Yellow
            Write-Host ""
            Write-Host "OR use Option 1 (GitHub + Vercel) which doesn't require npm!" -ForegroundColor Green
        }
    }
    
    "3" {
        Write-Host "`n=== Setting up Git ===" -ForegroundColor Cyan
        
        # Check if git is installed
        try {
            git --version 2>&1 | Out-Null
            Write-Host "✓ Git is installed" -ForegroundColor Green
        } catch {
            Write-Host "✗ Git not found!" -ForegroundColor Red
            Write-Host "Please install Git: https://git-scm.com/download/win" -ForegroundColor Yellow
            exit 1
        }
        
        Write-Host ""
        $repoUrl = Read-Host "Enter your GitHub repository URL (e.g., https://github.com/username/repo.git)"
        
        if ([string]::IsNullOrWhiteSpace($repoUrl)) {
            Write-Host "✗ Repository URL is required!" -ForegroundColor Red
            Write-Host ""
            Write-Host "Create a repository at: https://github.com/new" -ForegroundColor Yellow
            exit 1
        }
        
        Write-Host "`nInitializing Git repository..." -ForegroundColor Yellow
        git init
        
        Write-Host "Adding files..." -ForegroundColor Yellow
        git add .
        
        Write-Host "Creating commit..." -ForegroundColor Yellow
        git commit -m "Initial commit - Flutter app with Auth0"
        
        Write-Host "Adding remote..." -ForegroundColor Yellow
        git remote add origin $repoUrl
        
        Write-Host "Setting main branch..." -ForegroundColor Yellow
        git branch -M main
        
        Write-Host "Pushing to GitHub..." -ForegroundColor Yellow
        git push -u origin main
        
        if ($LASTEXITCODE -eq 0) {
            Write-Host "`n✓ Code pushed to GitHub successfully!" -ForegroundColor Green
            Write-Host ""
            Write-Host "Next steps:" -ForegroundColor Yellow
            Write-Host "1. Go to: https://vercel.com/new" -ForegroundColor Cyan
            Write-Host "2. Import your GitHub repository" -ForegroundColor Cyan
            Write-Host "3. Set Build Command: chmod +x build.sh && ./build.sh" -ForegroundColor Cyan
            Write-Host "4. Set Output Directory: build/web" -ForegroundColor Cyan
            Write-Host "5. Click Deploy!" -ForegroundColor Cyan
        } else {
            Write-Host "`n✗ Push failed!" -ForegroundColor Red
            Write-Host "Make sure you've created the repository on GitHub first." -ForegroundColor Yellow
        }
    }
    
    "4" {
        Write-Host "`nOpening deployment guide..." -ForegroundColor Yellow
        
        if (Test-Path "VERCEL_DEPLOYMENT.md") {
            code VERCEL_DEPLOYMENT.md
        } else {
            Write-Host "✗ VERCEL_DEPLOYMENT.md not found!" -ForegroundColor Red
        }
        
        Write-Host ""
        Write-Host "📋 Quick Summary:" -ForegroundColor Cyan
        Write-Host ""
        Write-Host "EASIEST METHOD:" -ForegroundColor Green
        Write-Host "1. Push code to GitHub" -ForegroundColor White
        Write-Host "2. Import to Vercel (https://vercel.com/new)" -ForegroundColor White
        Write-Host "3. Deploy!" -ForegroundColor White
        Write-Host ""
        Write-Host "NO installation required on your machine!" -ForegroundColor Yellow
    }
    
    default {
        Write-Host "Invalid choice!" -ForegroundColor Red
    }
}

Write-Host ""
Write-Host "========================================" -ForegroundColor Cyan
Write-Host "Need help? Check VERCEL_DEPLOYMENT.md" -ForegroundColor Gray
Write-Host "========================================" -ForegroundColor Cyan
