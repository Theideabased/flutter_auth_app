# 🚀 Deploy Flutter App to Vercel

## ✨ Why Vercel?

- ✅ **FREE** hosting with custom domain
- ✅ **No installation required** (deploy via GitHub)
- ✅ **Auto-deploy** on every push
- ✅ **Global CDN** for fast loading
- ✅ **HTTPS** by default
- ✅ **Perfect for Flutter Web**

---

## 🎯 Deployment Method 1: Via GitHub (Recommended - Easiest!)

### Step 1: Push Your Code to GitHub

1. **Create a new repository** on GitHub:
   - Go to: https://github.com/new
   - Name it: `flutter-auth0-app` (or any name)
   - Make it **Public** or **Private**
   - Click "Create repository"

2. **Push your code** (run in your project folder):

```powershell
cd C:\Users\PC\Desktop\sample

# Initialize git (if not already)
git init

# Add all files
git add .

# Commit
git commit -m "Initial commit - Flutter app with Auth0"

# Add remote (replace YOUR_USERNAME with your GitHub username)
git remote add origin https://github.com/YOUR_USERNAME/flutter-auth0-app.git

# Push to GitHub
git push -u origin main
```

### Step 2: Deploy to Vercel

1. **Go to Vercel**: https://vercel.com
2. **Sign up/Login** with GitHub
3. **Click "Add New Project"**
4. **Import your GitHub repository**
5. **Configure the build**:
   - **Framework Preset**: Other
   - **Build Command**: `chmod +x build.sh && ./build.sh`
   - **Output Directory**: `build/web`
   - **Install Command**: Leave empty
6. **Click "Deploy"**

**That's it!** Vercel will build and deploy your app in ~5-10 minutes.

---

## 🎯 Deployment Method 2: Via Vercel CLI

### Install Vercel CLI

```powershell
# Install Node.js first if you don't have it
# Download from: https://nodejs.org/

# Install Vercel CLI
npm install -g vercel

# Login to Vercel
vercel login

# Deploy
cd C:\Users\PC\Desktop\sample
vercel
```

Follow the prompts and your app will be deployed!

---

## 🎯 Deployment Method 3: Manual Upload (No Git Required!)

### Step 1: Build Locally

Since Flutter has PATH issues, we'll use GitHub Actions or Vercel's cloud build instead.

**Skip this if using Method 1 or 2 above.**

---

## 📁 Files Created

- ✅ `vercel.json` - Vercel configuration
- ✅ `build.sh` - Build script for Vercel
- ✅ `.vercelignore` - Files to ignore during deployment

---

## 🔐 Update Auth0 After Deployment

1. **Get your Vercel URL** (e.g., `https://your-app.vercel.app`)
2. **Go to Auth0 Dashboard**: https://manage.auth0.com
3. **Navigate to**: Applications → Your App → Settings
4. **Add to Allowed Callback URLs**:
   ```
   https://your-app.vercel.app
   ```
5. **Add to Allowed Logout URLs**:
   ```
   https://your-app.vercel.app
   ```
6. **Add to Allowed Web Origins**:
   ```
   https://your-app.vercel.app
   ```
7. **Save Changes**

---

## 🎨 Custom Domain (Optional)

1. In Vercel dashboard, go to your project
2. Click "Domains"
3. Add your custom domain
4. Update DNS settings as instructed
5. Update Auth0 with your custom domain

---

## 🚀 Quick Start (Easiest Path)

### Option A: If you have Node.js/npm

```powershell
# Install Vercel CLI
npm install -g vercel

# Deploy
cd C:\Users\PC\Desktop\sample
vercel

# Follow the prompts and you're done!
```

### Option B: No Node.js? Use GitHub!

1. **Push code to GitHub** (see Step 1 above)
2. **Import to Vercel**: https://vercel.com/new
3. **Done!** ✨

---

## ⚡ Environment Variables

If you need to use different Auth0 credentials for production:

1. In Vercel dashboard → Settings → Environment Variables
2. Add:
   - `AUTH0_DOMAIN`: your-domain.auth0.com
   - `AUTH0_CLIENT_ID`: your-client-id
   - `AUTH0_CUSTOM_SCHEME`: com.auth0.sample

---

## 📊 Deployment Comparison

| Method | Time | Difficulty | Auto-Deploy |
|--------|------|------------|-------------|
| **GitHub + Vercel** | 10 min | Easy | ✅ Yes |
| **Vercel CLI** | 5 min | Medium | ❌ No |
| **Manual** | 15 min | Hard | ❌ No |

**Recommendation**: Use GitHub + Vercel method!

---

## 🆘 Troubleshooting

### "Build failed"
- Check that `vercel.json` and `build.sh` are in your project root
- Make sure `.env` file is committed to the repository

### "Auth0 login doesn't work"
- Update Auth0 callbacks with your Vercel URL
- Clear browser cache and try again

### "Page not found"
- Check that Output Directory is set to `build/web`
- Make sure the build completed successfully

---

## 💰 Cost

**FREE!**
- Vercel Hobby plan includes:
  - Unlimited deployments
  - 100GB bandwidth/month
  - Free SSL/HTTPS
  - Custom domains

---

## 🎉 Next Steps After Deployment

1. ✅ Test your app at the Vercel URL
2. ✅ Update Auth0 callbacks
3. ✅ Test Auth0 login flow
4. ✅ Add custom domain (optional)
5. ✅ Set up automatic deployments via GitHub

---

**Ready to deploy?** Choose one of the methods above and let's get your app live! 🚀
