# 🔍 How to Find Your EAS Project ID

## What is a Project ID?

EAS project IDs are full UUIDs (Universally Unique Identifiers) that look like:
```
de3f9ead-xxxx-xxxx-xxxx-xxxxxxxxxxxx
```

- **Format**: UUID with dashes
- **Length**: 36 characters total
- **Example**: `de3f9ead-1234-5678-9abc-def123456789`

## Finding Your Full Project ID

### Method 1: Expo Dashboard - Project Settings (Recommended)

1. **Make sure you're logged in** to Expo
2. Go to your Expo dashboard: 
   - Organization: https://expo.dev/accounts/zerwizs-organization/projects/hold-on/settings
   - Or personal: https://expo.dev/accounts/zerwiz/projects/Hold%20On
3. In the left sidebar, click on **"Project settings"** (if not already there)
4. Click on the **"General"** tab
5. Look for **"Project ID"** - it will be displayed as a full UUID
6. Copy the entire UUID (all 36 characters)

**Note**: 
- The Project ID is usually displayed prominently in the General settings tab
- Your project is under the organization account `zerwizs-organization`
- Make sure you're logged in to see the settings page

### Method 2: From Builds Page

If you have any builds:
1. Go to **"Builds"** section in the dashboard
2. Click on any build
3. The project ID might be shown in:
   - The build details
   - The URL of the build page
   - Build metadata

### Method 3: Via EAS CLI

If you're logged in via CLI:
```bash
eas project:info
```

This will show your project details including the full project ID.

### Method 4: Check the URL

The project ID might also be visible in:
- The browser URL when viewing project settings
- The project overview page
- Network requests in browser dev tools

## What About "de3f9ead"?

If you see a short ID like "de3f9ead", this is likely:
- A **partial project ID** (first 8 characters)
- A **build ID** (different from project ID)
- Part of a longer identifier

You need the **full 36-character UUID** for the `app.json` configuration.

## Once You Have the Full ID

Update `app.json` with your project ID:

```json
"extra": {
  "eas": {
    "projectId": "your-full-project-id-here"
  }
}
```

Replace `your-full-project-id-here` with your actual project ID (the full UUID).

## Quick Steps Summary

1. ✅ Go to Expo Dashboard
2. ✅ Click "Project settings" → "General"
3. ✅ Copy the full Project ID (UUID)
4. ✅ Update `app.json` or tell me the ID and I'll update it!

## Important Notes

- The project ID is **safe to commit to git** - it's not a secret, just an identifier
- The project ID **must match** the EAS project you're building for
- When building from GitHub, ensure `projectId`, `slug`, and `owner` all match correctly
- See [FIX_EAS_CONFIG.md](FIX_EAS_CONFIG.md) for more configuration details

---

**Need Help?** Once you have the full project ID, I can help you update `app.json` automatically!
