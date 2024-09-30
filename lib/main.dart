import 'package:deferred_comps/utils/helper_functions.dart';
import 'package:deferred_comps/views/login_page.dart';
import 'package:deferred_comps/views/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'controllers/theme_controller.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final ThemeController themeController = Get.put(ThemeController());

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return GetMaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Deferred Components',
        theme: getCurrentTheme(themeController),
        home: SplashScreen(),
      );
    });
  }
}
