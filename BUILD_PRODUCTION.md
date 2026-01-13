# 🚀 Building Production APK/AAB

## Quick Start

### Step 1: Login to Expo
```bash
eas login
```
Create a free account at https://expo.dev if needed.

### Step 2: Build Production APK
For direct installation (APK):
```bash
npm run build:android:production
```

### Step 3: Build Production AAB (for Play Store)
For Google Play Store submission (AAB):
```bash
npm run build:android:production:aab
```

## What's the Difference?

- **APK**: Can be installed directly on Android devices. Good for testing and distribution outside Play Store.
- **AAB (Android App Bundle)**: Required format for Google Play Store. Smaller download size, optimized by Google.

## Build Options

### Production APK (Direct Installation)
```bash
npm run build:android:production
```
- Builds APK file
- Can install directly on phone
- Good for testing and side-loading

### Production AAB (Play Store)
```bash
npm run build:android:production:aab
```
- Builds Android App Bundle
- Required for Play Store submission
- Optimized by Google Play

## After Build Completes

1. **Track Progress**: You'll get a URL to monitor the build (takes 10-15 minutes)
2. **Download**: When complete, download the APK/AAB from the provided link
3. **Install APK**: 
   - Transfer to phone
   - Enable "Install Unknown Apps" in Android settings
   - Tap to install
4. **Submit AAB**: Upload to Google Play Console for app submission

## Build Time

- **First build**: 10-15 minutes (sets up build environment)
- **Subsequent builds**: 5-10 minutes

## Troubleshooting

**"Not logged in"**
→ Run `eas login` first

**Build fails**
→ Check the error message in the build URL
→ Ensure all assets are present (they should be in the repo)
→ Verify `app.json` configuration

**Need to change build type**
→ Edit `eas.json` and change `buildType` in production profile

## Next Steps After Build

1. **Test the APK** on your device
2. **For Play Store**: Upload the AAB to Google Play Console
3. **Update version** in `app.json` for future releases

---

**Ready to build?** Run `eas login` then `npm run build:android:production`!
