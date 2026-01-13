# Check Requirements for Local Android Build
# Run this script to verify your setup

Write-Host "`n========================================" -ForegroundColor Cyan
Write-Host "  Hold On - Requirements Checker" -ForegroundColor Cyan
Write-Host "========================================`n" -ForegroundColor Cyan

$allGood = $true

# Check Java
Write-Host "Checking Java JDK..." -ForegroundColor Yellow
try {
    $javaVersion = java -version 2>&1 | Select-Object -First 1
    if ($javaVersion -match "version") {
        Write-Host "  ✅ Java installed" -ForegroundColor Green
        Write-Host "     $javaVersion" -ForegroundColor Gray
    } else {
        Write-Host "  ❌ Java not found" -ForegroundColor Red
        $allGood = $false
    }
} catch {
    Write-Host "  ❌ Java not found" -ForegroundColor Red
    Write-Host "     Download from: https://www.oracle.com/java/technologies/downloads/" -ForegroundColor Yellow
    $allGood = $false
}

# Check JAVA_HOME
if ($env:JAVA_HOME) {
    Write-Host "  ✅ JAVA_HOME set: $env:JAVA_HOME" -ForegroundColor Green
} else {
    Write-Host "  ⚠️  JAVA_HOME not set (optional but recommended)" -ForegroundColor Yellow
}

Write-Host ""

# Check Android SDK
Write-Host "Checking Android SDK..." -ForegroundColor Yellow
if ($env:ANDROID_HOME) {
    Write-Host "  ✅ ANDROID_HOME set: $env:ANDROID_HOME" -ForegroundColor Green
    
    # Check if SDK exists
    if (Test-Path $env:ANDROID_HOME) {
        Write-Host "  ✅ Android SDK path exists" -ForegroundColor Green
        
        # Check for platform-tools
        if (Test-Path "$env:ANDROID_HOME\platform-tools\adb.exe") {
            Write-Host "  ✅ Android SDK platform-tools found" -ForegroundColor Green
        } else {
            Write-Host "  ⚠️  Platform-tools not found (install via Android Studio SDK Manager)" -ForegroundColor Yellow
        }
        
        # Check for build-tools
        $buildTools = Get-ChildItem "$env:ANDROID_HOME\build-tools" -ErrorAction SilentlyContinue
        if ($buildTools) {
            Write-Host "  ✅ Android SDK build-tools found" -ForegroundColor Green
        } else {
            Write-Host "  ⚠️  Build-tools not found (install via Android Studio SDK Manager)" -ForegroundColor Yellow
        }
    } else {
        Write-Host "  ❌ Android SDK path does not exist: $env:ANDROID_HOME" -ForegroundColor Red
        $allGood = $false
    }
} else {
    Write-Host "  ❌ ANDROID_HOME not set" -ForegroundColor Red
    Write-Host "     Set it to your Android SDK path (usually:" -ForegroundColor Yellow
    Write-Host "     C:\Users\$env:USERNAME\AppData\Local\Android\Sdk)" -ForegroundColor Yellow
    $allGood = $false
}

Write-Host ""

# Check Android Studio (optional check)
Write-Host "Checking Android Studio..." -ForegroundColor Yellow
$studioPaths = @(
    "$env:LOCALAPPDATA\Programs\Android\Android Studio",
    "$env:ProgramFiles\Android\Android Studio",
    "$env:ProgramFiles(x86)\Android\Android Studio"
)

$studioFound = $false
foreach ($path in $studioPaths) {
    if (Test-Path $path) {
        Write-Host "  ✅ Android Studio found: $path" -ForegroundColor Green
        $studioFound = $true
        break
    }
}

if (-not $studioFound) {
    Write-Host "  ⚠️  Android Studio not found in common locations" -ForegroundColor Yellow
    Write-Host "     Download from: https://developer.android.com/studio" -ForegroundColor Yellow
}

Write-Host ""

# Summary
Write-Host "========================================" -ForegroundColor Cyan
if ($allGood) {
    Write-Host "  ✅ All critical requirements met!" -ForegroundColor Green
    Write-Host "  You can now build APK locally." -ForegroundColor Green
    Write-Host "`n  Run: .\scripts\build-local.bat" -ForegroundColor Cyan
} else {
    Write-Host "  ❌ Some requirements missing" -ForegroundColor Red
    Write-Host "  Please install missing components and try again." -ForegroundColor Yellow
    Write-Host "`n  See SETUP_REQUIREMENTS.md for download links" -ForegroundColor Cyan
}
Write-Host "========================================`n" -ForegroundColor Cyan
