# Flutter App Deployment Guide

## ✅ Flutter Setup Completed!
Flutter SDK has been installed at: `C:\src\flutter`

## 🔄 **Next Steps: Restart Your Terminal**

1. **Close this terminal** (or open a new one in VS Code: `Ctrl + Shift + \``)
2. **Run these commands:**

```powershell
# Verify Flutter is working
flutter doctor

# Get your project dependencies
cd C:\Users\PC\Desktop\sample
flutter pub get

# Run your app locally
flutter run
```

---

## 📱 **Deployment Options**

### **1. Android Deployment**

#### **Build APK (For Testing)**
```powershell
flutter build apk --release
```
- **Output:** `build\app\outputs\flutter-apk\app-release.apk`
- Install directly on Android devices
- Share via email/USB/cloud storage

#### **Build App Bundle (For Google Play Store)**
```powershell
flutter build appbundle --release
```
- **Output:** `build\app\outputs\bundle\release\app-release.aab`
- Upload to Google Play Console
- Required for Play Store publishing

**Prerequisites:**
- Android Studio installed
- Configure signing keys (keystore)

**Setup Signing:**
1. Create keystore:
```powershell
keytool -genkey -v -keystore C:\Users\PC\key.jks -storetype JKS -keyalg RSA -keysize 2048 -validity 10000 -alias key
```

2. Create `android/key.properties`:
```properties
storePassword=<your-password>
keyPassword=<your-password>
keyAlias=key
storeFile=C:/Users/PC/key.jks
```

3. Update `android/app/build.gradle` to use the keystore

---

### **2. iOS Deployment** (Requires Mac)

```bash
flutter build ios --release
```
- Use Xcode to create IPA
- Upload to App Store Connect
- Requires Apple Developer account ($99/year)

---

### **3. Web Deployment**

```powershell
flutter build web --release
```
- **Output:** `build\web\`
- Deploy to any static hosting service

#### **Deploy to Firebase Hosting:**
```powershell
npm install -g firebase-tools
firebase login
firebase init hosting
# Select build/web as public directory
firebase deploy
```

#### **Deploy to Netlify:**
1. Go to https://netlify.com
2. Drag and drop the `build\web` folder
3. Done!

#### **Deploy to Vercel:**
```powershell
npm i -g vercel
cd build\web
vercel
```

#### **Deploy to GitHub Pages:**
```powershell
# Add to your repository
git add build/web
git commit -m "Deploy web build"
git subtree push --prefix build/web origin gh-pages
```

---

### **4. Windows Desktop Deployment**

```powershell
flutter build windows --release
```
- **Output:** `build\windows\runner\Release\`
- Distribute the entire `Release` folder as a zip
- Users run `sample.exe`

**Create Installer (Optional):**
Use Inno Setup or NSIS to create a Windows installer

---

## 🔑 **Auth0 Configuration for Production**

Before deploying, update your Auth0 dashboard with production callback URLs:

### **Android:**
```
com.auth0.sample://dev-r1s7xzqfu3rt2lmr.us.auth0.com/android/com.auth0.sample/callback
```

### **iOS:**
```
https://dev-r1s7xzqfu3rt2lmr.us.auth0.com/ios/com.auth0.sample/callback
com.auth0.sample://dev-r1s7xzqfu3rt2lmr.us.auth0.com/ios/com.auth0.sample/callback
```

### **Web:**
Add your production domain:
```
https://yourdomain.com
```

---

## 📋 **Pre-Deployment Checklist**

- [ ] Run `flutter doctor` and fix all issues
- [ ] Test on real devices (Android/iOS)
- [ ] Update app version in `pubspec.yaml`
- [ ] Configure app icons (android/ios folders)
- [ ] Set up signing keys for Android
- [ ] Update `.env` for production (if needed)
- [ ] Test Auth0 login flow
- [ ] Create screenshots for app stores
- [ ] Write app description
- [ ] Create privacy policy

---

## 🚀 **Quick Deploy Commands**

```powershell
# Android (APK for testing)
flutter build apk --release

# Android (App Bundle for Play Store)
flutter build appbundle --release

# Web
flutter build web --release

# Windows
flutter build windows --release
```

---

## 📞 **Support**

If you encounter issues:
1. Run `flutter doctor -v` for detailed diagnostics
2. Check `flutter pub get` runs successfully
3. Verify Auth0 credentials in `.env` file
4. Check Android/iOS manifest files for correct callback URLs

---

**Ready to deploy!** 🎉
