import 'package:deferred_comps/app_colors/app_colors.dart';
import 'package:deferred_comps/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../widgets/custom_primary_button.dart';
import 'home_page.dart';

class LoginPage extends StatelessWidget {
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Login",
          style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 24,
              letterSpacing: 1.2),
        ),
        backgroundColor: primaryColor,
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(height: Get.height * 0.1),
                Text(
                  "Welcome to the App",
                  style: TextStyle(
                    color: primaryColor,
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const Text(
                  "Please login to continue",
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 16,
                  ),
                ),
                SizedBox(height: Get.height * 0.1),
                CustomTextField(
                    label: "Username",
                    hintText: "Zack Knight",
                    controller: usernameController,
                    fieldType: 'simple'),
                const SizedBox(height: 16),
                CustomTextField(
                    label: "Password",
                    hintText: "********",
                    controller: passwordController,
                    obscureText: true,
                    fieldType: 'password'),
                SizedBox(height: Get.height * 0.1),
                CustomPrimaryButton(
                  color: primaryColor,
                  textColor: Colors.white,
                  borderRadius: 12.0,
                  elevation: 4.0,
                  text: "Login",
                  onPressed: () {
                    if (formKey.currentState!.validate()) {
                      Get.off(() => ProductPage());
                    }
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
