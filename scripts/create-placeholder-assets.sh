#!/bin/bash

# Create placeholder assets for quick testing
# These are simple colored squares - replace with proper designs later

echo "🎨 Creating placeholder assets..."
echo ""

# Create assets directory if it doesn't exist
mkdir -p assets

# Check if ImageMagick is available
if command -v convert &> /dev/null; then
    echo "Using ImageMagick to create assets..."
    
    # App icon - green circle
    convert -size 1024x1024 xc:none -fill "#4CAF50" -draw "circle 512,512 512,100" assets/icon.png
    echo "✅ Created assets/icon.png"
    
    # Splash screen - white background
    convert -size 1242x2436 xc:#ffffff assets/splash.png
    echo "✅ Created assets/splash.png"
    
    # Adaptive icon - green circle
    convert -size 1024x1024 xc:none -fill "#4CAF50" -draw "circle 512,512 512,100" assets/adaptive-icon.png
    echo "✅ Created assets/adaptive-icon.png"
    
    # Favicon
    convert -size 48x48 xc:#4CAF50 assets/favicon.png
    echo "✅ Created assets/favicon.png"
    
    echo ""
    echo "✅ All placeholder assets created!"
    echo "⚠️  Note: These are simple placeholders. Replace with proper designs before publishing."
else
    echo "❌ ImageMagick not found."
    echo ""
    echo "Please create these files manually:"
    echo "  - assets/icon.png (1024x1024px)"
    echo "  - assets/splash.png (1242x2436px)"
    echo "  - assets/adaptive-icon.png (1024x1024px)"
    echo "  - assets/favicon.png (48x48px)"
    echo ""
    echo "Or install ImageMagick and run this script again:"
    echo "  Windows: choco install imagemagick"
    echo "  Mac: brew install imagemagick"
    echo "  Linux: sudo apt-get install imagemagick"
fi
