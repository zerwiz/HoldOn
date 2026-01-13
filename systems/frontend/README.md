# Hold On - Frontend

## Overview

The frontend is a React Native application built with Expo, providing a minimalist single-button game experience.

## Structure

```
frontend/
├── App.js              # Main application component
└── components/         # Reusable UI components (if needed)
```

## Main Component: App.js

The `App.js` file contains the entire game logic:

- **Touch Detection**: Uses React Native's `Pressable` component
- **Timer Logic**: Uses `requestAnimationFrame` for smooth 60fps updates
- **State Management**: React hooks (`useState`, `useRef`, `useEffect`)

### Key Features

1. **Real-time Timer**: Updates every frame (~16ms) for smooth display
2. **Touch Handling**: Detects press start and release accurately
3. **Game Reset**: Tap button after game over to restart
4. **Visual Feedback**: Button changes color and scale when pressed

## Dependencies

- `expo`: Development platform
- `react`: UI library
- `react-native`: Mobile framework

## Running the App

```bash
# Start Expo development server
npm start

# Run on Android device/emulator
npm run android

# Run on iOS device/simulator (if configured)
npm run ios
```

## Development Notes

- The app uses `requestAnimationFrame` for optimal performance
- Timer precision is millisecond-level using `Date.now()`
- No external state management needed (simple local state)
- Fully self-contained component (no props or context)

## Future Enhancements

- Haptic feedback on press/release
- Smooth animations
- Different button sizes/difficulties
- Sound effects (optional)
