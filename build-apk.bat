@echo off
echo ========================================
echo   Hold On - APK Builder
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
echo Starting APK build...
echo This will take 5-10 minutes.
echo.
echo You'll get a URL to track progress and download the APK when done.
echo.

npm run build:android

if %errorlevel% equ 0 (
    echo.
    echo ========================================
    echo   Build started successfully!
    echo ========================================
    echo.
    echo Check the URL above for build progress.
    echo When complete, download the APK and install on your phone.
    echo.
) else (
    echo.
    echo Build failed. Please check the error above.
    echo.
)

pause
