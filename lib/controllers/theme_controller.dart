import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ThemeController extends GetxController {
  var isDarkMode = false.obs;
  void toggleTheme() {
    isDarkMode.value = !isDarkMode.value;
    Get.changeTheme(isDarkMode.value ? darkTheme : lightTheme);
    update();
  }

  ThemeData get lightTheme => ThemeData(
        brightness: Brightness.light,
        primaryColor: const Color(0xff673351),
        scaffoldBackgroundColor: const Color(0xffeae9fc),
        hintColor: const Color(0xffabaad5),
        textTheme: textTheme,
        fontFamily: 'Jua',
        colorScheme: const ColorScheme(
            background: Color(0xffeae9fc),
            brightness: Brightness.light,
            error: Color(0xffbb7584),
            onBackground: Color(0xff010104),
            onError: Color(0xff010104),
            onPrimary: Color(0xff010104),
            onSecondary: Color(0xff010104),
            onSurface: Color(0xff010104),
            primary: Color(0xffabaad5),
            secondary: Color(0xffbb7584),
            surface: Color(0xffeae9fc)),
      );

  ThemeData get darkTheme => ThemeData(
        brightness: Brightness.dark,
        primaryColor: const Color(0xffabaad5),
        scaffoldBackgroundColor: const Color(0xff010104),
        hintColor: const Color(0xffbb7584),
        textTheme: textTheme,
        fontFamily: 'Jua',
        colorScheme: const ColorScheme(
            background: Color(0xff010104),
            brightness: Brightness.dark,
            error: Color(0xffbb7584),
            onBackground: Color(0xffeae9fc),
            onError: Color(0xffeae9fc),
            onPrimary: Color(0xffeae9fc),
            onSecondary: Color(0xffeae9fc),
            onSurface: Color(0xffeae9fc),
            primary: Color(0xffabaad5),
            secondary: Color(0xffbb7584),
            surface: Color(0xff010104)),
      );

  TextTheme get textTheme => const TextTheme(
        bodyLarge: TextStyle(fontSize: 16, fontWeight: FontWeight.normal),
        bodyMedium: TextStyle(fontSize: 14, fontWeight: FontWeight.normal),
        displayLarge: TextStyle(fontSize: 48, fontWeight: FontWeight.bold),
        displayMedium: TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
        displaySmall: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
      );
}
