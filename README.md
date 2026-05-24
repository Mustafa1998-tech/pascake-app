# 🍰 Pascake Patisserie

تطبيق متكامل لمتجر حلويات ومعجنات **Pascake** — مبني بـ Flutter للجوال ويب، مع نسخة ويب إضافية بـ HTML/CSS/JS.

## 📱 التطبيقات

| التطبيق | التقنية | الرابط |
|---------|---------|--------|
| **Flutter App** (Android + Web) | Flutter / Dart | [Flutter Web](http://localhost:5000) |
| **Website** (HTML) | HTML / CSS / JS | [Website](http://localhost:3000) |
| **APK Download** | Android | `publish mobile/Pascake_v1.apk` |

## ✨ المميزات

- 🏠 شاشة رئيسية مع Hero Section وتصنيفات وشبكة منتجات
- 🛒 سلة مشتريات (Cart)
- ❤️ مفضلة (Favorites)
- 🔍 بحث حي
- 🌙 الوضع الليلي (Dark Mode)
- 💬 طلب عبر واتساب مباشر
- 🎂 طلب كعكة مخصصة
- 📱 تصميم متجاوب (موبايل / تابلت / ديسكتوب)
- 🖼️ صور منتجات حقيقية

## 🚀 التشغيل

### Flutter App
```bash
flutter pub get
flutter run           # موبايل
flutter run -d chrome # ويب
```

### Website
افتح `website/index.html` في المتصفح أو استخدم:
```bash
npx http-server website -p 3000
```

### Android APK
```bash
flutter build apk --release
# الملف: build/app/outputs/flutter-apk/app-release.apk
```

## 🗂️ هيكل المشروع

```
Pascake app/
├── lib/                    # Flutter source
│   ├── config/             # الثيم والألوان والثوابت
│   ├── models/             # Product, CartItem
│   ├── providers/          # Cart, Favorites, Theme
│   ├── screens/            # جميع الشاشات
│   ├── services/           # WhatsApp service
│   └── widgets/            # مكونات قابلة لإعادة الاستخدام
├── website/                # نسخة HTML/CSS/JS
│   ├── index.html
│   ├── css/style.css
│   ├── js/app.js
│   └── images/
├── assets/                 # صور المنتجات والشعار
├── android/                # إعدادات Android
├── publish mobile/         # APK جاهز للتوزيع
└── build/                  # Flutter build output
```

## 🎨 الهوية البصرية

- **الألوان**: Brown `#5C4033`, Gold `#D4AF37`, Cream `#F5E6D3`
- **الخطوط**: Playfair Display (عناوين), Lato (نصوص), Montserrat (أزرار)
- **الشعار**: Logo مخصص في `assets/images/logo.jpeg`

