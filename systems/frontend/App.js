import React, { useState, useRef, useEffect, useCallback } from 'react';
import {
  StyleSheet,
  View,
  Text,
  Pressable,
  StatusBar,
  Animated,
  Platform,
} from 'react-native';
import * as Haptics from 'expo-haptics';

export default function App() {
  const [isPressed, setIsPressed] = useState(false);
  const [elapsedTime, setElapsedTime] = useState(0);
  const [gameOver, setGameOver] = useState(false);
  const startTimeRef = useRef(null);
  const animationFrameRef = useRef(null);
  
  // Animation values
  const buttonScale = useRef(new Animated.Value(1)).current;
  const buttonOpacity = useRef(new Animated.Value(1)).current;
  const timerOpacity = useRef(new Animated.Value(1)).current;
  const gameOverOpacity = useRef(new Animated.Value(0)).current;
  
  // Performance: Use ref for timer to avoid unnecessary re-renders
  const lastUpdateTime = useRef(0);
  const UPDATE_INTERVAL = 16; // ~60fps

  // Optimized timer with throttled updates
  useEffect(() => {
    if (isPressed && !gameOver) {
      const updateTimer = () => {
        if (startTimeRef.current) {
          const now = Date.now();
          const elapsed = now - startTimeRef.current;
          
          // Throttle updates for better performance
          if (now - lastUpdateTime.current >= UPDATE_INTERVAL) {
            setElapsedTime(elapsed);
            lastUpdateTime.current = now;
          }
          
          animationFrameRef.current = requestAnimationFrame(updateTimer);
        }
      };
      animationFrameRef.current = requestAnimationFrame(updateTimer);
    } else {
      if (animationFrameRef.current) {
        cancelAnimationFrame(animationFrameRef.current);
        animationFrameRef.current = null;
      }
    }

    return () => {
      if (animationFrameRef.current) {
        cancelAnimationFrame(animationFrameRef.current);
      }
    };
  }, [isPressed, gameOver]);

  // Animate button press
  const animatePressIn = useCallback(() => {
    Animated.parallel([
      Animated.spring(buttonScale, {
        toValue: 0.92,
        useNativeDriver: true,
        tension: 300,
        friction: 10,
      }),
      Animated.timing(buttonOpacity, {
        toValue: 0.9,
        duration: 150,
        useNativeDriver: true,
      }),
    ]).start();
  }, [buttonScale, buttonOpacity]);

  // Animate button release
  const animatePressOut = useCallback((isGameOver) => {
    Animated.parallel([
      Animated.spring(buttonScale, {
        toValue: isGameOver ? 1.05 : 1,
        useNativeDriver: true,
        tension: 300,
        friction: 10,
      }),
      Animated.timing(buttonOpacity, {
        toValue: 1,
        duration: 200,
        useNativeDriver: true,
      }),
    ]).start();
  }, [buttonScale, buttonOpacity]);

  // Animate game over
  const animateGameOver = useCallback(() => {
    Animated.parallel([
      Animated.timing(gameOverOpacity, {
        toValue: 1,
        duration: 300,
        useNativeDriver: true,
      }),
      Animated.timing(timerOpacity, {
        toValue: 0.7,
        duration: 300,
        useNativeDriver: true,
      }),
    ]).start();
  }, [gameOverOpacity, timerOpacity]);

  // Reset animations
  const resetAnimations = useCallback(() => {
    buttonScale.setValue(1);
    buttonOpacity.setValue(1);
    timerOpacity.setValue(1);
    gameOverOpacity.setValue(0);
  }, [buttonScale, buttonOpacity, timerOpacity, gameOverOpacity]);

  const handlePressIn = useCallback(() => {
    if (gameOver) {
      // Reset game with animations
      resetAnimations();
      setGameOver(false);
      setElapsedTime(0);
      lastUpdateTime.current = 0;
    }
    
    startTimeRef.current = Date.now();
    setIsPressed(true);
    animatePressIn();
    
    // Haptic feedback on press
    if (Platform.OS !== 'web') {
      Haptics.impactAsync(Haptics.ImpactFeedbackStyle.Light);
    }
  }, [gameOver, resetAnimations, animatePressIn]);

  const handlePressOut = useCallback(() => {
    if (isPressed && !gameOver) {
      setIsPressed(false);
      setGameOver(true);
      
      // Animate game over
      animatePressOut(true);
      animateGameOver();
      
      // Haptic feedback on release
      if (Platform.OS !== 'web') {
        Haptics.impactAsync(Haptics.ImpactFeedbackStyle.Medium);
      }
      
      if (animationFrameRef.current) {
        cancelAnimationFrame(animationFrameRef.current);
      }
    }
  }, [isPressed, gameOver, animatePressOut, animateGameOver]);
  
  // Handle touch cancellation (e.g., phone call, notification)
  const handlePressCancel = useCallback(() => {
    if (isPressed && !gameOver) {
      handlePressOut();
    }
  }, [isPressed, gameOver, handlePressOut]);

  // Memoize format function for performance
  const formatTime = useCallback((ms) => {
    return ms.toLocaleString('en-US', {
      minimumFractionDigits: 0,
      maximumFractionDigits: 0,
    });
  }, []);

  return (
    <View style={styles.container}>
      <StatusBar barStyle="dark-content" />
      
      <View style={styles.content}>
        <Text style={styles.title}>Hold On</Text>
        
        <Animated.View 
          style={[
            styles.timerContainer,
            { opacity: timerOpacity }
          ]}
        >
          <Text style={styles.timerText}>
            {formatTime(elapsedTime)}
          </Text>
          <Text style={styles.timerLabel}>milliseconds</Text>
        </Animated.View>

        <Animated.View
          style={{
            transform: [{ scale: buttonScale }],
            opacity: buttonOpacity,
          }}
        >
          <Pressable
            style={[
              styles.button,
              gameOver && styles.buttonGameOver,
            ]}
            onPressIn={handlePressIn}
            onPressOut={handlePressOut}
            onPressCancel={handlePressCancel}
            android_ripple={{ color: 'rgba(255, 255, 255, 0.2)' }}
            delayLongPress={0}
          >
            <Text style={styles.buttonText}>
              {gameOver ? 'Tap to Try Again' : isPressed ? 'Keep Holding...' : 'Press and Hold'}
            </Text>
          </Pressable>
        </Animated.View>

        <Animated.View
          style={[
            styles.gameOverContainer,
            { opacity: gameOverOpacity }
          ]}
        >
          <Text style={styles.gameOverText}>
            You held for {formatTime(elapsedTime)} ms
          </Text>
        </Animated.View>
      </View>
    </View>
  );
}

const styles = StyleSheet.create({
  container: {
    flex: 1,
    backgroundColor: '#f5f5f5',
    alignItems: 'center',
    justifyContent: 'center',
  },
  content: {
    alignItems: 'center',
    justifyContent: 'center',
    width: '100%',
    padding: 20,
  },
  title: {
    fontSize: 48,
    fontWeight: 'bold',
    color: '#333',
    marginBottom: 60,
    letterSpacing: 2,
  },
  timerContainer: {
    alignItems: 'center',
    marginBottom: 80,
  },
  timerText: {
    fontSize: 64,
    fontWeight: '300',
    color: '#333',
    fontVariant: ['tabular-nums'],
  },
  timerLabel: {
    fontSize: 18,
    color: '#666',
    marginTop: 8,
    fontWeight: '500',
  },
  button: {
    width: 280,
    height: 280,
    borderRadius: 140,
    backgroundColor: '#4CAF50',
    alignItems: 'center',
    justifyContent: 'center',
    elevation: 8,
    shadowColor: '#000',
    shadowOffset: { width: 0, height: 4 },
    shadowOpacity: 0.3,
    shadowRadius: 8,
  },
  buttonGameOver: {
    backgroundColor: '#f44336',
  },
  buttonText: {
    color: '#fff',
    fontSize: 20,
    fontWeight: '600',
    textAlign: 'center',
    paddingHorizontal: 20,
  },
  gameOverContainer: {
    marginTop: 40,
    alignItems: 'center',
  },
  gameOverText: {
    fontSize: 18,
    color: '#666',
    fontWeight: '500',
  },
});
