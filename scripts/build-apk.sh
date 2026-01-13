#!/bin/bash

# Build APK for Hold On app
# This script helps you build an APK file you can install on your phone

echo "📱 Hold On - APK Builder"
echo "========================"
echo ""

# Check if EAS CLI is installed
if ! command -v eas &> /dev/null; then
    echo "Installing EAS CLI..."
    npm install -g eas-cli
fi

echo "Choose build method:"
echo "1) Cloud build (EAS) - Requires free Expo account, easier"
echo "2) Local build - Requires Android SDK, builds on your machine"
echo ""
read -p "Enter choice (1 or 2): " choice

if [ "$choice" == "1" ]; then
    echo ""
    echo "🌐 Building APK in the cloud..."
    echo "You'll need to login to Expo if not already logged in."
    echo ""
    eas build --platform android --profile preview
    echo ""
    echo "✅ Build started! Check the URL above for progress."
    echo "Once complete, download the APK and install on your phone."
elif [ "$choice" == "2" ]; then
    echo ""
    echo "🔨 Building APK locally..."
    echo "Make sure you have Android SDK installed."
    echo ""
    eas build --platform android --profile preview --local
    echo ""
    echo "✅ Build complete! APK should be in the current directory."
else
    echo "Invalid choice. Exiting."
    exit 1
fi
