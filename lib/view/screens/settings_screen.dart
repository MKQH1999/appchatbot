import 'package:appchatbot/view/utils/constants.dart';
import 'package:flutter/material.dart';


class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  bool _darkMode = false;
  bool _notificationsEnabled = true;
  bool _soundEffects = true;
  String _selectedLanguage = 'العربية';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('الإعدادات'),
      ),
      body: ListView(
        children: [
          _buildSectionHeader('عام'),
          _buildSettingItem(
            icon: Icons.dark_mode,
            title: 'الوضع الليلي',
            trailing: Switch(
              value: _darkMode,
              onChanged: (value) {
                setState(() {
                  _darkMode = value;
                });
                // يمكنك هنا تغيير سمة التطبيق
              },
            ),
          ),
          _buildSettingItem(
            icon: Icons.language,
            title: 'اللغة',
            subtitle: _selectedLanguage,
            onTap: () => _showLanguageDialog(),
          ),
          _buildSectionHeader('الإشعارات'),
          _buildSettingItem(
            icon: Icons.notifications,
            title: 'الإشعارات',
            trailing: Switch(
              value: _notificationsEnabled,
              onChanged: (value) => setState(() => _notificationsEnabled = value),
            ),
          ),
          _buildSettingItem(
            icon: Icons.volume_up,
            title: 'أصوات التنبيهات',
            trailing: Switch(
              value: _soundEffects,
              onChanged: (value) => setState(() => _soundEffects = value),
            ),
          ),
          _buildSectionHeader('حساب المستخدم'),
          _buildSettingItem(
            icon: Icons.lock,
            title: 'تغيير كلمة المرور',
            onTap: () => _navigateToChangePassword(),
          ),
          _buildSettingItem(
            icon: Icons.delete,
            title: 'حذف الحساب',
            color: Colors.red,
            onTap: () => _showDeleteAccountDialog(),
          ),
          _buildSectionHeader('حول التطبيق'),
          _buildSettingItem(
            icon: Icons.info,
            title: 'عن التطبيق',
            onTap: () => Navigator.pushNamed(context, '/about'),
          ),
          _buildSettingItem(
            icon: Icons.update,
            title: 'التحديثات',
            subtitle: 'الإصدار 1.0.0',
          ),
          const SizedBox(height: 20),
          _buildResetButton(),
        ],
      ),
    );
  }

  Widget _buildSectionHeader(String title) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 20, 16, 8),
      child: Text(
        title,
        style: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.bold,
          color: AppConstants.primaryColor,
        ),
      ),
    );
  }

  Widget _buildSettingItem({
    required IconData icon,
    required String title,
    String? subtitle,
    Widget? trailing,
    Color? color,
    VoidCallback? onTap,
  }) {
    return ListTile(
      leading: Icon(icon, color: color ?? AppConstants.primaryColor),
      title: Text(title, style: TextStyle(color: color)),
      subtitle: subtitle != null ? Text(subtitle) : null,
      trailing: trailing,
      onTap: onTap,
    );
  }

  Widget _buildResetButton() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.grey[200],
          foregroundColor: Colors.black,
          padding: const EdgeInsets.symmetric(vertical: 16),
        ),
        onPressed: _resetSettings,
        child: const Text('إعادة التعيين إلى الإعدادات الافتراضية'),
      ),
    );
  }

  void _resetSettings() {
    setState(() {
      _darkMode = false;
      _notificationsEnabled = true;
      _soundEffects = true;
    });
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('تم استعادة الإعدادات الافتراضية')),
    );
  }

  void _showLanguageDialog() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('اختر اللغة'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            _buildLanguageOption('العربية', 'ar'),
            _buildLanguageOption('English', 'en'),
            _buildLanguageOption('Français', 'fr'),
          ],
        ),
      ),
    );
  }

  Widget _buildLanguageOption(String language, String code) {
    return ListTile(
      title: Text(language),
      trailing: _selectedLanguage == language
          ? const Icon(Icons.check, color: AppConstants.primaryColor)
          : null,
      onTap: () {
        setState(() => _selectedLanguage = language);
        Navigator.pop(context);
        // يمكنك هنا تغيير لغة التطبيق
      },
    );
  }

  void _navigateToChangePassword() {
    // يمكنك الانتقال إلى صفحة تغيير كلمة المرور
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('سيتم فتح صفحة تغيير كلمة المرور')),
    );
  }

  void _showDeleteAccountDialog() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('حذف الحساب'),
        content: const Text('هل أنت متأكد أنك تريد حذف حسابك بشكل دائم؟ سيتم فقدان جميع بياناتك.'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('إلغاء'),
          ),
          TextButton(
            onPressed: () {
              Navigator.pop(context);
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('تم حذف الحساب بنجاح')),
              );
              // يمكنك هنا تنفيذ عملية حذف الحساب
            },
            child: const Text('حذف', style: TextStyle(color: Colors.red)),
          ),
        ],
      ),
    );
  }
}