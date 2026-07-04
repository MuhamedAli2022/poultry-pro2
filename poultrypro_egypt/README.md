# PoultryPro Egypt 🐤

**دليل الأمراض والتحصين المتكامل | Comprehensive Poultry Diseases & Vaccination Guide**

A professional Flutter application providing comprehensive information about poultry diseases and vaccination schedules in Egypt.

## Features ✨

- 🦠 **5+ Major Diseases**: NDV, H5 (HPAI), H9 (LPAI), Gumboro, Infectious Bronchitis, and more
- 💉 **Complete Vaccination Schedule**: Detailed vaccine information with administration routes
- 🎨 **Premium UI/UX**: 
  - Glassmorphism design
  - Smooth animations and transitions
  - Dark/Light theme support
  - RTL Arabic support
- 🔄 **Perfect Performance**: No jank, smooth scrolling, optimized rendering
- 📱 **Android Native**: Built with Flutter for optimal Android performance
- 🎯 **User-Friendly**: Intuitive navigation with bottom tab bar and side drawer

## Tech Stack 🛠️

- **Framework**: Flutter 3.x
- **Language**: Dart
- **State Management**: GetX
- **Animations**: Flutter Animate, Built-in animations
- **UI**: Material Design 3, Glassmorphism
- **Fonts**: Google Fonts (Cairo)

## Project Structure 📁

```
lib/
├── main.dart                 # App entry point
├── screens/
│   ├── home_screen.dart     # Home page with disease list
│   └── disease_detail_screen.dart  # Disease details page
├── widgets/
│   └── animated_widgets.dart # Reusable animated components
├── models/
│   └── disease_model.dart   # Data models
├── data/
│   └── diseases_data.dart   # Disease information
├── themes/
│   └── app_theme.dart       # Theme configuration
└── utils/
    └── constants.dart       # App constants
```

## Disease Information Included 🔬

1. **Newcastle Disease (NDV)** - Genotype VII.1.1
   - Scientific name, symptoms, causes, prevention, and treatment
   - Severity: Critical

2. **Avian Influenza H5 (HPAI)**
   - High pathogenic strain
   - Severity: Critical

3. **Avian Influenza H9 (LPAI)**
   - Low pathogenic strain
   - Severity: High

4. **Gumboro Disease (IBD)**
   - Infectious Bursal Disease
   - Severity: High

5. **Infectious Bronchitis (IB)**
   - Respiratory infection
   - Severity: Medium

## Vaccination Schedule 💉

Complete 8-week vaccination program including:
- Marek's Disease (Day 1)
- Newcastle Disease (Day 7 & 28)
- Gumboro (Day 10)
- Infectious Bronchitis (Day 14)
- Reovirus (Day 21)
- Influenza H9 (Day 35)
- Booster shots (Day 42)

## Installation & Setup 🚀

### Prerequisites
- Flutter SDK (3.0.0 or higher)
- Android SDK (for APK generation)
- Java 8+ (for Android compilation)

### Steps

1. **Clone/Download the project**
```bash
cd poultrypro_egypt
```

2. **Install dependencies**
```bash
flutter pub get
```

3. **Generate APK**
```bash
flutter build apk --release
```

The APK will be generated at: `build/app/outputs/flutter-apk/app-release.apk`

## Building APK 📦

### Release APK
```bash
flutter build apk --release
```

### Split APK (smaller sizes)
```bash
flutter build apk --split-per-abi --release
```

### App Bundle (for Play Store)
```bash
flutter build appbundle --release
```

## UI Components 🎨

- **AnimatedCard**: Cards with smooth hover animations
- **GlassCard**: Glassmorphism effect cards
- **StatCard**: Statistics display cards
- **SectionTitle**: Styled section headers
- **Smooth Scrolling**: Bouncing physics for natural feel
- **Page Transitions**: Slide transitions between screens

## Animations & Transitions ⚡

- ✨ Fade-in animations on load
- 🔄 Scale animations on hover/tap
- 📊 Staggered list animations
- 🎯 Slide transitions between screens
- 💫 Shimmer and pulse effects
- 🌊 Bouncing scroll physics

## Theme System 🎨

- **Dark Theme**: Optimized for eye comfort
- **Light Theme**: Clean and professional
- **Color Palette**:
  - Accent: Teal (#00D4AA)
  - Danger: Red (#FF4757)
  - Warning: Orange (#FFA502)
  - Info: Blue (#3742FA)
  - Purple: (#A55EEA)
  - Gold: (#FFD700)

## Localization 🌍

- ✅ Arabic (RTL) - Full support
- 📝 English (LTR) - Partial support
- 🗣️ Cairo font for better Arabic typography

## Performance Optimization ⚙️

- ✅ Efficient widget rebuilding
- ✅ Optimized animations with proper timing
- ✅ ListView with bounded heights
- ✅ Image lazy loading
- ✅ Memory-efficient data structures

## Developer 👨‍💻

**Eng. Mohamed Ali**

## Version 📌

**v2.0.0** - Latest Release

## License 📄

All rights reserved. © 2024-2026

## Support & Feedback 📧

For questions, suggestions, or bug reports, please contact the developer.

---

**Built with ❤️ using Flutter | مصنوع بـ ❤️ باستخدام Flutter**
