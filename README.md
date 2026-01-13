# Hold On

A minimalist mobile game for Android where you test how long you can keep your finger pressed on a single button.

## Overview

"Hold On" is an ultra-simple game with one rule: keep your finger pressed on the button. The app tracks how many milliseconds you can maintain contact. Lift your finger, and you lose. No high scores, no leaderboard—just pure, meditative focus.

## Features

- Single button interface
- Real-time millisecond tracking
- Instant feedback on release
- Minimalist design
- No distractions (no scores, no leaderboards)

## Project Structure

```
/
├── README.md                 # This file
├── package.json              # Dependencies and scripts
├── app.json                  # Expo configuration
├── .gitignore               # Git ignore rules
│
├── /boot                    # Entry point and configs
│   ├── main.sh              # Bootstrap script
│   └── services.yaml        # Service definitions
│
├── /systems                 # App code
│   └── frontend/            # React Native app
│       ├── App.js           # Main app component
│       └── components/      # UI components
│
├── /docs                    # Documentation
│   ├── PLANNING.md          # Development roadmap
│   └── ARCHITECTURE.md      # Technical architecture
│
└── /configs                 # Environment configs
    └── dev.env              # Development environment
```

## Getting Started

### Prerequisites

- Node.js (v16 or higher)
- npm or yarn
- Expo CLI (`npm install -g expo-cli`)
- Android Studio (for Android development)
- Expo Go app (for testing on device)

### Installation

1. Install dependencies:
```bash
npm install
```

2. Start the development server:
```bash
npm start
```

3. Run on Android device/emulator:
```bash
npm run android
```

### Building APK for Your Phone

**Quick Build (Cloud - Recommended):**

1. Install EAS CLI: `npm install -g eas-cli`
2. Login: `eas login` (create free account at https://expo.dev)
3. Build APK: `npm run build:android`
4. Download the APK from the provided URL
5. Install on your phone (enable "Unknown Sources" in Android settings)

**See [docs/BUILD_APK.md](docs/BUILD_APK.md) for detailed instructions.**

**Note:** You'll need placeholder assets first. Run:
```bash
bash scripts/create-placeholder-assets.sh
```
Or manually create the required image files (see `assets/README.md`).

## Development

The app is built with:
- **React Native** - Mobile framework
- **Expo** - Development platform and tooling
- **React Native Gesture Handler** - For touch tracking

## License

MIT
