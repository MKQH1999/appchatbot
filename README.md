
# تطبيق مساعد الذكاء الاصطناعي - ChatBot App

![شعار التطبيق](assets/images/app_icon.png)

تطبيق شات بوت متكامل يعتمد على الذكاء الاصطناعي لتقديم تجربة محادثة تفاعلية مع المستخدمين، مع واجهة مستخدم جميلة ودعم كامل للغة العربية.

## الميزات الرئيسية

-  محادثات ذكية مع مساعد افتراضي
-  دعم الوضع الليلي (Dark Mode)
-  دعم كامل للغة العربية والتخطيط من اليمين لليسار
-  نظام مصادقة آمن (تسجيل دخول/تسجيل حساب)
-  واجهة مستخدم متجاوبة تعمل على مختلف أحجام الشاشات
-  إعدادات متقدمة لتخصيص تجربة المستخدم
-  سجل محادثات لحفظ جميع المحادثات السابقة

## التقنيات المستخدمة

- **Flutter 3.x** - إطار عمل متعدد المنصات
- **Provider** - إدارة حالة التطبيق
- **Flutter SVG** - عرض ملفات SVG
- **Lottie** - عرض رسوم متحرقة بتنسيق JSON
- **Shared Preferences** - حفظ الإعدادات محلياً
- **Flutter Chat Bubble** - تصميم فقاعات محادثة احترافية
- **Internationalization** - دعم الترجمة والتوطين

## هيكل المشروع

```
lib/
├── main.dart          # نقطة بداية التطبيق
├── view/
│   ├── screens/       # شاشات التطبيق
│   ├── services/      # مقدمي الخدمة (Providers)
│   └── utils/         # أدوات مساعدة
├── widgets/           # مكونات واجهة مخصصة
├── assets/            # الأصول (صور، خطوط، رسوم)
└── test/              # اختبارات التطبيق
```

## الشاشات الرئيسية

1. **شاشة البداية (Splash Screen)**  
   واجهة ترحيبية مع شعار التطبيق

2. **شاشة تسجيل الدخول (Login Screen)**  
   تسجيل الدخول باستخدام البريد الإلكتروني وكلمة المرور

3. **شاشة إنشاء حساب (Signup Screen)**  
   إنشاء حساب جديد للمستخدمين الجدد

4. **الشاشة الرئيسية (Home Screen)**  
   واجهة التطبيق الرئيسية مع القائمة الجانبية

5. **شاشة المحادثة (Chat Screen)**  
   واجهة الدردشة مع المساعد الافتراضي

6. **شاشة البروفايل (Profile Screen)**  
   إدارة الملف الشخصي والإعدادات

7. **شاشة الإعدادات (Settings Screen)**  
   تعديل إعدادات التطبيق والمظهر

## متطلبات التثبيت

1. تأكد من تثبيت [Flutter SDK](https://flutter.dev)
2. تأكد من تثبيت [Android Studio](https://developer.android.com/studio) أو [Xcode](https://developer.apple.com/xcode/)
3. تأكد من تثبيت [Git](https://git-scm.com)

## خطوات التشغيل

```bash
# 1. استنساخ المشروع
git clone https://github.com/MKQH1999/appchatbot.git

# 2. الدخول إلى مجلد المشروع
cd appchatbot

# 3. تثبيت التبعيات
flutter pub get

# 4. تشغيل التطبيق
flutter run

# 5. (اختياري) توليد أيقونات التطبيق
flutter pub run flutter_launcher_icons:main

# 6. (اختياري) توليد شاشة البدء
flutter pub run flutter_native_splash:create
```

## التخصيص

### تغيير الألوان
عدل ملف `lib/view/utils/theme.dart` لتغيير ألوان التطبيق:

```dart
class AppColors {
  static const Color primaryColor = Color(0xFF1a73e8);
  static const Color secondaryColor = Color(0xFF4285F4);
  // ... ألوان أخرى
}
```

### إضافة لغات جديدة
1. أضف ملف ترجمة جديد في مجلد `assets/locales`
2. عدل ملف `lib/main.dart` لإضافة اللغة الجديدة:

```dart
supportedLocales: const [
  Locale('ar', 'AE'),
  Locale('en', 'US'),
  Locale('fr', 'FR'), // إضافة لغة جديدة
],
```

### تكوين خادم API
عدل ملف `lib/view/services/chat_service.dart` لإضافة عنوان API الخاص بك:

```dart
class ChatService {
  static const String _baseUrl = 'https://your-api-url.com';
  // ... بقية الكود
}
```

## الاختبارات

لتشغيل الاختبارات:

```bash
flutter test
```

## المساهمة في المشروع

1. انسخ المشروع (Fork)
2. أنشئ فرعاً جديداً (git checkout -b feature/new-feature)
3. أضف تعديلاتك (git commit -am 'Add new feature')
4. ادفع التعديلات (git push origin feature/new-feature)
5. أنشئ طلب دمج (Pull Request)

## الترخيص

هذا المشروع مرخص تحت [رخصة MIT](LICENSE).

## الاعترافات

- فريق تطوير Flutter
- حزمة Provider لإدارة الحالة
- مجتمع المصادر المفتوحة

## لقطات شاشة

| الشاشة الرئيسية | شاشة المحادثة | الإعدادات |
|----------------|---------------|-----------|
| <img src="screenshots/home.jpg" width="200"> | <img src="screenshots/chat.jpg" width="200"> | <img src="screenshots/settings.jpg" width="200"> |

| تسجيل الدخول | البروفايل | الوضع الليلي |
|--------------|-----------|--------------|
| <img src="screenshots/login.jpg" width="200"> | <img src="screenshots/profile.jpg" width="200"> | <img src="screenshots/dark_mode.jpg" width="200"> |

## دعم

لأي استفسارات أو مشاكل، يرجى فتح [issue](https://github.com/MKQH1999/appchatbot/issues) في مستودع GitHub.