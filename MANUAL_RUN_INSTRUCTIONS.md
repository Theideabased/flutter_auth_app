# MANUAL SETUP - Run Flutter Locally

## The Problem
Flutter's batch files are having trouble finding Git in the current terminal sessions.

## ✅ SOLUTION: Use a Fresh Terminal

### **Step 1: Close ALL VS Code terminals**
- Close this terminal and any other PowerShell windows

### **Step 2: Open a BRAND NEW Terminal**
1. In VS Code, press **Ctrl + Shift + `** (backtick) to open a new terminal
2. Or click: Terminal → New Terminal

### **Step 3: Run These Commands** (copy one at a time)

```powershell
# Navigate to your project
cd C:\Users\PC\Desktop\sample

# Run Flutter doctor (this will initialize Flutter for the first time)
C:\src\flutter\bin\flutter.bat doctor

# Install project dependencies  
C:\src\flutter\bin\flutter.bat pub get

# Run the app (choose Chrome or Windows when prompted)
C:\src\flutter\bin\flutter.bat run
```

---

## Alternative: Use Windows Command Prompt (CMD)

If PowerShell still doesn't work:

1. **Open CMD** (not PowerShell):
   - Press `Win + R`
   - Type `cmd`
   - Press Enter

2. **Run these commands:**
```cmd
cd C:\Users\PC\Desktop\sample
set PATH=C:\Program Files\Git\bin;C:\src\flutter\bin;%PATH%
flutter doctor
flutter pub get
flutter run
```

---

## ⚡ Quick Test

To verify Flutter is working, open a **NEW terminal** and run:
```powershell
flutter --version
```

If you see the Flutter version, you're good to go!

If you still see "command not found", restart VS Code completely.

---

## 🎯 Expected Output

When you run `flutter run`, you should see:

```
Multiple devices found:
Windows (desktop) • windows • windows-x64 • Microsoft Windows...
Chrome (web) • chrome • web-javascript • Google Chrome...
```

Choose one and your app will start!

---

## 🔧 If Still Not Working

### **Option 1: Restart VS Code Completely**
- Close VS Code entirely
- Reopen it
- Try again

### **Option 2: Restart Your Computer**
Sometimes Windows needs a reboot to pick up PATH changes.

### **Option 3: Use Full Paths**
Always use the full path:
```powershell
C:\src\flutter\bin\flutter.bat [command]
```

---

## 📱 Once It's Running

Your app will open in:
- **Chrome** (web version)
- **Windows app window** (desktop version)

You should see the Auth0 login screen. Click "Login" to test!

---

Good luck! The PATH has been set, you just need a fresh terminal session! 🚀
