import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mrowid/screens/sign_in_screen.dart';
import 'package:mrowid/colors/color.dart';

void showLogoutDialog(BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text(
          'Log Out',
          style: TextStyle(
            fontFamily: 'Gilroy',
            fontSize: 18,
            fontWeight: FontWeight.w600,
            color: AppColors.black2b,
          ),
        ),
        content: Text(
          'Are you sure you want to log out?',
          style: TextStyle(
            fontFamily: 'Gilroy',
            fontSize: 14,
            fontWeight: FontWeight.w400,
            color: AppColors.black2b,
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Get.back(),
            child: Text(
              'Cancel',
              style: TextStyle(
                fontFamily: 'Gilroy',
                fontSize: 14,
                fontWeight: FontWeight.w500,
                color: AppColors.gray94,
              ),
            ),
          ),
          TextButton(
            onPressed: () {
              Get.back();
              Get.snackbar(
                'Success',
                'You have successfully logged out',
                snackPosition: SnackPosition.TOP,
                backgroundColor: AppColors.black2b,
                colorText: AppColors.whiteff,
                duration: const Duration(seconds: 2),
                icon: const Icon(Icons.check_circle, color: AppColors.whiteff),
              );
              Future.delayed(const Duration(seconds: 2), () {
                Get.offAll(() => const SignInScreen());
              });
            },
            child: Text(
              'Log Out',
              style: TextStyle(
                fontFamily: 'Gilroy',
                fontSize: 14,
                fontWeight: FontWeight.w500,
                color: AppColors.black2b,
              ),
            ),
          ),
        ],
      );
    },
  );
}