# Deploy Flutter App to Google Cloud Platform (GCP)

## 🎯 Deployment Strategy

Since Flutter is having PATH issues locally, we'll use **Docker** to build the app, then deploy to GCP.

---

## 📋 Prerequisites

### 1. Install Google Cloud CLI

Download and install from: https://cloud.google.com/sdk/docs/install

Or use PowerShell to install:

```powershell
# Download installer
Invoke-WebRequest -Uri "https://dl.google.com/dl/cloudsdk/channels/rapid/GoogleCloudSDKInstaller.exe" -OutFile "$env:TEMP\GoogleCloudSDKInstaller.exe"

# Run installer
Start-Process -Wait -FilePath "$env:TEMP\GoogleCloudSDKInstaller.exe"
```

After installation, restart your terminal and verify:

```powershell
gcloud --version
```

### 2. Authenticate with GCP

```powershell
gcloud auth login
gcloud config set project YOUR_PROJECT_ID
```

---

## 🚀 Deployment Options

### **Option 1: Deploy to Cloud Run (Recommended for Flutter Web)**

#### Step 1: Create Dockerfile

Already created in your project: `Dockerfile`

#### Step 2: Build and Deploy

```powershell
# Set your GCP project ID
$PROJECT_ID = "your-project-id"
gcloud config set project $PROJECT_ID

# Build the container image using Cloud Build
gcloud builds submit --tag gcr.io/$PROJECT_ID/flutter-app

# Deploy to Cloud Run
gcloud run deploy flutter-app `
  --image gcr.io/$PROJECT_ID/flutter-app `
  --platform managed `
  --region us-central1 `
  --allow-unauthenticated `
  --port 80

# Get the deployed URL
gcloud run services describe flutter-app --region us-central1 --format 'value(status.url)'
```

---

### **Option 2: Deploy to App Engine**

#### Step 1: Create app.yaml

Already created in your project: `app.yaml`

#### Step 2: Deploy

```powershell
# Set your project
gcloud config set project YOUR_PROJECT_ID

# Deploy to App Engine
gcloud app deploy

# Open your app
gcloud app browse
```

---

### **Option 3: Deploy to Firebase Hosting**

```powershell
# Install Firebase CLI
npm install -g firebase-tools

# Login to Firebase
firebase login

# Initialize Firebase in your project
cd C:\Users\PC\Desktop\sample
firebase init hosting

# When prompted:
# - Select your GCP project
# - Set public directory: build/web
# - Configure as single-page app: Yes
# - Set up automatic builds with GitHub: No (for now)

# Deploy
firebase deploy --only hosting

# Your app will be live at: https://YOUR_PROJECT_ID.web.app
```

---

## 🐳 Using Docker (Works Without Local Flutter)

This approach builds Flutter inside Docker, bypassing local PATH issues.

### Files Created:

1. **`Dockerfile`** - Multi-stage build for Flutter web
2. **`docker-compose.yml`** - For local testing
3. **`.dockerignore`** - Optimize build

### Build and Test Locally:

```powershell
# Build Docker image
docker build -t flutter-app .

# Run locally
docker run -p 8080:80 flutter-app

# Test at: http://localhost:8080
```

### Deploy to GCP Cloud Run:

```powershell
# Submit build to Google Cloud Build
gcloud builds submit --tag gcr.io/YOUR_PROJECT_ID/flutter-app

# Deploy to Cloud Run
gcloud run deploy flutter-app `
  --image gcr.io/YOUR_PROJECT_ID/flutter-app `
  --platform managed `
  --region us-central1 `
  --allow-unauthenticated
```

---

## 📦 What Each File Does

### `Dockerfile`
- Builds Flutter web app in a container
- Uses nginx to serve the static files
- No local Flutter required!

### `app.yaml`
- Configuration for App Engine
- Serves static Flutter web files

### `cloudbuild.yaml`
- Automated build configuration
- Used by Cloud Build to compile your app

---

## 🔐 Update Auth0 Callbacks

After deployment, add your GCP URLs to Auth0:

1. Go to: https://manage.auth0.com
2. Navigate to Applications → Your Application → Settings
3. Add to **Allowed Callback URLs**:
   ```
   https://YOUR_APP_URL.run.app
   https://YOUR_PROJECT_ID.uc.r.appspot.com
   https://YOUR_PROJECT_ID.web.app
   ```
4. Add to **Allowed Logout URLs**: (same URLs)
5. Save changes

---

## 🎯 Recommended Deployment Path

**For your use case, I recommend Cloud Run because:**

1. ✅ Builds Flutter inside Docker (no local Flutter issues)
2. ✅ Auto-scaling
3. ✅ Pay only for usage
4. ✅ HTTPS by default
5. ✅ Easy rollbacks
6. ✅ Works with your Auth0 setup

---

## 📝 Quick Start Commands

```powershell
# 1. Install gcloud CLI (if not installed)
# Download from: https://cloud.google.com/sdk/docs/install

# 2. Login and set project
gcloud auth login
gcloud config set project YOUR_PROJECT_ID

# 3. Deploy to Cloud Run (easiest)
gcloud builds submit --tag gcr.io/YOUR_PROJECT_ID/flutter-app
gcloud run deploy flutter-app --image gcr.io/YOUR_PROJECT_ID/flutter-app --platform managed --region us-central1 --allow-unauthenticated

# 4. Get your app URL
gcloud run services list
```

---

## 🆘 Troubleshooting

### "Docker is not recognized"
Install Docker Desktop: https://www.docker.com/products/docker-desktop

### "gcloud is not recognized"
Install Google Cloud CLI and restart terminal

### "Permission denied"
Run: `gcloud auth login`

### Auth0 login fails after deployment
Add your deployed URL to Auth0 callbacks!

---

## 💰 Cost Estimate

- **Cloud Run**: ~$0 for low traffic (free tier: 2M requests/month)
- **App Engine**: ~$0-5/month for low traffic
- **Firebase Hosting**: Free for most projects

---

Ready to deploy! Start with installing gcloud CLI, then use the Cloud Run option! 🚀
