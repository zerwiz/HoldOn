@echo off
echo ========================================
echo   Hold On - Local APK Builder
echo ========================================
echo.

REM Check for Java
where java >nul 2>&1
if %errorlevel% neq 0 (
    echo ❌ Java JDK not found. Please install Java JDK 11 or higher.
    pause
    exit /b 1
)

REM Check for Android SDK
if "%ANDROID_HOME%"=="" (
    if "%ANDROID_SDK_ROOT%"=="" (
        echo ❌ ANDROID_HOME not set. Please set it to your Android SDK path.
        echo    Example: set ANDROID_HOME=C:\Users\YourName\AppData\Local\Android\Sdk
        pause
        exit /b 1
    )
)

echo ✅ Prerequisites check passed
echo.

REM Step 1: Prebuild
echo 📦 Step 1: Generating native Android project...
if not exist "android" (
    call npx expo prebuild --platform android --clean
    if %errorlevel% neq 0 (
        echo ❌ Prebuild failed
        pause
        exit /b 1
    )
    echo ✅ Android project generated
) else (
    echo ⚠️  Android folder exists. Skipping prebuild.
    echo    Delete the android folder first if you want to regenerate.
)

echo.

REM Step 2: Build with Gradle
echo 🔨 Step 2: Building APK with Gradle...
cd android

if exist "gradlew.bat" (
    call gradlew.bat assembleRelease
) else (
    echo ❌ Gradle wrapper not found
    cd ..
    pause
    exit /b 1
)

if %errorlevel% equ 0 (
    echo.
    echo ✅ Build successful!
    echo.
    echo 📱 Your APK is located at:
    echo    android\app\build\outputs\apk\release\app-release.apk
    echo.
    echo ⚠️  Note: This APK is unsigned. For production, you need to sign it.
    echo    See BUILD_LOCAL.md for signing instructions.
) else (
    echo ❌ Build failed
)

cd ..
pause
