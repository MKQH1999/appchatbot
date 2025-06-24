
import 'package:appchatbot/view/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
// import 'package:appchatbot/utils/constants.dart';

class AboutAppScreen extends StatelessWidget {
  const AboutAppScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // نقل الدوال المساعدة داخل build لتمكين الوصول إلى context
    Future<void> _launchEmail() async {
      final Uri emailLaunchUri = Uri(
        scheme: 'mailto',
        path: 'info@techcompany.com',
      );
      
      if (await canLaunchUrl(emailLaunchUri)) {
        await launchUrl(emailLaunchUri);
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('لا يمكن فتح تطبيق البريد')),
        );
      }
    }

    Future<void> _launchWebsite() async {
      final Uri url = Uri.parse('https://www.techcompany.com');
      
      if (await canLaunchUrl(url)) {
        await launchUrl(url);
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('لا يمكن فتح المتصفح')),
        );
      }
    }

    void _launchSocial(String platform) {
      String url = '';
      
      switch (platform) {
        case 'facebook':
          url = 'https://facebook.com/techcompany';
          break;
        case 'instagram':
          url = 'https://instagram.com/techcompany';
          break;
        case 'twitter':
          url = 'https://twitter.com/techcompany';
          break;
      }
      
      launchUrl(Uri.parse(url));
    }

    Widget _buildInfoCard({
      required String title,
      required String content,
      VoidCallback? onTap,
    }) {
      return Card(
        margin: const EdgeInsets.only(bottom: 16),
        child: ListTile(
          title: Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
          subtitle: Text(content),
          trailing: onTap != null ? const Icon(Icons.open_in_new) : null,
          onTap: onTap,
        ),
      );
    }

    Widget _buildSocialIcon(IconData icon, VoidCallback onTap) {
      return InkWell(
        onTap: onTap,
        child: Container(
          width: 50,
          height: 50,
          decoration: BoxDecoration(
            color: AppConstants.primaryColor.withOpacity(0.1),
            shape: BoxShape.circle,
          ),
          child: Icon(icon, color: AppConstants.primaryColor, size: 30),
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('عن التطبيق'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 20),
            Image.asset(
              'assets/images/app_icon.jpg',
              width: 120,
              height: 120,
            ),
            const SizedBox(height: 20),
            const Text(
              AppConstants.appName,
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            const Text(
              'الإصدار 1.0.0',
              style: TextStyle(fontSize: 16, color: Colors.grey),
            ),
            const SizedBox(height: 30),
            const Text(
              'تطبيق مساعد الدردشة الذكي هو تطبيق يتيح لك التواصل مع مساعد ذكي قادر على الإجابة على استفساراتك وتقديم المساعدة في مختلف المواضيع.',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 40),
            _buildInfoCard(
              title: 'المطور',
              content: 'شركة التقنية المتقدمة',
            ),
            _buildInfoCard(
              title: 'البريد الإلكتروني',
              content: 'info@techcompany.com',
              onTap: _launchEmail, // تم التصحيح هنا
            ),
            _buildInfoCard(
              title: 'الموقع الإلكتروني',
              content: 'www.techcompany.com',
              onTap: _launchWebsite, // تم التصحيح هنا
            ),
            const SizedBox(height: 30),
            const Text(
              'تابعنا على',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _buildSocialIcon(Icons.facebook, () => _launchSocial('facebook')),
                const SizedBox(width: 20),
                _buildSocialIcon(Icons.camera_alt, () => _launchSocial('instagram')),
                const SizedBox(width: 20),
                _buildSocialIcon(Icons.link, () => _launchSocial('twitter')),
              ],
            ),
            const SizedBox(height: 30),
            const Text(
              '© 2023 شركة التقنية المتقدمة. جميع الحقوق محفوظة.',
              style: TextStyle(color: Colors.grey),
            ),
          ],
        ),
      ),
    );
  }
}