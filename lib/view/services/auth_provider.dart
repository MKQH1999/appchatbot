import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthProvider with ChangeNotifier {
  bool _isLoggedIn = false;
  String? _userId;
  String? _userName;
  String? _userEmail;
  String? _userAvatar;

  bool get isLoggedIn => _isLoggedIn;
  String? get userId => _userId;
  String? get userName => _userName;
  String? get userEmail => _userEmail;
  String? get userAvatar => _userAvatar;

  Future<void> login(String email, String password) async {
    // محاكاة عملية تسجيل الدخول
    await Future.delayed(const Duration(seconds: 1));
    
    // حفظ بيانات المستخدم
    _isLoggedIn = true;
    _userId = 'user_123';
    _userName = 'أحمد محمد';
    _userEmail = email;
    _userAvatar = 'assets/images/bot_avatar.png';
    
    // حفظ حالة تسجيل الدخول
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isLoggedIn', true);
    await prefs.setString('userId', _userId!);
    await prefs.setString('userName', _userName!);
    await prefs.setString('userEmail', _userEmail!);
    await prefs.setString('userAvatar', _userAvatar!);
    
    notifyListeners();
  }

  Future<void> autoLogin() async {
    final prefs = await SharedPreferences.getInstance();
    final isLoggedIn = prefs.getBool('isLoggedIn') ?? false;
    
    if (isLoggedIn) {
      _isLoggedIn = true;
      _userId = prefs.getString('userId');
      _userName = prefs.getString('userName');
      _userEmail = prefs.getString('userEmail');
      _userAvatar = prefs.getString('userAvatar');
      notifyListeners();
    }
  }

  Future<void> logout() async {
    _isLoggedIn = false;
    _userId = null;
    _userName = null;
    _userEmail = null;
    _userAvatar = null;
    
    final prefs = await SharedPreferences.getInstance();
    await prefs.clear();
    
    notifyListeners();
  }
}