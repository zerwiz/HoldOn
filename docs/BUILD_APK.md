# Building APK for Hold On

This guide will help you build an APK file that you can install directly on your Android phone.

## Quick Method: EAS Build (Cloud) - Recommended

This is the easiest method. It builds the APK in the cloud and you just download it.

### Step 1: Install EAS CLI

```bash
npm install -g eas-cli
```

### Step 2: Login to Expo

```bash
eas login
```

If you don't have an account, create one at https://expo.dev (it's free).

### Step 3: Configure Build

```bash
eas build:configure
```

This will create/update the `eas.json` file (already done for you).

### Step 4: Build APK

```bash
npm run build:android
```

Or directly:
```bash
eas build --platform android --profile preview
```

### Step 5: Download and Install

1. Wait for the build to complete (usually 5-10 minutes)
2. You'll get a URL to download the APK
3. Download the APK to your phone
4. Enable "Install from Unknown Sources" in Android settings
5. Tap the APK file to install

## Alternative: Local Build

If you have Android SDK installed and want to build locally:

```bash
npm run build:android:local
```

Or:
```bash
eas build --platform android --profile preview --local
```

**Requirements for local build:**
- Android SDK installed
- Java JDK installed
- Environment variables set (ANDROID_HOME, etc.)

## Using the Build Script

We've included a helper script:

```bash
bash scripts/build-apk.sh
```

This will guide you through the build process.

## Troubleshooting

### "eas: command not found"
```bash
npm install -g eas-cli
```

### "No credentials found"
Run `eas build:configure` first, or login with `eas login`

### Build fails due to missing assets
You need to create placeholder assets:
- `assets/icon.png` (1024x1024px)
- `assets/splash.png` (1242x2436px)
- `assets/adaptive-icon.png` (1024x1024px)

For quick testing, you can use any PNG images with the correct dimensions.

### Can't install APK on phone
1. Go to Settings > Security
2. Enable "Unknown Sources" or "Install Unknown Apps"
3. Try installing again

## Quick Test Assets

If you just want to test quickly, create simple placeholder images:

```bash
# Using ImageMagick (if installed)
convert -size 1024x1024 xc:#4CAF50 assets/icon.png
convert -size 1242x2436 xc:#ffffff assets/splash.png
convert -size 1024x1024 xc:#4CAF50 assets/adaptive-icon.png
```

Or use any image editor to create simple colored squares with the required dimensions.

## What You'll Get

After building, you'll get an APK file (e.g., `hold-on-1.0.0.apk`) that you can:
- Transfer to your phone via USB, email, or cloud storage
- Install directly by tapping the file
- Share with others for testing

## Next Steps

Once you have a working APK:
1. Test on your phone
2. Make any adjustments needed
3. When ready for Play Store, build with production profile:
   ```bash
   eas build --platform android --profile production
   ```
