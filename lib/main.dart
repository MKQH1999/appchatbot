// import 'package:appchatbot/view/screens/about_app_screen.dart';
// import 'package:appchatbot/view/screens/chat_history_screen.dart';
// import 'package:appchatbot/view/screens/help_support_screen.dart';
// import 'package:appchatbot/view/screens/home_screen.dart';
// import 'package:appchatbot/view/screens/login_screen.dart';
// import 'package:appchatbot/view/screens/profile_screen.dart';
// import 'package:appchatbot/view/screens/settings_screen.dart';
// import 'package:appchatbot/view/screens/signup_screen.dart';
// import 'package:appchatbot/view/screens/splash_screen.dart';
// import 'package:appchatbot/view/services/auth_provider.dart';
// import 'package:appchatbot/view/utils/theme.dart';
// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';

// void main() async {
//   WidgetsFlutterBinding.ensureInitialized();

//   runApp(
//     MultiProvider(
//       providers: [
//         ChangeNotifierProvider(create: (_) => AuthProvider()),
//       ],
//       child: const ChatBotApp(),
//     ),
//   );
// }

// class ChatBotApp extends StatefulWidget {
//   const ChatBotApp({super.key});

//   @override
//   State<ChatBotApp> createState() => _ChatBotAppState();
// }

// class _ChatBotAppState extends State<ChatBotApp> {
//   @override
//   void initState() {
//     super.initState();
//     _initApp();
//   }

//   Future<void> _initApp() async {
//     final authProvider = Provider.of<AuthProvider>(context, listen: false);
//     await authProvider.autoLogin();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       title: 'مساعد الذكاء الاصطناعي',
//       theme: AppTheme.lightTheme(),
//       darkTheme: AppTheme.darkTheme(),
//       themeMode: ThemeMode.system,

//       supportedLocales: const [
//         Locale('ar', 'AE'), // العربية
//         Locale('en', 'US'), // الإنجليزية
//       ],

//       // التصحيح: إزالة home من هنا ووضعها بشكل صحيح
//       home: Consumer<AuthProvider>(
//         builder: (context, authProvider, child) {
//           if (authProvider.isLoggedIn) {
//             return const HomeScreen();
//           } else {
//             return const SplashScreen();
//           }
//         },
//       ),
//       routes: {
//         '/login': (context) => const LoginScreen(),
//         '/signup': (context) => const SignupScreen(),
//         '/home': (context) => const HomeScreen(),
//         '/profile': (context) => const ProfileScreen(),
//         '/chat_history': (context) => const ChatHistoryScreen(),
//         '/settings': (context) => const SettingsScreen(),
//         '/help_support': (context) => const HelpSupportScreen(),
//         '/about': (context) => const AboutAppScreen(),
//       },
//     );
//   }
// }



import 'package:appchatbot/view/screens/about_app_screen.dart';
import 'package:appchatbot/view/screens/chat_history_screen.dart';
import 'package:appchatbot/view/screens/help_support_screen.dart';
import 'package:appchatbot/view/screens/home_screen.dart';
import 'package:appchatbot/view/screens/login_screen.dart';
import 'package:appchatbot/view/screens/profile_screen.dart';
import 'package:appchatbot/view/screens/settings_screen.dart';
import 'package:appchatbot/view/screens/signup_screen.dart';
import 'package:appchatbot/view/screens/splash_screen.dart';
import 'package:appchatbot/view/services/auth_provider.dart';
import 'package:appchatbot/view/services/theme_provider.dart';
import 'package:appchatbot/view/utils/theme.dart';
import 'package:flutter/material.dart';
// import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  
  // إنشاء الموفرات مسبقاً
  final authProvider = AuthProvider();
  final themeProvider = ThemeProvider();
  
  // تهيئة الحالة المبدئية
  await authProvider.autoLogin();
  
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider.value(value: authProvider),
        ChangeNotifierProvider.value(value: themeProvider),
      ],
      child: MyApp(authProvider: authProvider, themeProvider: themeProvider),
    ),
  );
}

class MyApp extends StatelessWidget {
  final AuthProvider authProvider;
  final ThemeProvider themeProvider;
  
  const MyApp({
    super.key,
    required this.authProvider,
    required this.themeProvider,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'مساعد الذكاء الاصطناعي',
      theme: AppTheme.lightTheme(),
      darkTheme: AppTheme.darkTheme(),
      themeMode: themeProvider.isDarkMode ? ThemeMode.dark : ThemeMode.light,
      
      // دعم التعريب
      // localizationsDelegates: const [
      //   GlobalMaterialLocalizations.delegate,
      //   GlobalWidgetsLocalizations.delegate,
      //   GlobalCupertinoLocalizations.delegate,
      // ],
      supportedLocales: const [
        Locale('ar', 'AE'), // العربية
        Locale('en', 'US'), // الإنجليزية
      ],
      
      // إصلاح مشكلة المسار الابتدائي
      initialRoute: '/',
      routes: {
        '/': (context) => authProvider.isLoggedIn 
            ? const HomeScreen() 
            : const SplashScreen(),
        '/login': (context) => const LoginScreen(),
        '/signup': (context) => const SignupScreen(),
        '/home': (context) => const HomeScreen(),
        '/profile': (context) => const ProfileScreen(),
        '/chat_history': (context) => const ChatHistoryScreen(),
        '/settings': (context) => const SettingsScreen(),
        '/help_support': (context) => const HelpSupportScreen(),
        '/about': (context) => const AboutAppScreen(),
      },
      
      // إصلاح مشكلة المسار غير المعروف
      onGenerateRoute: (settings) {
        return MaterialPageRoute(
          builder: (context) => Scaffold(
            appBar: AppBar(title: const Text('صفحة غير موجودة')),
            body: Center(
              child: Text('الصفحة المطلوبة ${settings.name} غير موجودة'),
            ),
          ),
        );
      },
    );
  }
}