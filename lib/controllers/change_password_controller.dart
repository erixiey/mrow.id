import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:mrowid/colors/color.dart';

class ChangePasswordController extends GetxController {
  var currentPassword = ''.obs;
  var newPassword = ''.obs;
  var confirmPassword = ''.obs;

  void changePassword() {
    if (currentPassword.value.isEmpty ||
        newPassword.value.isEmpty ||
        confirmPassword.value.isEmpty) {
      Get.snackbar('Error', 'All fields are required');
    } else if (newPassword.value != confirmPassword.value) {
      Get.snackbar('Error', 'New password and confirmation do not match');
    } else {
      Get.back();
      Get.snackbar(
        'Success',
        'Password changed successfully',
        snackPosition: SnackPosition.TOP,
        backgroundColor: AppColors.black2b,
        colorText: AppColors.whiteff,
        duration: const Duration(seconds: 2),
        icon: const Icon(Icons.check_circle, color: AppColors.whiteff),
      );
    }
  }
}