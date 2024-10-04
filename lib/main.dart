import 'package:deferred_comps/utils/helper_functions.dart';
import 'package:deferred_comps/views/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'controllers/theme_controller.dart';

Future<void> main() async {
  // WidgetsFlutterBinding.ensureInitialized();
  // await initializeService();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final ThemeController themeController = Get.put(ThemeController());

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return GetMaterialApp(
        initialRoute: '/',
        getPages: getPages(),
        debugShowCheckedModeBanner: false,
        title: 'Deferred Components',
        theme: getCurrentTheme(themeController),
        home: const SplashScreen(),
      );
    });
  }

  List<GetPage<dynamic>>? getPages() {
    return [
      // GetPage(
      //   name: '/product_details',
      //   page: () => product_details.ProductDetailsPage(),
      // ),
    ];
  }
}
