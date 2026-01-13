# 🚀 Build APK Now - Quick Guide

Follow these steps to build an APK you can install on your phone:

## Step 1: Create Placeholder Assets

You need image files before building. Create these quickly:

**Option A: Use the script (if you have ImageMagick)**
```bash
bash scripts/create-placeholder-assets.sh
```

**Option B: Create manually**
Create these files in the `assets/` folder:
- `icon.png` - 1024x1024px (any image, even a colored square)
- `splash.png` - 1242x2436px (any image)
- `adaptive-icon.png` - 1024x1024px (any image)
- `favicon.png` - 48x48px (optional)

You can use any image editor or even online tools to create simple colored squares.

## Step 2: Install EAS CLI

```bash
npm install -g eas-cli
```

## Step 3: Login to Expo

```bash
eas login
```

If you don't have an account, go to https://expo.dev and create one (it's free).

## Step 4: Build the APK

```bash
npm run build:android
```

This will:
1. Start a cloud build (takes 5-10 minutes)
2. Show you a URL to track progress
3. Give you a download link when done

## Step 5: Install on Your Phone

1. Download the APK file to your phone
2. Go to Settings > Security > Enable "Install Unknown Apps" (or "Unknown Sources")
3. Tap the APK file to install
4. Open "Hold On" and play!

## Troubleshooting

**"eas: command not found"**
→ Run: `npm install -g eas-cli`

**"No credentials found"**
→ Run: `eas build:configure` then try again

**Build fails - missing assets**
→ Make sure you created the asset files in Step 1

**Can't install APK**
→ Enable "Unknown Sources" in Android Security settings

## That's It!

Once the build completes, you'll have an APK file you can install directly on your Android phone. No Play Store needed for testing!
