@echo off
echo ========================================
echo   Hold On - Production Build
echo ========================================
echo.

echo Checking login status...
eas whoami >nul 2>&1
if %errorlevel% neq 0 (
    echo.
    echo You need to login to Expo first.
    echo.
    echo Please run: eas login
    echo.
    echo If you don't have an account, create one at: https://expo.dev
    echo (It's free!)
    echo.
    pause
    exit /b 1
)

echo.
echo Choose build type:
echo 1) APK - For direct installation
echo 2) AAB - For Google Play Store
echo.
set /p choice="Enter choice (1 or 2): "

if "%choice%"=="1" (
    echo.
    echo Building Production APK...
    echo.
    npm run build:android:production
) else if "%choice%"=="2" (
    echo.
    echo Building Production AAB for Play Store...
    echo.
    npm run build:android:production:aab
) else (
    echo Invalid choice. Exiting.
    pause
    exit /b 1
)

if %errorlevel% equ 0 (
    echo.
    echo ========================================
    echo   Build started successfully!
    echo ========================================
    echo.
    echo Check the URL above for build progress.
    echo When complete, download the file.
    echo.
    echo For APK: Install directly on your phone
    echo For AAB: Upload to Google Play Console
    echo.
) else (
    echo.
    echo Build failed. Please check the error above.
    echo.
)

pause
