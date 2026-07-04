@echo off
REM PoultryPro Egypt - APK Build Script
REM This script will compile your Flutter app to APK automatically

echo.
echo ========================================
echo  PoultryPro Egypt - APK Builder
echo ========================================
echo.

REM Check if Flutter is installed
flutter --version
if %ERRORLEVEL% NEQ 0 (
    echo ERROR: Flutter not found. Please install Flutter first.
    echo Download from: https://flutter.dev/docs/get-started/install
    pause
    exit /b 1
)

echo.
echo [Step 1/4] Cleaning previous builds...
flutter clean
if %ERRORLEVEL% NEQ 0 (
    echo ERROR: Failed to clean
    pause
    exit /b 1
)

echo.
echo [Step 2/4] Getting dependencies...
flutter pub get
if %ERRORLEVEL% NEQ 0 (
    echo ERROR: Failed to get dependencies
    pause
    exit /b 1
)

echo.
echo [Step 3/4] Building APK (this may take 5-10 minutes)...
flutter build apk --release
if %ERRORLEVEL% NEQ 0 (
    echo ERROR: Failed to build APK
    pause
    exit /b 1
)

echo.
echo ========================================
echo  BUILD SUCCESSFUL!
echo ========================================
echo.
echo Your APK is ready at:
echo build\app\outputs\flutter-apk\app-release.apk
echo.
echo File size: ~50-60 MB
echo Target: Android 5.0 and above
echo.
pause
