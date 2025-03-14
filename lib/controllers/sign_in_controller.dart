import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../screens/main_menu.dart';

class SignInController extends GetxController {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  void login() {
    // Validasi login
    if (emailController.text.isNotEmpty && passwordController.text.isNotEmpty) {
      Get.offAll(() => MainMenu()); 
      Get.snackbar('Success', 'Login successful',
          backgroundColor: Colors.green, colorText: Colors.white);
    } else {
      Get.snackbar('Error', 'Please fill all fields',
          backgroundColor: Colors.red, colorText: Colors.white);
    }
  }

  @override
  void onClose() {
    emailController.dispose();
    passwordController.dispose();
    super.onClose();
  }
}