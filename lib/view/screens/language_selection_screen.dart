import 'package:flutter/material.dart';

class LanguageSelectionScreen extends StatefulWidget {
  const LanguageSelectionScreen({super.key});

  @override
  State<LanguageSelectionScreen> createState() => _LanguageSelectionScreenState();
}

class _LanguageSelectionScreenState extends State<LanguageSelectionScreen> {
  String _selectedLanguage = 'العربية';

  final List<Map<String, String>> _languages = [
    {'name': 'العربية', 'code': 'ar', 'flag': '🇸🇦'},
    {'name': 'English', 'code': 'en', 'flag': '🇺🇸'},
    {'name': 'Français', 'code': 'fr', 'flag': '🇫🇷'},
    {'name': 'Español', 'code': 'es', 'flag': '🇪🇸'},
    {'name': 'Deutsch', 'code': 'de', 'flag': '🇩🇪'},
    {'name': '中文', 'code': 'zh', 'flag': '🇨🇳'},
    {'name': '日本語', 'code': 'ja', 'flag': '🇯🇵'},
    {'name': 'Русский', 'code': 'ru', 'flag': '🇷🇺'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('اختر اللغة'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context, _selectedLanguage),
            child: const Text('حفظ', style: TextStyle(fontSize: 16)),
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: _languages.length,
        itemBuilder: (context, index) {
          final language = _languages[index];
          return ListTile(
            leading: Text(language['flag']!, style: const TextStyle(fontSize: 24)),
            title: Text(language['name']!),
            trailing: _selectedLanguage == language['name']
                ? const Icon(Icons.check, color: Colors.green)
                : null,
            onTap: () {
              setState(() {
                _selectedLanguage = language['name']!;
              });
            },
          );
        },
      ),
    );
  }
}