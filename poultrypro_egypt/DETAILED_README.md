# PoultryPro Egypt - مشروع تطبيق أندرويد احترافي

## 📱 نظرة عامة

**PoultryPro Egypt** تطبيق Android متقدم وأحترافي تماماً مصمم لتقديم دليل شامل عن أمراض الدواجن والتحصين في مصر.

### المميزات الرئيسية ✨

- 🦠 **5+ أمراض رئيسية مع تفاصيل كاملة**
- 💉 **جدول تحصين متكامل (8 أسابيع)**
- 🎨 **تصميم احترافي فاخر (Glass Morphism)**
- 🌊 **انيميشن وترانزشن سلسة بدون تقطيع**
- 🌙 **نمط معتم وفاتح (Dark/Light Mode)**
- 🇸🇦 **دعم كامل للعربية (RTL)**
- ⚡ **أداء ممتاز بدون تهنيج**
- 📱 **تطبيق أصلي Android مع Flutter**

## 🛠️ البيئة التقنية

```
Flutter 3.x
Dart
GetX (State Management)
Material Design 3
Google Fonts (Cairo Font)
```

### المكتبات المستخدمة
- `flutter_animate`: للانيميشن المتقدم
- `font_awesome_flutter`: أيقونات احترافية
- `get`: إدارة الحالة والملاحة
- `shared_preferences`: حفظ البيانات المحلية

## 📁 هيكل المشروع

```
poultrypro_egypt/
├── lib/
│   ├── main.dart                    # نقطة الدخول
│   ├── screens/
│   │   ├── home_screen.dart        # الشاشة الرئيسية
│   │   └── disease_detail_screen.dart  # تفاصيل المرض
│   ├── widgets/
│   │   └── animated_widgets.dart   # الـ widgets المتقدمة
│   ├── models/
│   │   └── disease_model.dart      # نماذج البيانات
│   ├── data/
│   │   └── diseases_data.dart      # بيانات الأمراض
│   ├── themes/
│   │   └── app_theme.dart          # نظام المواضيع
│   └── utils/
│       ├── constants.dart          # الثوابت
│       └── animations.dart         # الانيميشن المتقدم
├── android/                        # إعدادات Android
├── pubspec.yaml                    # ملف الاعتماديات
├── README.md                       # التوثيق الرئيسي
└── BUILD_INSTRUCTIONS.md           # تعليمات البناء

```

## 🚀 البدء السريع

### 1️⃣ التثبيت

```bash
# استنساخ المشروع
cd poultrypro_egypt

# تثبيت الاعتماديات
flutter pub get
```

### 2️⃣ التشغيل

```bash
# تشغيل على جهاز/محاكي
flutter run

# تشغيل بوضع Release
flutter run --release
```

### 3️⃣ بناء APK

```bash
# APK واحد (كبير الحجم)
flutter build apk --release
# الناتج: build/app/outputs/flutter-apk/app-release.apk

# APKs مقسمة حسب المعمارية (أصغر حجماً)
flutter build apk --split-per-abi --release
# الناتج: 3 ملفات APK

# App Bundle (لـ Google Play Store)
flutter build appbundle --release
# الناتج: build/app/outputs/bundle/release/app-release.aab
```

## 📊 الأمراض المدرجة

### 1. مرض نيوكاسل (NDV) 🦠
- **الاسم العلمي**: Avian Orthoavulavirus 1
- **السلالة**: VII.1.1 (المهيمنة في مصر)
- **الخطورة**: حرجة
- **المعدل الوفيات**: عالي جداً

### 2. إنفلونزا H5 (HPAI) ☠️
- **الاسم العلمي**: Influenza A Virus H5N1
- **الخطورة**: حرجة
- **الخطر على الإنسان**: نعم

### 3. إنفلونزا H9 (LPAI) 💉
- **الاسم العلمي**: Influenza A Virus H9N2
- **الخطورة**: عالية
- **الانتشار**: واسع في مصر

### 4. الجمبورو (IBD) 🐣
- **الاسم العلمي**: Infectious Bursal Disease Virus
- **الخطورة**: عالية
- **المرحلة العمرية**: الصغار (2-6 أسابيع)

### 5. التنفسي المعدي (IB) 🫁
- **الاسم العلمي**: Avian Coronavirus
- **الخطورة**: متوسطة
- **التأثر**: جهاز التنفس والكلى

## 💉 جدول التحصين

| اليوم | اللقاح | الطريقة | المرض |
|------|--------|--------|------|
| 1 | ماريك | IM/SC | ماريك |
| 7 | نيوكاسل I1 | Eye Drop | نيوكاسل |
| 10 | جمبورو | Drinking Water | الجمبورو |
| 14 | التنفسي | Spray | التنفسي |
| 21 | ريو فيروس | Drinking Water | الريو |
| 28 | نيوكاسل II | Drinking Water | نيوكاسل |
| 35 | إنفلونزا H9 | IM | H9 |
| 42 | تقوية | مختلفة | متعدد |

## 🎨 نظام الألوان

```dart
Accent:  #00D4AA (تركوازي)
Danger:  #FF4757 (أحمر)
Warning: #FFA502 (برتقالي)
Info:    #3742FA (أزرق)
Purple:  #A55EEA (بنفسجي)
Gold:    #FFD700 (ذهبي)
```

## ✨ الانيميشن والترانزشن

### الانيميشنات المستخدمة
- ✅ Fade In/Out
- ✅ Slide (Up, Down, Left, Right)
- ✅ Scale/Zoom
- ✅ Rotate
- ✅ Bounce
- ✅ Float
- ✅ Shimmer
- ✅ Glow Effects
- ✅ Pulse
- ✅ Staggered Animations

### ترانزشن الصفحات
- **Slide Transition**: انزلاق من اليمين إلى اليسار
- **Scale Transition**: توسع مع تلاشي
- **Fade Transition**: تلاشي بسيط
- **Rotation Transition**: دوران مع توسع

## 🔧 التخصيص والإعدادات

### تغيير المواضيع
```dart
// في main.dart
theme: isDarkMode ? AppTheme.darkTheme : AppTheme.lightTheme,
```

### إضافة مرض جديد
```dart
// في diseases_data.dart
Disease(
  id: 'new_disease',
  name: 'Disease Name',
  arabicName: 'اسم المرض',
  emoji: '🔬',
  color: Color(...),
  // ... باقي الحقول
),
```

### تغيير سرعة الانيميشن
```dart
// في animated_widgets.dart أو screens
duration: Duration(milliseconds: 600), // غير هذا
```

## 📈 الأداء والتحسينات

### تم تحسينه لـ:
- ✅ **بدون جank**: smooth frame rate 60fps+
- ✅ **تمرير سلس**: Bouncing scroll physics
- ✅ **انيميشن طلس**: Cubic bezier curves
- ✅ **أداء عالي**: Efficient rendering
- ✅ **استهلاك بطارية منخفض**: Optimized animations

### تقنيات التحسين:
- استخدام `AnimationController` بكفاءة
- `ListView` مع `shrinkWrap: true`
- `BouncingScrollPhysics` للتمرير السلس
- تقسيم الـ widgets إلى وحدات صغيرة
- استخدام `const` constructors

## 🧪 الاختبار

### تشغيل على محاكي
```bash
flutter emulators --launch Pixel_6_API_33
flutter run
```

### تشغيل على جهاز فعلي
```bash
flutter devices  # عرض الأجهزة المتصلة
flutter run -d <device_id>
```

## 📦 حجم التطبيق

| نوع | الحجم |
|------|-------|
| APK واحد | ~50-60 MB |
| APK armeabi-v7a | ~35-40 MB |
| APK arm64-v8a | ~40-45 MB |
| App Bundle | ~20-25 MB |

## 🔒 الأمان والخصوصية

- ✅ لا يتم جمع بيانات المستخدم
- ✅ تطبيق محلي بدون اتصال بالإنترنت
- ✅ بيانات آمنة باستخدام SharedPreferences

## 🐛 استكشاف الأخطاء

```bash
# تنظيف البناء
flutter clean

# الحصول على التبعيات الحديثة
flutter pub get

# فحص الأخطاء
flutter analyze

# بناء مع معلومات تفصيلية
flutter build apk --verbose --release
```

## 📚 الموارد والمراجع

- [Flutter Documentation](https://flutter.dev/docs)
- [Dart Language](https://dart.dev)
- [Android Developer](https://developer.android.com)
- [Material Design 3](https://m3.material.io)

## 🎯 الخطط المستقبلية

- [ ] إضافة صور توضيحية للأمراض
- [ ] التكامل مع API خارجي للبيانات المحدثة
- [ ] إضافة حاسبة جرعات اللقاحات
- [ ] نظام تذكيرات التحصين
- [ ] تصدير التقارير PDF
- [ ] دعم لغات إضافية

## 👨‍💼 المطور

**Eng. Mohamed Ali**
- متخصص في تطوير تطبيقات Flutter
- خبرة في الصحة الحيوانية والتطبيقات الطبية

## 📄 الترخيص

جميع الحقوق محفوظة © 2024-2026

## 📧 التواصل والدعم

للمزيد من المعلومات أو للإبلاغ عن مشاكل:
- 📧 البريد الإلكتروني: [معلومات التواصل]
- 💬 وسائل التواصل الاجتماعي: [الروابط]

---

## 🎉 شكراً لك!

شكراً لاستخدام **PoultryPro Egypt**. نتمنى أن يكون هذا التطبيق مفيداً لك!

**مصنوع بـ ❤️ باستخدام Flutter | Made with ❤️ using Flutter**

---

**الإصدار الحالي**: v2.0.0  
**آخر تحديث**: July 4, 2026
