import 'package:flutter/material.dart';

class SecurityPrivacyScreen extends StatefulWidget {
  const SecurityPrivacyScreen({super.key});

  @override
  State<SecurityPrivacyScreen> createState() => _SecurityPrivacyScreenState();
}

class _SecurityPrivacyScreenState extends State<SecurityPrivacyScreen> {
  bool _biometricEnabled = true;
  bool _activityLogging = true;
  bool _autoLock = false;
  int _autoLockTime = 1; // 1 دقيقة

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('الأمان والخصوصية'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'إعدادات الأمان',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            _buildSecurityOption(
              icon: Icons.fingerprint,
              title: 'المصادقة البيومترية',
              subtitle: 'استخدم البصمة أو التعرف على الوجه لتسجيل الدخول',
              trailing: Switch(
                value: _biometricEnabled,
                onChanged: (value) => setState(() => _biometricEnabled = value),
              ),
            ),
            _buildSecurityOption(
              icon: Icons.lock_clock,
              title: 'القفل التلقائي',
              subtitle: 'قفل التطبيق تلقائياً بعد فترة من عدم الاستخدام',
              trailing: Switch(
                value: _autoLock,
                onChanged: (value) => setState(() => _autoLock = value),
              ),
            ),
            if (_autoLock)
              Padding(
                padding: const EdgeInsets.only(left: 60, top: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text('فترة القفل التلقائي'),
                    Slider(
                      value: _autoLockTime.toDouble(),
                      min: 1,
                      max: 10,
                      divisions: 9,
                      label: '$_autoLockTime دقائق',
                      onChanged: (value) => setState(() => _autoLockTime = value.toInt()),
                    ),
                  ],
                ),
              ),
            const SizedBox(height: 30),
            const Text(
              'الخصوصية',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            _buildSecurityOption(
              icon: Icons.history,
              title: 'تسجيل النشاط',
              subtitle: 'تسجيل تاريخ الدخول والأنشطة',
              trailing: Switch(
                value: _activityLogging,
                onChanged: (value) => setState(() => _activityLogging = value),
              ),
            ),
            _buildSecurityOption(
              icon: Icons.visibility_off,
              title: 'إخفاء المحتوى الحساس',
              subtitle: 'إخفاء تفاصيل الرسائل في الإشعارات',
              trailing: const Icon(Icons.arrow_forward_ios, size: 16),
              onTap: () {},
            ),
            const SizedBox(height: 30),
            const Text(
              'بيانات الحساب',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            _buildSecurityOption(
              icon: Icons.download,
              title: 'تنزيل بياناتك',
              subtitle: 'تنزيل نسخة من جميع بياناتك',
              trailing: const Icon(Icons.arrow_forward_ios, size: 16),
              onTap: () {},
            ),
            _buildSecurityOption(
              icon: Icons.delete,
              title: 'حذف الحساب',
              subtitle: 'حذف حسابك وبياناتك بشكل دائم',
              color: Colors.red,
              trailing: const Icon(Icons.arrow_forward_ios, size: 16),
              onTap: () {},
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSecurityOption({
    required IconData icon,
    required String title,
    required String subtitle,
    Widget? trailing,
    Color? color,
    VoidCallback? onTap,
  }) {
    return ListTile(
      leading: Icon(icon, color: color ?? Theme.of(context).primaryColor),
      title: Text(title, style: TextStyle(color: color)),
      subtitle: Text(subtitle),
      trailing: trailing,
      onTap: onTap,
      contentPadding: EdgeInsets.zero,
    );
  }
}