# 📥 Download & Setup Requirements for Local Build

This guide will help you install everything needed to build Android APKs locally.

## Requirements Checklist

- [ ] Java JDK 11 or higher
- [ ] Android Studio
- [ ] Android SDK (comes with Android Studio)
- [ ] ANDROID_HOME environment variable set

---

## 1. Java JDK (11 or higher)

### Check if you have Java:
```bash
java -version
```

### Download Java JDK

**Option A: Oracle JDK (Recommended)**
- Download: https://www.oracle.com/java/technologies/downloads/
- Choose: **Java 17 LTS** or **Java 21 LTS** (Windows x64 Installer)
- Install the downloaded `.exe` file
- Default install path: `C:\Program Files\Java\jdk-XX`

**Option B: OpenJDK (Free, Open Source)**
- Download: https://adoptium.net/
- Choose: **Temurin 17 LTS** or **Temurin 21 LTS** (Windows x64)
- Install the downloaded `.msi` file

### Set JAVA_HOME (if not auto-set)

1. Open **System Properties** → **Environment Variables**
2. Under **System Variables**, click **New**
3. Variable name: `JAVA_HOME`
4. Variable value: `C:\Program Files\Java\jdk-17` (or your JDK path)
5. Click **OK**

### Verify Installation
```bash
java -version
javac -version
```

---

## 2. Android Studio

### Download Android Studio

- **Official Site**: https://developer.android.com/studio
- **Direct Download**: https://redirector.gvt1.com/edgedl/android/studio/install/2023.3.1.18/android-studio-2023.3.1.18-windows.exe
- File size: ~1 GB
- Choose: **Windows (64-bit)** installer

### Installation Steps

1. **Run the installer** (`android-studio-*.exe`)
2. **Choose components**:
   - ✅ Android Studio
   - ✅ Android SDK
   - ✅ Android SDK Platform
   - ✅ Android Virtual Device (optional, for emulator)
3. **Installation location**: Default is fine (`C:\Program Files\Android\Android Studio`)
4. **SDK location**: Default is fine (`C:\Users\YourName\AppData\Local\Android\Sdk`)
5. Click **Next** → **Install** → **Finish**

### First Launch Setup

1. Launch Android Studio
2. Choose **Standard** installation
3. Let it download SDK components (this takes a while)
4. Wait for setup to complete

---

## 3. Set ANDROID_HOME Environment Variable

### Find Your Android SDK Path

Default locations:
- **Windows**: `C:\Users\YourName\AppData\Local\Android\Sdk`
- Or check in Android Studio: **Tools** → **SDK Manager** → **Android SDK Location**

### Set Environment Variable

**Method 1: Via System Properties (Recommended)**

1. Press `Win + X` → **System** → **Advanced system settings**
2. Click **Environment Variables**
3. Under **User variables** (or **System variables**), click **New**
4. Variable name: `ANDROID_HOME`
5. Variable value: `C:\Users\YourName\AppData\Local\Android\Sdk` (your SDK path)
6. Click **OK**

**Method 2: Via PowerShell (Temporary - Current Session Only)**
```powershell
$env:ANDROID_HOME = "C:\Users\YourName\AppData\Local\Android\Sdk"
```

**Method 3: Via Command Prompt (Permanent)**
```cmd
setx ANDROID_HOME "C:\Users\YourName\AppData\Local\Android\Sdk"
```
(Requires restarting terminal)

### Add to PATH (Optional but Recommended)

Add these to your PATH variable:
- `%ANDROID_HOME%\platform-tools`
- `%ANDROID_HOME%\tools`
- `%ANDROID_HOME%\tools\bin`

1. In **Environment Variables**, find **Path** variable
2. Click **Edit**
3. Click **New** and add: `%ANDROID_HOME%\platform-tools`
4. Click **New** and add: `%ANDROID_HOME%\tools`
5. Click **OK** on all dialogs

### Verify ANDROID_HOME
```powershell
echo $env:ANDROID_HOME
```

Or restart PowerShell and check:
```powershell
$env:ANDROID_HOME
```

---

## 4. Install Required Android SDK Components

### Via Android Studio

1. Open Android Studio
2. Go to **Tools** → **SDK Manager**
3. In **SDK Platforms** tab, check:
   - ✅ **Android 13.0 (Tiramisu)** - API Level 33
   - ✅ **Android 12.0 (S)** - API Level 31
4. In **SDK Tools** tab, check:
   - ✅ **Android SDK Build-Tools**
   - ✅ **Android SDK Platform-Tools**
   - ✅ **Android SDK Command-line Tools**
5. Click **Apply** → **OK**
6. Wait for download and installation

### Via Command Line (Alternative)

```bash
sdkmanager "platform-tools" "platforms;android-33" "build-tools;33.0.0"
```

---

## 5. Verify Everything is Set Up

Run these commands in PowerShell:

```powershell
# Check Java
java -version
javac -version

# Check Android SDK
echo $env:ANDROID_HOME
adb version

# Check Gradle (will be installed with Android Studio)
gradle -version
```

All should return version information without errors.

---

## Quick Setup Script

I'll create a script to check your setup:

```powershell
# Check Requirements
Write-Host "Checking requirements..." -ForegroundColor Cyan

# Java
if (Get-Command java -ErrorAction SilentlyContinue) {
    Write-Host "✅ Java installed" -ForegroundColor Green
    java -version
} else {
    Write-Host "❌ Java not found" -ForegroundColor Red
}

# Android SDK
if ($env:ANDROID_HOME) {
    Write-Host "✅ ANDROID_HOME set: $env:ANDROID_HOME" -ForegroundColor Green
    if (Test-Path "$env:ANDROID_HOME\platform-tools\adb.exe") {
        Write-Host "✅ Android SDK found" -ForegroundColor Green
    } else {
        Write-Host "⚠️  Android SDK path exists but tools not found" -ForegroundColor Yellow
    }
} else {
    Write-Host "❌ ANDROID_HOME not set" -ForegroundColor Red
}
```

---

## Download Links Summary

| Software | Download Link | Size |
|----------|---------------|------|
| **Java JDK 17** | https://www.oracle.com/java/technologies/downloads/#java17 | ~150 MB |
| **Java JDK 21** | https://www.oracle.com/java/technologies/downloads/#java21 | ~150 MB |
| **OpenJDK 17** | https://adoptium.net/temurin/releases/?version=17 | ~150 MB |
| **Android Studio** | https://developer.android.com/studio | ~1 GB |

---

## Troubleshooting

### "java: command not found"
→ Java not in PATH. Add `%JAVA_HOME%\bin` to PATH or reinstall Java.

### "ANDROID_HOME not set"
→ Set the environment variable (see step 3 above). Restart terminal after setting.

### "sdkmanager: command not found"
→ Install Android SDK Command-line Tools via Android Studio SDK Manager.

### "Gradle build failed"
→ Make sure Android SDK Platform 33 is installed.

---

## Next Steps

Once everything is installed:

1. **Restart your terminal/PowerShell**
2. **Verify setup**: Run the check script above
3. **Build APK**: Run `.\scripts\build-local.bat`

---

**Estimated Total Download Size**: ~1.5 GB
**Estimated Setup Time**: 30-60 minutes (mostly waiting for downloads)
