#!/bin/bash

# Hold On - Bootstrap Script
# This script initializes the development environment

echo "🚀 Hold On - Bootstrap Script"
echo "=============================="
echo ""

# Check if Node.js is installed
if ! command -v node &> /dev/null; then
    echo "❌ Node.js is not installed. Please install Node.js first."
    exit 1
fi

echo "✅ Node.js version: $(node --version)"

# Check if npm is installed
if ! command -v npm &> /dev/null; then
    echo "❌ npm is not installed. Please install npm first."
    exit 1
fi

echo "✅ npm version: $(npm --version)"

# Install dependencies
echo ""
echo "📦 Installing dependencies..."
npm install

# Check if Expo CLI is available
if ! command -v expo &> /dev/null; then
    echo ""
    echo "⚠️  Expo CLI not found globally. Installing..."
    npm install -g expo-cli
fi

echo ""
echo "✅ Setup complete!"
echo ""
echo "To start the app, run:"
echo "  npm start"
echo ""
echo "To run on Android:"
echo "  npm run android"
echo ""
