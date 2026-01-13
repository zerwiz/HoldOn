// Create placeholder assets for Hold On app
const fs = require('fs');
const path = require('path');

async function createAssets() {
  try {
    const sharp = require('sharp');
    
    const assetsDir = path.join(__dirname, '..', 'assets');
    if (!fs.existsSync(assetsDir)) {
      fs.mkdirSync(assetsDir, { recursive: true });
    }
    
    console.log('🎨 Creating placeholder assets...\n');
    
    // Create icon (1024x1024, green)
    await sharp({
      create: {
        width: 1024,
        height: 1024,
        channels: 4,
        background: { r: 76, g: 175, b: 80, alpha: 1 }
      }
    })
    .png()
    .toFile(path.join(assetsDir, 'icon.png'));
    console.log('✅ Created assets/icon.png');
    
    // Create splash (1242x2436, white)
    await sharp({
      create: {
        width: 1242,
        height: 2436,
        channels: 4,
        background: { r: 255, g: 255, b: 255, alpha: 1 }
      }
    })
    .png()
    .toFile(path.join(assetsDir, 'splash.png'));
    console.log('✅ Created assets/splash.png');
    
    // Create adaptive icon (1024x1024, green)
    await sharp({
      create: {
        width: 1024,
        height: 1024,
        channels: 4,
        background: { r: 76, g: 175, b: 80, alpha: 1 }
      }
    })
    .png()
    .toFile(path.join(assetsDir, 'adaptive-icon.png'));
    console.log('✅ Created assets/adaptive-icon.png');
    
    // Create favicon (48x48, green)
    await sharp({
      create: {
        width: 48,
        height: 48,
        channels: 4,
        background: { r: 76, g: 175, b: 80, alpha: 1 }
      }
    })
    .png()
    .toFile(path.join(assetsDir, 'favicon.png'));
    console.log('✅ Created assets/favicon.png');
    
    console.log('\n✅ All assets created successfully!');
    
  } catch (e) {
    console.error('❌ Error creating assets:', e.message);
    console.log('\n⚠️  Make sure sharp is installed: npm install sharp --save-dev');
    process.exit(1);
  }
}

createAssets();
