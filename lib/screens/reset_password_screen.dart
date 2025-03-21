import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mrowid/colors/color.dart';
import 'package:mrowid/typography/typography.dart';
import 'package:mrowid/screens/register_screen.dart';
import 'package:mrowid/widgets/custom_button.dart';
import 'package:mrowid/widgets/custom_input.dart';

class ResetPasswordScreen extends StatelessWidget {
  ResetPasswordScreen({super.key});

  final ResetPasswordController controller = Get.put(ResetPasswordController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteff,
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 40.52),
                    Center(
                      child: Image.asset(
                        'assets/icons/logo.png',
                        width: 126,
                        height: 126,
                      ),
                    ),
                    const SizedBox(height: 30.52),
                    Text(
                      'Reset Password',
                      style: Font.bold.fs16.black2b(),
                    ),
                    Text(
                      'Enter your new password',
                      style: Font.regular.fs12.gray94(),
                    ),
                    const SizedBox(height: 15),
                    Input(
                      label: 'New Password',
                      hint: 'Enter new password',
                      controller: controller.newPasswordController,
                      onChanged: (value) => controller.newPasswordController.text = value,
                      obscureText: true,
                    ),
                    const SizedBox(height: 15),
                    Input(
                      label: 'Confirm New Password',
                      hint: 'Confirm new password',
                      controller: controller.confirmPasswordController,
                      onChanged: (value) => controller.confirmPasswordController.text = value,
                      obscureText: true,
                    ),
                    const SizedBox(height: 15),
                    CustomButton(
                      text: 'Submit',
                      onPressed: () {
                        Get.snackbar(
                          'Success',
                          'Password reset successful',
                          backgroundColor: AppColors.black2b,
                          colorText: AppColors.whiteff,
                          duration: const Duration(seconds: 2),
                          icon: const Icon(Icons.check_circle, color: AppColors.whiteff),
                        );
                      },
                      backgroundColor: AppColors.black2b,
                      textStyle: Font.semiBold.fs18.whiteff(),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 25),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Don't have any account?",
                    style: Font.medium.fs12.gray94(),
                  ),
                  const SizedBox(width: 5),
                  GestureDetector(
                    onTap: () => Get.to(() => const RegisterScreen()),
                    child: Text(
                      'Sign Up!',
                      style: Font.bold.fs12.black2b(),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ResetPasswordController extends GetxController {
  final TextEditingController newPasswordController = TextEditingController();
  final TextEditingController confirmPasswordController = TextEditingController();
}