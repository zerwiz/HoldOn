# 🔐 Setting Up Android Build Credentials

## Quick Setup (Recommended)

### Option 1: Via Expo Dashboard (Easiest)

1. In your Expo dashboard, go to **Project Settings** → **Credentials**
2. Click on **Android** tab
3. Select **"Let Expo manage your credentials"**
4. Click **Save** or **Generate**

Expo will automatically create and manage your keystore. This is the recommended approach for most projects.

### Option 2: Via CLI

1. **Login to EAS CLI:**
   ```bash
   eas login
   ```

2. **Configure credentials:**
   ```bash
   eas credentials
   ```
   
3. **Follow the prompts:**
   - Select **Android**
   - Choose **"Set up new credentials"**
   - Select **"Let Expo manage your credentials"** (recommended)
   - Or choose **"Set up local credentials"** if you want to manage them yourself

## After Credentials Are Set Up

Once credentials are configured, you can:

1. **Build from Dashboard:**
   - Go to Builds → Create a build
   - Select Android, production profile
   - Click Build

2. **Build from CLI:**
   ```bash
   npm run build:android:production
   ```

## Credential Management Options

### Expo Managed (Recommended)
- ✅ EAS handles everything automatically
- ✅ Secure cloud storage
- ✅ No local files to manage
- ✅ Works with GitHub builds

### Local Credentials
- You manage the keystore file
- More control but more responsibility
- Need to securely store the keystore
- Can commit to repo (not recommended) or use secrets

## For GitHub Builds

If you're using GitHub Actions or EAS Workflows:
- **Expo managed credentials** work automatically
- **Local credentials** need to be set up as GitHub secrets

## Next Steps

1. Set up credentials (via dashboard or CLI)
2. Start your first build
3. Download the APK/AAB when complete

---

**Note:** The first build may take longer (10-15 minutes) as it sets up the build environment.
