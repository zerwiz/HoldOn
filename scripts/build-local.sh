#!/bin/bash

# Build APK locally without Expo cloud service
# This uses expo prebuild + Gradle

echo "🔨 Hold On - Local APK Builder"
echo "==============================="
echo ""

# Check prerequisites
if ! command -v java &> /dev/null; then
    echo "❌ Java JDK not found. Please install Java JDK 11 or higher."
    exit 1
fi

if [ -z "$ANDROID_HOME" ] && [ -z "$ANDROID_SDK_ROOT" ]; then
    echo "❌ ANDROID_HOME not set. Please set it to your Android SDK path."
    echo "   Example: export ANDROID_HOME=$HOME/Android/Sdk"
    exit 1
fi

echo "✅ Prerequisites check passed"
echo ""

# Step 1: Prebuild (generate native Android code)
echo "📦 Step 1: Generating native Android project..."
if [ ! -d "android" ]; then
    npx expo prebuild --platform android --clean
    if [ $? -ne 0 ]; then
        echo "❌ Prebuild failed"
        exit 1
    fi
    echo "✅ Android project generated"
else
    echo "⚠️  Android folder exists. Skipping prebuild."
    echo "   Run 'rm -rf android' first if you want to regenerate."
fi

echo ""

# Step 2: Build with Gradle
echo "🔨 Step 2: Building APK with Gradle..."
cd android

if [ -f "gradlew" ]; then
    ./gradlew assembleRelease
else
    echo "❌ Gradle wrapper not found"
    exit 1
fi

if [ $? -eq 0 ]; then
    echo ""
    echo "✅ Build successful!"
    echo ""
    echo "📱 Your APK is located at:"
    echo "   android/app/build/outputs/apk/release/app-release.apk"
    echo ""
    echo "⚠️  Note: This APK is unsigned. For production, you need to sign it."
    echo "   See BUILD_LOCAL.md for signing instructions."
else
    echo "❌ Build failed"
    exit 1
fi

cd ..
