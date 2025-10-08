# ⚡ Deploy to Vercel in 5 Minutes

## 🎯 Easiest Method (No Installation Required!)

### Step 1: Push to GitHub (2 minutes)

```powershell
cd C:\Users\PC\Desktop\sample

# Initialize git
git init

# Add all files
git add .

# Commit
git commit -m "Deploy Flutter app"

# Create a new repository on GitHub first:
# → https://github.com/new

# Then push (replace with your repo URL):
git remote add origin https://github.com/YOUR_USERNAME/YOUR_REPO.git
git branch -M main
git push -u origin main
```

### Step 2: Deploy on Vercel (3 minutes)

1. **Go to**: https://vercel.com/new
2. **Login** with GitHub
3. **Click** "Import" next to your repository
4. **Configure**:
   - Build Command: `chmod +x build.sh && ./build.sh`
   - Output Directory: `build/web`
5. **Click** "Deploy"

**Done!** Your app will be live in ~10 minutes at `https://your-app.vercel.app`

---

## 🔐 Update Auth0 (Required!)

After deployment:

1. **Copy your Vercel URL** (e.g., `https://your-app.vercel.app`)
2. **Go to**: https://manage.auth0.com
3. **Navigate to**: Applications → Your App → Settings
4. **Add URL to**:
   - Allowed Callback URLs
   - Allowed Logout URLs
   - Allowed Web Origins
5. **Save**

---

## 🚀 Or Use the Script

```powershell
.\deploy_vercel.ps1
```

Choose option 1 and follow the instructions!

---

## ✅ Files Ready for Deployment

- ✅ `vercel.json` - Vercel configuration
- ✅ `build.sh` - Build script (installs Flutter automatically!)
- ✅ `.vercelignore` - Optimization

---

## 💡 Why This Works

Vercel builds Flutter **in the cloud**, so your local PATH issues don't matter!

---

## 📊 What You Get

- ✅ FREE hosting
- ✅ Auto HTTPS
- ✅ Global CDN
- ✅ Auto-deploy on git push
- ✅ Custom domain support

---

**Start now**: https://github.com/new (create repo) → https://vercel.com/new (deploy)
