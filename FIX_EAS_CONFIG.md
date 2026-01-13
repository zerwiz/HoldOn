# 🔧 Fix EAS Configuration

## Problem

You're getting this error:
```
The "extra.eas.projectId" field is missing from your app config.
EAS project not configured.
Must configure EAS project by running 'eas init' before this command can be run in non-interactive mode.
```

## Solution

You need to initialize the EAS project and get your project ID.

### Option 1: Get Project ID from Dashboard (Easiest)

1. Go to your Expo dashboard: https://expo.dev/accounts/zerwiz/projects/Hold%20On
2. Look for the **Project ID** in the project settings
3. It will look like: `a1b2c3d4-e5f6-7890-abcd-ef1234567890`
4. Copy the project ID

5. Update `app.json` - replace `YOUR_PROJECT_ID_HERE` with your actual project ID:
   ```json
   "extra": {
     "eas": {
       "projectId": "your-actual-project-id-here"
     }
   }
   ```

### Option 2: Run `eas init` (CLI)

1. **Login to EAS CLI:**
   ```bash
   eas login
   ```
   (Enter your Expo credentials)

2. **Initialize the project:**
   ```bash
   eas init
   ```
   
   This will:
   - Link your local project to your Expo account
   - Add the project ID to `app.json` automatically
   - Configure the EAS project

3. **Verify:**
   The `app.json` should now have the `extra.eas.projectId` field filled in.

### Option 3: Manual Configuration

If you know your project ID from the dashboard:

1. Open `app.json`
2. Find the `extra.eas.projectId` field
3. Replace `YOUR_PROJECT_ID_HERE` with your actual project ID
4. Save the file

## After Configuration

Once the project ID is set, you can build:

```bash
npm run build:android:production
```

Or from the dashboard, the build should work now.

## Verify Configuration

Check that `app.json` has:
- ✅ `extra.eas.projectId` with a valid UUID
- ✅ `cli.appVersionSource` set (already added as "remote")

## Notes

- The project ID is a UUID that links your local project to your Expo account
- It's safe to commit this to git (it's not a secret)
- Each Expo project has a unique project ID
- You can find it in the Expo dashboard under Project Settings

---

**Quick Fix:** If you're logged into the dashboard, just copy the project ID from there and paste it into `app.json`!
