import 'package:deferred_comps/views/login_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/theme_controller.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _fadeInFadeOut;

  @override
  void initState() {
    super.initState();
    _controller =
        AnimationController(vsync: this, duration: const Duration(seconds: 3));
    _fadeInFadeOut = Tween<double>(begin: 0.0, end: 1.0).animate(_controller);
    _controller.forward();
    Future.delayed(const Duration(seconds: 4), () {
      Get.off(() => LoginPage());
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final themeController = Get.find<ThemeController>();

    return Scaffold(
      backgroundColor: themeController.isDarkMode.value
          ? themeController.darkTheme.scaffoldBackgroundColor
          : themeController.lightTheme.scaffoldBackgroundColor,
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  themeController.isDarkMode.value
                      ? themeController.darkTheme.primaryColor
                      : themeController.lightTheme.primaryColor,
                  themeController.isDarkMode.value
                      ? themeController.darkTheme.colorScheme.secondary
                      : themeController.lightTheme.colorScheme.secondary,
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
          ),
          // Center logo and animation
          Center(
            child: FadeTransition(
              opacity: _fadeInFadeOut,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // E-commerce App Logo or Icon
                  const Icon(
                    Icons.shopping_bag,
                    size: 100,
                    color: Colors.white,
                  ),
                  const SizedBox(height: 20),
                  const Text(
                    'ShopMate',
                    style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        letterSpacing: 2,
                        fontFamily: 'Jua'),
                  ),
                  const SizedBox(height: 20),
                  Text(
                    'Everything at your fingertips',
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.white.withOpacity(0.8),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
