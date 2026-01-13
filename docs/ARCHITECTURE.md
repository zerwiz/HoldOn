# Hold On - Architecture

## System Architecture

### High-Level Overview

```
┌─────────────────────────────────────┐
│         React Native App            │
│  (Expo Managed Workflow)            │
├─────────────────────────────────────┤
│                                     │
│  ┌───────────────────────────────┐ │
│  │      App Component            │ │
│  │  (App.js)                     │ │
│  └──────────────┬────────────────┘ │
│                 │                   │
│  ┌──────────────▼────────────────┐ │
│  │    HoldButton Component       │ │
│  │  - Touch handlers             │ │
│  │  - Timer logic                │ │
│  │  - State management           │ │
│  └───────────────────────────────┘ │
│                                     │
└─────────────────────────────────────┘
```

## Component Architecture

### App.js
- Root component
- Handles app-level state
- Renders main game component

### HoldButton Component
- **Props**: None (self-contained)
- **State**:
  - `isPressed`: Boolean
  - `startTime`: Number (timestamp)
  - `elapsedTime`: Number (milliseconds)
  - `gameOver`: Boolean
- **Methods**:
  - `handlePressIn()`: Start timer
  - `handlePressOut()`: Stop timer, end game
  - `updateTimer()`: Update elapsed time display

## Data Flow

```
User Touch
    │
    ├─► onPressIn
    │   └─► setStartTime(now)
    │   └─► setIsPressed(true)
    │   └─► startTimer()
    │
    ├─► Timer Loop (requestAnimationFrame)
    │   └─► calculate elapsedTime
    │   └─► update display
    │
    └─► onPressOut
        └─► setIsPressed(false)
        └─► stopTimer()
        └─► setGameOver(true)
        └─► show final time
```

## Technology Choices

### React Native + Expo
- **Why**: Fast development, easy deployment, cross-platform potential
- **Benefits**: Hot reload, managed workflow, built-in tooling

### Touch Handling
- **Method**: React Native's `Pressable` component
- **Why**: Native performance, reliable touch detection
- **Alternatives Considered**: `TouchableOpacity` (less flexible), `react-native-gesture-handler` (overkill)

### Timer Implementation
- **Method**: `requestAnimationFrame` or `setInterval`
- **Why**: Smooth updates, accurate timing
- **Frequency**: ~60fps (16ms intervals) for smooth display

## Performance Considerations

1. **Timer Optimization**: Use `requestAnimationFrame` for smooth 60fps updates
2. **State Updates**: Minimize re-renders by batching updates
3. **Memory**: No persistent storage needed (no scores)
4. **Battery**: Minimal CPU usage, only active during gameplay

## Platform-Specific Notes

### Android
- Target SDK: 33+ (latest)
- Min SDK: 21 (Android 5.0+)
- Permissions: None required
- Build: APK or AAB for Play Store

## Security & Privacy

- No data collection
- No network requests
- No user tracking
- No permissions required
- Fully offline capable

## Scalability

Current design is intentionally minimal. If expansion needed:
- Could add multiple game modes
- Could add settings screen
- Could add simple animations
- Architecture supports easy extension
