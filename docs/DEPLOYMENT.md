# Hold On - Deployment Guide

## Google Play Store Deployment

### Prerequisites

1. **Google Play Console Account**
   - Create a developer account at https://play.google.com/console
   - Pay one-time $25 registration fee

2. **EAS Build Setup** (Recommended)
   ```bash
   npm install -g eas-cli
   eas login
   eas build:configure
   ```

3. **App Assets Required**
   - App icon (1024x1024px PNG)
   - Feature graphic (1024x500px PNG)
   - Screenshots (at least 2, various sizes)
   - Privacy policy URL (if required)

### Step 1: Prepare App Assets

Create the following assets in the `assets/` directory:

- `icon.png` - 1024x1024px app icon
- `splash.png` - 1242x2436px splash screen
- `adaptive-icon.png` - 1024x1024px Android adaptive icon

### Step 2: Configure app.json

Update `app.json` with:
- App name
- Package name (com.yourcompany.holdon)
- Version number
- App icon paths

### Step 3: Build Production APK/AAB

**Option A: Using EAS Build (Recommended)**
```bash
eas build --platform android --profile production
```

**Option B: Local Build**
```bash
expo build:android
```

### Step 4: Generate Keystore (First Time Only)

```bash
keytool -genkeypair -v -storetype PKCS12 -keystore hold-on-key.keystore -alias hold-on-key -keyalg RSA -keysize 2048 -validity 10000
```

### Step 5: Submit to Play Store

1. Go to Google Play Console
2. Create new app
3. Fill in store listing:
   - App name: "Hold On"
   - Short description: "A minimalist game. Hold the button as long as you can."
   - Full description: [Write compelling description]
   - Screenshots: Upload app screenshots
   - Feature graphic: Upload banner image
4. Upload APK/AAB from build step
5. Complete content rating questionnaire
6. Set pricing (Free)
7. Submit for review

### Step 6: Testing

Before submitting:
- Test on multiple Android devices
- Test different screen sizes
- Verify touch responsiveness
- Check performance

## Version Management

Update version in:
- `app.json` - `version` field
- `package.json` - `version` field

Follow semantic versioning: `MAJOR.MINOR.PATCH`

## Release Checklist

- [ ] Update version numbers
- [ ] Test on multiple devices
- [ ] Create/update screenshots
- [ ] Write release notes
- [ ] Build production APK/AAB
- [ ] Test production build
- [ ] Submit to Play Store
- [ ] Monitor for crashes/errors
