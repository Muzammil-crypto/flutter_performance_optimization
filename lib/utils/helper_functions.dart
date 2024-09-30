import 'package:flutter/material.dart';
import '../controllers/theme_controller.dart';

ThemeData getCurrentTheme(ThemeController themeController) {
  return themeController.isDarkMode.value
      ? themeController.darkTheme
      : themeController.lightTheme;
}

String? universalValidator(String? value, String fieldType) {
  if (value == null || value.isEmpty) {
    return 'Please enter your $fieldType';
  }

  switch (fieldType) {
    case 'email':
      const emailPattern =
          r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$';
      final regex = RegExp(emailPattern);
      if (!regex.hasMatch(value)) {
        return 'Please enter a valid email address';
      }
      break;

    case 'phone':
      const phonePattern = r'^\+?[0-9]{10,15}$'; // Adjust the pattern as needed
      final regexPhone = RegExp(phonePattern);
      if (!regexPhone.hasMatch(value)) {
        return 'Please enter a valid phone number';
      }
      break;

    case 'simple':
    // Allow only letters and numbers
      const simplePattern = r'^[a-zA-Z0-9]+$';
      final regexSimple = RegExp(simplePattern);
      if (!regexSimple.hasMatch(value)) {
        return 'Please use only letters and numbers';
      }
      break;

    case 'password':
    // Password must contain at least one uppercase letter, one lowercase letter, one special character, and be at least 8 characters long
      const passwordPattern =
          r'^(?=.*[A-Z])(?=.*[a-z])(?=.*\d)(?=.*[!@#\$%\^&\*])[A-Za-z\d!@#\$%\^&\*]{8,}$';
      final regexPassword = RegExp(passwordPattern);
      if (!regexPassword.hasMatch(value)) {
        return 'Password must be at least 8 characters long, '
            'include at least one uppercase letter, one lowercase letter, '
            'one number, and one special character';
      }
      break;

    default:
      return null; // No validation needed for other fields
  }

  return null; // Validation passed
}
