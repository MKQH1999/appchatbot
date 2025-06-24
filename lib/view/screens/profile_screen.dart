// import 'package:flutter/material.dart';

// class ProfileScreen extends StatelessWidget {
//   const ProfileScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: SingleChildScrollView(
//         child: Column(
//           children: [
//             Container(
//               height: 220,
//               decoration: BoxDecoration(
//                 color: Colors.blue[800],
//                 borderRadius: const BorderRadius.only(
//                   bottomLeft: Radius.circular(30),
//                   bottomRight: Radius.circular(30),
//                 ),
//               ),
//               child: Stack(
//                 children: [
//                   Positioned(
//                     top: 40,
//                     left: 0,
//                     right: 0,
//                     child: Column(
//                       children: [
//                         const CircleAvatar(
//                           radius: 60,
//                           backgroundImage:
//                               AssetImage('assets/images/profile.png'),
//                         ),
//                         const SizedBox(height: 15),
//                         const Text(
//                           'أحمد محمد',
//                           style: TextStyle(
//                             color: Colors.white,
//                             fontSize: 24,
//                             fontWeight: FontWeight.bold,
//                           ),
//                         ),
//                         const SizedBox(height: 5),
//                         Text(
//                           'ahmed@example.com',
//                           style: TextStyle(
//                             color: Colors.white.withOpacity(0.8),
//                             fontSize: 16,
//                           ),
//                         ),
//                         const SizedBox(height: 10),
//                         ElevatedButton(
//                           style: ElevatedButton.styleFrom(
//                             backgroundColor: Colors.white,
//                             foregroundColor: Colors.blue[800],
//                             shape: RoundedRectangleBorder(
//                               borderRadius: BorderRadius.circular(20),
//                             ),
//                           ),
//                           onPressed: () {},
//                           child: const Text('تعديل الملف الشخصي'),
//                         ),
//                       ],
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//             Padding(
//               padding: const EdgeInsets.all(20.0),
//               child: Column(
//                 children: [
//                   _buildProfileOption(
//                     icon: Icons.person,
//                     title: 'معلومات الحساب',
//                     onTap: () {},
//                   ),
//                   _buildProfileOption(
//                     icon: Icons.security,
//                     title: 'الأمان والخصوصية',
//                     onTap: () {},
//                   ),
//                   _buildProfileOption(
//                     icon: Icons.notifications,
//                     title: 'الإشعارات',
//                     onTap: () {},
//                   ),
//                   _buildProfileOption(
//                     icon: Icons.language,
//                     title: 'اللغة',
//                     trailing: const Text('العربية'),
//                     onTap: () {},
//                   ),
//                   _buildProfileOption(
//                     icon: Icons.dark_mode,
//                     title: 'الوضع الليلي',
//                     trailing: Switch(value: false, onChanged: (val) {}),
//                     onTap: () {},
//                   ),
//                   _buildProfileOption(
//                     icon: Icons.help,
//                     title: 'المساعدة والدعم',
//                     onTap: () {
//                       Navigator.pop(context);
//                       Navigator.pushNamed(context, '/help_support');
//                     },
//                   ),
//                   _buildProfileOption(
//                     icon: Icons.info,
//                     title: 'عن التطبيق',
//                     onTap: () {
//                       Navigator.pop(context);
//                       Navigator.pushNamed(context, '/about');
//                     },
//                   ),
//                   const SizedBox(height: 20),
//                   SizedBox(
//                     width: double.infinity,
//                     child: ElevatedButton.icon(
//                       icon: const Icon(Icons.exit_to_app),
//                       label: const Text('تسجيل الخروج'),
//                       style: ElevatedButton.styleFrom(
//                         backgroundColor: Colors.red[50],
//                         foregroundColor: Colors.red,
//                         padding: const EdgeInsets.symmetric(vertical: 15),
//                         shape: RoundedRectangleBorder(
//                           borderRadius: BorderRadius.circular(12),
//                         ),
//                       ),
//                       onPressed: () {
//                         Navigator.pushReplacementNamed(context, '/login');
//                       },
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   Widget _buildProfileOption({
//     required IconData icon,
//     required String title,
//     Widget? trailing,
//     required VoidCallback onTap,
//   }) {
//     return ListTile(
//       leading: Icon(icon, color: Colors.blue[800]),
//       title: Text(title, style: const TextStyle(fontSize: 16)),
//       trailing: trailing ?? const Icon(Icons.arrow_forward_ios, size: 16),
//       onTap: onTap,
//       contentPadding: const EdgeInsets.symmetric(vertical: 8),
//     );
//   }
// }


import 'package:appchatbot/view/providers/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:appchatbot/view/screens/account_info_screen.dart';
import 'package:appchatbot/view/screens/language_selection_screen.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<ThemeProvider>(
        builder: (context, themeProvider, child) {
          return SingleChildScrollView(
            child: Column(
              children: [
                // رأس البروفايل
                Container(
                  height: 220,
                  decoration: BoxDecoration(
                    color: Theme.of(context).primaryColor,
                    borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(30),
                      bottomRight: Radius.circular(30),
                    ),
                  ),
                  child: Stack(
                    children: [
                      Positioned(
                        top: 40,
                        left: 0,
                        right: 0,
                        child: Column(
                          children: [
                            const CircleAvatar(
                              radius: 60,
                              backgroundImage: AssetImage('assets/images/profile.jpg'),
                            ),
                            const SizedBox(height: 15),
                            const Text(
                              'أحمد محمد',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 5),
                            Text(
                              'ahmed@example.com',
                              style: TextStyle(
                                color: Colors.white.withOpacity(0.8),
                                fontSize: 16,
                              ),
                            ),
                            const SizedBox(height: 10),
                            ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.white,
                                foregroundColor: Theme.of(context).primaryColor,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20),
                                ),
                              ),
                              onPressed: () {},
                              child: const Text('تعديل الملف الشخصي'),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                
                // خيارات البروفايل
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    children: [
                      _buildProfileOption(
                        context,
                        icon: Icons.person,
                        title: 'معلومات الحساب',
                        onTap: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const AccountInfoScreen(),
                          ),
                        ),
                      ),
                      _buildProfileOption(
                        context,
                        icon: Icons.security,
                        title: 'الأمان والخصوصية',
                        onTap: () {},
                      ),
                      _buildProfileOption(
                        context,
                        icon: Icons.notifications,
                        title: 'الإشعارات',
                        onTap: () {},
                      ),
                      _buildProfileOption(
                        context,
                        icon: Icons.language,
                        title: 'اللغة',
                        trailing: Text(themeProvider.language),
                        onTap: () => _changeLanguage(context, themeProvider),
                      ),
                      _buildProfileOption(
                        context,
                        icon: Icons.dark_mode,
                        title: 'الوضع الليلي',
                        trailing: Switch(
                          value: themeProvider.isDarkMode,
                          onChanged: (value) => themeProvider.toggleTheme(value),
                        ),
                        onTap: () => themeProvider.toggleTheme(!themeProvider.isDarkMode),
                      ),
                      const SizedBox(height: 20),
                      _buildProfileOption(
                        context,
                        icon: Icons.help,
                        title: 'المساعدة والدعم',
                        onTap: () {},
                      ),
                      _buildProfileOption(
                        context,
                        icon: Icons.info,
                        title: 'عن التطبيق',
                        onTap: () {},
                      ),
                      const SizedBox(height: 20),
                      _buildLogoutButton(context),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _buildProfileOption(
    BuildContext context, {
    required IconData icon,
    required String title,
    Widget? trailing,
    required VoidCallback onTap,
  }) {
    return ListTile(
      leading: Icon(icon, color: Theme.of(context).primaryColor),
      title: Text(title, style: const TextStyle(fontSize: 16)),
      trailing: trailing ?? const Icon(Icons.arrow_forward_ios, size: 16),
      onTap: onTap,
      contentPadding: const EdgeInsets.symmetric(vertical: 8),
    );
  }

  Widget _buildLogoutButton(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton.icon(
        icon: const Icon(Icons.exit_to_app),
        label: const Text('تسجيل الخروج'),
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.red[50],
          foregroundColor: Colors.red,
          padding: const EdgeInsets.symmetric(vertical: 15),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
        onPressed: () {
          Navigator.pushReplacementNamed(context, '/login');
        },
      ),
    );
  }

  void _changeLanguage(BuildContext context, ThemeProvider themeProvider) async {
    final result = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const LanguageSelectionScreen(),
      ),
    );
    
    if (result != null) {
      themeProvider.setLanguage(result);
    }
  }
}