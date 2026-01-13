# Hold On

A minimalist mobile game for Android where you test how long you can keep your finger pressed on a single button.

## 🎮 Overview

"Hold On" is an ultra-simple game with one rule: **keep your finger pressed on the button**. The app tracks how many milliseconds you can maintain contact. Lift your finger, and you lose. No high scores, no leaderboard—just pure, meditative focus.

## ✨ Features

- 🎯 Single button interface
- ⏱️ Real-time millisecond tracking (60fps updates)
- 💫 Smooth animations and transitions
- 📳 Haptic feedback on press/release
- 🎨 Minimalist, clean design
- 🚫 No distractions (no scores, no leaderboards)
- ⚡ Optimized performance
- 📱 Works on all Android devices

## 📁 Project Structure

```
/
├── README.md                 # This file
├── package.json              # Dependencies and scripts
├── app.json                  # Expo configuration
├── eas.json                  # EAS build configuration
├── babel.config.js           # Babel configuration
│
├── /boot                     # Entry point and configs
│   ├── main.sh               # Bootstrap script
│   └── services.yaml        # Service definitions
│
├── /systems                  # App code
│   └── frontend/            # React Native app
│       ├── App.js            # Main app component (with animations & haptics)
│       └── README.md         # Frontend documentation
│
├── /docs                     # Documentation
│   ├── PLANNING.md          # Development roadmap
│   ├── ARCHITECTURE.md      # Technical architecture
│   ├── BUILD_APK.md        # Cloud build guide
│   ├── DEPLOYMENT.md        # Play Store deployment
│   └── QUICK_START.md       # Quick start guide
│
├── /scripts                   # Build & utility scripts
│   ├── build-local.bat       # Local build (Windows)
│   ├── build-local.sh        # Local build (Mac/Linux)
│   ├── build-apk.sh          # Interactive build script
│   ├── create-assets.js      # Generate placeholder assets
│   └── check-requirements.ps1 # Verify setup
│
├── /assets                    # App assets
│   ├── icon.png              # App icon (1024x1024)
│   ├── splash.png            # Splash screen
│   ├── adaptive-icon.png     # Android adaptive icon
│   └── favicon.png           # Web favicon
│
├── /configs                   # Environment configs
│   └── dev.env               # Development environment
│
└── Build guides:
    ├── BUILD_LOCAL.md         # Local build instructions
    ├── BUILD_PRODUCTION.md    # Production build guide
    ├── SETUP_REQUIREMENTS.md  # Setup requirements
    └── SETUP_CREDENTIALS.md   # Credentials setup
```

## 🚀 Quick Start

### For Development

**Prerequisites:**
- Node.js (v16 or higher)
- npm or yarn

**Setup:**
```bash
# 1. Install dependencies
npm install

# 2. Start development server
npm start

# 3. Run on Android device/emulator
npm run android
```

**Testing:**
- Install Expo Go app on your Android device
- Scan the QR code from the terminal
- Or use Android emulator

### For Building APK

Choose your preferred build method:

**🌐 Cloud Build (Easiest)**
- Requires: Expo account (free)
- Setup: `npm install -g eas-cli` → `eas login`
- Build: `npm run build:android`
- See: [docs/BUILD_APK.md](docs/BUILD_APK.md)

**🔨 Local Build (No account needed)**
- Requires: Android Studio, Java JDK, Android SDK
- Setup: See [SETUP_REQUIREMENTS.md](SETUP_REQUIREMENTS.md)
- Build: `.\scripts\build-local.bat` (Windows) or `bash scripts/build-local.sh` (Mac/Linux)
- See: [BUILD_LOCAL.md](BUILD_LOCAL.md)

## 📦 Building APK

### Quick Reference

| Method | Account Needed? | Setup Required | Build Time |
|--------|----------------|----------------|------------|
| **Cloud Build** | ✅ Yes (free) | Minimal | 5-10 min |
| **Local Build** | ❌ No | Android SDK | 10-15 min |

### Cloud Build (Recommended for First Time)

**Steps:**
1. Install EAS CLI: `npm install -g eas-cli`
2. Login: `eas login` (create free account at https://expo.dev)
3. Build: `npm run build:android`
4. Download APK from provided URL
5. Install on phone (enable "Unknown Sources" in Android settings)

**Production builds:**
- APK: `npm run build:android:production`
- AAB (Play Store): `npm run build:android:production:aab`

📖 **Full guide:** [docs/BUILD_APK.md](docs/BUILD_APK.md) | [BUILD_PRODUCTION.md](BUILD_PRODUCTION.md)

### Local Build (No Account Required)

**Prerequisites:**
- Java JDK 11+ ([Download](https://www.oracle.com/java/technologies/downloads/))
- Android Studio ([Download](https://developer.android.com/studio))
- `ANDROID_HOME` environment variable set

**Quick Setup:**
1. Check requirements: `.\scripts\check-requirements.ps1`
2. Install missing components (see [SETUP_REQUIREMENTS.md](SETUP_REQUIREMENTS.md))
3. Build: `.\scripts\build-local.bat` (Windows) or `bash scripts/build-local.sh` (Mac/Linux)
4. Find APK: `android/app/build/outputs/apk/release/app-release.apk`

📖 **Full guide:** [BUILD_LOCAL.md](BUILD_LOCAL.md) | [SETUP_REQUIREMENTS.md](SETUP_REQUIREMENTS.md)

### Helper Scripts

- `build-apk.bat` - Interactive build script (Windows)
- `build-production.bat` - Production build script (Windows)
- `scripts/check-requirements.ps1` - Verify your setup

## 🛠️ Development

### Tech Stack

- **React Native** (0.72.6) - Mobile framework
- **Expo SDK** (~49.0.0) - Development platform and tooling
- **Expo Haptics** - Haptic feedback
- **React Native Animated** - Smooth 60fps animations
- **React Hooks** - State management

### Key Features Implementation

- **Timer**: Uses `requestAnimationFrame` for smooth 60fps updates
- **Animations**: Native driver animations for optimal performance
- **Touch Handling**: Robust press/cancel handlers for edge cases
- **Haptics**: Platform-aware haptic feedback

### Available Scripts

```bash
npm start              # Start Expo dev server
npm run android        # Run on Android device/emulator
npm run build:android  # Build APK (cloud)
npm run build:android:production  # Production APK
npm run build:android:native      # Local build with prebuild
```

### Regenerating Assets

If you need to regenerate placeholder assets:
```bash
node scripts/create-assets.js
```

## 📚 Documentation

- **[PLANNING.md](docs/PLANNING.md)** - Development roadmap and phases
- **[ARCHITECTURE.md](docs/ARCHITECTURE.md)** - Technical architecture
- **[BUILD_LOCAL.md](BUILD_LOCAL.md)** - Local build guide
- **[SETUP_REQUIREMENTS.md](SETUP_REQUIREMENTS.md)** - Setup requirements
- **[DEPLOYMENT.md](docs/DEPLOYMENT.md)** - Play Store deployment

## 🤝 Contributing

This is a personal project, but feel free to fork and modify for your own use!

## 📄 License

MIT License - Feel free to use this project for learning or as a starting point.

---

**Made with ❤️ using React Native and Expo**
