# Hold On - Quick Start Guide

## Getting Started in 3 Steps

### 1. Install Dependencies

```bash
npm install
```

Or use the bootstrap script:
```bash
bash boot/main.sh
```

### 2. Start Development Server

```bash
npm start
```

This will start the Expo development server. You'll see a QR code in the terminal.

### 3. Run on Device

**Option A: Using Expo Go App**
1. Install "Expo Go" from Google Play Store
2. Scan the QR code with the Expo Go app
3. The app will load on your device

**Option B: Android Emulator**
```bash
npm run android
```

Make sure you have:
- Android Studio installed
- An Android emulator running
- Or a physical device connected via USB with USB debugging enabled

## Testing the App

1. The app opens with a green button
2. Press and hold the button
3. Watch the millisecond counter increase
4. Release your finger to end the game
5. Tap the button again to restart

## Building for Production

### Using EAS Build (Recommended)

```bash
# Install EAS CLI
npm install -g eas-cli

# Login
eas login

# Configure build
eas build:configure

# Build for Android
eas build --platform android
```

### Local Build

```bash
expo build:android
```

## Troubleshooting

### "expo: command not found"
```bash
npm install -g expo-cli
```

### Android emulator not starting
- Open Android Studio
- Go to AVD Manager
- Create/start an emulator

### App not loading on device
- Make sure device and computer are on same WiFi network
- Check firewall settings
- Try using tunnel mode: `expo start --tunnel`

## Next Steps

- Read [DEPLOYMENT.md](./DEPLOYMENT.md) for Play Store submission
- Check [ARCHITECTURE.md](./ARCHITECTURE.md) for technical details
- Review [PLANNING.md](./PLANNING.md) for development roadmap
