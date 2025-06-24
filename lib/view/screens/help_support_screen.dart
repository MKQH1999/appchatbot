import 'package:appchatbot/view/utils/constants.dart';
import 'package:flutter/material.dart';

class HelpSupportScreen extends StatefulWidget {
  const HelpSupportScreen({super.key});

  @override
  State<HelpSupportScreen> createState() => _HelpSupportScreenState();
}

class _HelpSupportScreenState extends State<HelpSupportScreen> {
  final List<FAQItem> _faqs = [
    FAQItem(
      question: 'كيف يمكنني تغيير اللغة؟',
      answer: 'يمكنك تغيير اللغة من خلال الإعدادات > اللغة ثم اختيار اللغة المطلوبة.',
    ),
    FAQItem(
      question: 'كيف يمكنني استعادة كلمة المرور؟',
      answer: 'في صفحة تسجيل الدخول، اضغط على "نسيت كلمة المرور" واتبع التعليمات.',
    ),
    FAQItem(
      question: 'كيف يمكنني حذف حسابي؟',
      answer: 'يمكنك حذف حسابك من الإعدادات > حذف الحساب.',
    ),
    FAQItem(
      question: 'هل التطبيق مجاني؟',
      answer: 'نعم، التطبيق مجاني بالكامل ولا يوجد به أي عمليات شراء داخل التطبيق.',
    ),
  ];

  bool _contactExpanded = false;
  final TextEditingController _messageController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('المساعدة والدعم'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'الأسئلة الشائعة',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            ..._faqs.map((faq) => _buildFAQItem(faq)).toList(),
            const SizedBox(height: 24),
            const Text(
              'اتصل بنا',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            ExpansionTile(
              title: const Text('أرسل رسالة إلى الدعم الفني'),
              trailing: Icon(
                _contactExpanded ? Icons.expand_less : Icons.expand_more,
              ),
              onExpansionChanged: (expanded) {
                setState(() => _contactExpanded = expanded);
              },
              children: [
                Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    children: [
                      TextField(
                        controller: _messageController,
                        maxLines: 5,
                        decoration: const InputDecoration(
                          hintText: 'اكتب رسالتك هنا...',
                          border: OutlineInputBorder(),
                        ),
                      ),
                      const SizedBox(height: 16),
                      Row(
                        children: [
                          Expanded(
                            child: ElevatedButton(
                              onPressed: _sendMessage,
                              child: const Text('إرسال الرسالة'),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 24),
            const Text(
              'طرق التواصل الأخرى',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            _buildContactMethod(
              icon: Icons.email,
              title: 'البريد الإلكتروني',
              subtitle: 'support@chatbotapp.com',
            ),
            _buildContactMethod(
              icon: Icons.phone,
              title: 'الهاتف',
              subtitle: '+966 123 456 789',
            ),
            _buildContactMethod(
              icon: Icons.language,
              title: 'الموقع الإلكتروني',
              subtitle: 'www.chatbotapp.com/support',
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildFAQItem(FAQItem faq) {
    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      child: ExpansionTile(
        title: Text(faq.question, style: const TextStyle(fontWeight: FontWeight.bold)),
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
            child: Text(faq.answer),
          ),
        ],
      ),
    );
  }

  Widget _buildContactMethod({
    required IconData icon,
    required String title,
    required String subtitle,
  }) {
    return ListTile(
      leading: Icon(icon, color: AppConstants.primaryColor),
      title: Text(title),
      subtitle: Text(subtitle),
      onTap: () => _openContactMethod(title),
    );
  }

  void _sendMessage() {
    if (_messageController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('الرجاء كتابة رسالة')),
      );
      return;
    }

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('تم إرسال رسالتك بنجاح')),
    );
    _messageController.clear();
    setState(() => _contactExpanded = false);
  }

  void _openContactMethod(String method) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('فتح $method'),
        content: Text('سيتم فتح تطبيق $method للتواصل مع الدعم الفني.'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('إلغاء'),
          ),
          TextButton(
            onPressed: () {
              Navigator.pop(context);
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('فتح $method...')),
              );
            },
            child: const Text('فتح'),
          ),
        ],
      ),
    );
  }
}

class FAQItem {
  final String question;
  final String answer;

  FAQItem({required this.question, required this.answer});
}