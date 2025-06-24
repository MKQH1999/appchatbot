import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_animate/flutter_animate.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 3), () {
      Navigator.pushReplacementNamed(context, '/login');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[800],
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Hero(
              tag: 'app-logo',
              child: SvgPicture.asset(
                'assets/svgs/chatbot.svg',
                width: 120,
                color: Colors.white,
              )
              .animate()
              .fadeIn(duration: 500.ms)
              .scale(begin: const Offset(0.8, 0.8), 
            ),),
            const SizedBox(height: 20),
            const Text(
              'مساعدك الذكي',
              style: TextStyle(
                color: Colors.white,
                fontSize: 28,
                fontWeight: FontWeight.bold,
                fontFamily: 'Cairo',
              ),
            )
            .animate()
            .fadeIn(delay: 300.ms)
            .slideY(begin: 0.5),
            const SizedBox(height: 10),
            const Text(
              'تجربة محادثة تفاعلية مع الذكاء الاصطناعي',
              style: TextStyle(
                color: Colors.white70, 
                fontSize: 16,
                fontFamily: 'Cairo',
              ),
            )
            .animate()
            .fadeIn(delay: 600.ms),
          ],
        ),
      ),
    );
  }
}