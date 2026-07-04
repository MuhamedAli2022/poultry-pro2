# Build Instructions for PoultryPro Egypt

## Prerequisites

Before building the APK, make sure you have:

1. **Flutter SDK** installed and configured
   - Add Flutter to your PATH
   - Run `flutter doctor` to verify installation

2. **Android SDK** installed
   - Install from Android Studio or standalone
   - Set `ANDROID_SDK_ROOT` environment variable

3. **Java Development Kit (JDK)**
   - Java 11 or higher recommended

## Build Steps

### 1. Get Dependencies
```bash
flutter pub get
```

### 2. Check Device/Emulator
```bash
flutter devices
```

### 3. Generate APK (Release)
```bash
flutter build apk --release
```

Output: `build/app/outputs/flutter-apk/app-release.apk`

### 4. Generate APK (Split by ABI - for smaller downloads)
```bash
flutter build apk --split-per-abi --release
```

Output: 
- `build/app/outputs/flutter-apk/app-armeabi-v7a-release.apk`
- `build/app/outputs/flutter-apk/app-arm64-v8a-release.apk`
- `build/app/outputs/flutter-apk/app-x86_64-release.apk`

### 5. Generate App Bundle (for Google Play Store)
```bash
flutter build appbundle --release
```

Output: `build/app/outputs/bundle/release/app-release.aab`

## Installation on Device

### Install Release APK
```bash
flutter install build/app/outputs/flutter-apk/app-release.apk
```

### Install Debug APK
```bash
flutter run
```

## Clean Build (if having issues)

```bash
flutter clean
flutter pub get
flutter build apk --release
```

## Troubleshooting

### Issue: "Flutter SDK not found"
- Set `flutter.sdk` in `android/local.properties`

### Issue: "Android SDK not found"
- Install Android SDK via Android Studio
- Set `sdk.dir` in `android/local.properties`

### Issue: Build fails with Gradle error
- Run `flutter clean`
- Update Gradle: `flutter pub upgrade`
- Delete `android/.gradle` folder

### Issue: Slow build
- Use `--split-per-abi` flag for faster builds
- Close other applications
- Increase heap size: `export _JAVA_OPTIONS="-Xmx4g"`

## Performance Tips

- ✅ Use Release build for production
- ✅ Enable multidex if app size > 65KB
- ✅ Use ProGuard for code obfuscation
- ✅ Test on actual device, not just emulator

## Version Management

Edit `pubspec.yaml` to update version:
```yaml
version: 2.0.0+1
```

Format: `major.minor.patch+buildNumber`

## File Size Optimization

- Use `--strip-with-obfuscation` for smaller APK
- Remove unused resources
- Compress assets

## Signing APK (Optional)

For Google Play Store submission:

1. Create keystore:
```bash
keytool -genkey -v -keystore ~/key.jks -keyalg RSA -keysize 2048 -validity 10000 -alias poultrypro
```

2. Sign APK:
```bash
jarsigner -verbose -sigalg SHA256withRSA -digestalg SHA-256 -keystore ~/key.jks build/app/outputs/flutter-apk/app-release-unsigned.apk poultrypro
```

3. Zipalign:
```bash
zipalign -v 4 app-release-unsigned.apk app-release-signed.apk
```

## Support

For build issues, refer to:
- Flutter docs: https://flutter.dev/docs
- Android docs: https://developer.android.com/
- GitHub Issues: Report issues with exact error messages

---

**Last Updated**: July 4, 2026
