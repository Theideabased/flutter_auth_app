# 🚀 Quick GCP Deployment Steps

## Prerequisites (Do these first!)

### 1. Install Google Cloud CLI
Download and install: https://cloud.google.com/sdk/docs/install

After installation, **restart your terminal**

### 2. Verify Installation
```powershell
gcloud --version
```

### 3. Login to GCP
```powershell
gcloud auth login
```

---

## 🎯 Deploy Now! (Choose One Method)

### **Option A: Automated Script (Easiest)**

```powershell
cd C:\Users\PC\Desktop\sample
.\deploy_gcp.ps1
```

Follow the prompts!

---

### **Option B: Manual - Cloud Run (Recommended)**

```powershell
# 1. Set your project
gcloud config set project YOUR_PROJECT_ID

# 2. Enable APIs
gcloud services enable cloudbuild.googleapis.com run.googleapis.com

# 3. Build and deploy (takes 10-15 minutes)
gcloud builds submit --tag gcr.io/YOUR_PROJECT_ID/flutter-app

# 4. Deploy to Cloud Run
gcloud run deploy flutter-app `
  --image gcr.io/YOUR_PROJECT_ID/flutter-app `
  --platform managed `
  --region us-central1 `
  --allow-unauthenticated `
  --port 80

# 5. Get your app URL
gcloud run services list
```

---

### **Option C: Firebase Hosting**

```powershell
# 1. Install Firebase CLI
npm install -g firebase-tools

# 2. Login
firebase login

# 3. Initialize (in your project folder)
cd C:\Users\PC\Desktop\sample
firebase init hosting

# 4. Deploy
firebase deploy --only hosting
```

---

## 🔐 After Deployment - Update Auth0

1. Go to: https://manage.auth0.com
2. Applications → Your App → Settings
3. Add your deployed URL to:
   - **Allowed Callback URLs**: `https://your-app-url.run.app`
   - **Allowed Logout URLs**: `https://your-app-url.run.app`
   - **Allowed Web Origins**: `https://your-app-url.run.app`
4. **Save Changes**

---

## 📋 Files Created for Deployment

- ✅ `Dockerfile` - Builds Flutter in Docker
- ✅ `nginx.conf` - Web server configuration
- ✅ `app.yaml` - App Engine config
- ✅ `cloudbuild.yaml` - Cloud Build config
- ✅ `docker-compose.yml` - Local Docker testing
- ✅ `.dockerignore` - Optimize Docker build
- ✅ `deploy_gcp.ps1` - Automated deployment script
- ✅ `GCP_DEPLOYMENT_GUIDE.md` - Detailed guide

---

## ⚡ Why This Works Without Local Flutter

The `Dockerfile` installs and runs Flutter **inside the container**, so your local Flutter PATH issues don't matter!

---

## 💰 Estimated Costs

- **Cloud Run**: FREE for first 2M requests/month
- **Firebase Hosting**: FREE for 10GB/month
- **App Engine**: ~$0-5/month for low traffic

---

## 🆘 Troubleshooting

**"gcloud: command not found"**
→ Install gcloud CLI and restart terminal

**"Permission denied"**
→ Run: `gcloud auth login`

**"Project not found"**
→ Create project at: https://console.cloud.google.com

**"API not enabled"**
→ Run: `gcloud services enable cloudbuild.googleapis.com run.googleapis.com`

**Auth0 login doesn't work**
→ Update Auth0 callbacks with your deployed URL!

---

## 🎬 Quick Start (Copy & Paste)

```powershell
# Install gcloud (if not installed)
# Download from: https://cloud.google.com/sdk/docs/install

# Login
gcloud auth login

# Deploy using script
cd C:\Users\PC\Desktop\sample
.\deploy_gcp.ps1
```

That's it! 🎉
