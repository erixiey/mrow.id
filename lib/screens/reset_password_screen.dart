import 'package:flutter/material.dart';
import 'package:get/Get.dart';
import 'package:mrowid/typography/typography.dart';
import 'package:mrowid/screens/register_screen.dart';
import 'package:mrowid/widgets/custom_button.dart';
import 'package:mrowid/widgets/text_field_template.dart';

class ResetPasswordScreen extends StatelessWidget {

  ResetPasswordScreen({super.key});

  final ResetPasswordController controller = Get.put(ResetPasswordController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 25),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
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
              TextFieldTemplate(
                label: 'New Password',
                controller: controller.newPasswordController,
                onChanged: (value) => controller.newPasswordController.text = value,
                isPassword: true,
              ),
              const SizedBox(height: 15),
              TextFieldTemplate(
                label: 'Confirm New Password',
                controller: controller.confirmPasswordController,
                onChanged: (value) => controller.confirmPasswordController.text = value,
                isPassword: true,
                isConfirm: true,
              ),
              const SizedBox(height: 15),
              CustomButton(
                text: 'Submit',
                onPressed: () {
                  Get.snackbar('Success', 'Password reset successful',
                      backgroundColor: Colors.green, colorText: Colors.white);
                },
              ),
              const SizedBox(height: 25),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Don't have any account?",
                    style: Font.medium.fs12.gray94(),
                  ),
                  const SizedBox(width: 5),
                  GestureDetector(
                    onTap: () => Get.to(() => RegisterScreen()),
                    child: Text(
                      'Sign Up!',
                      style: Font.bold.fs12.black2b(),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ResetPasswordController extends GetxController {
  final TextEditingController newPasswordController = TextEditingController();
  final TextEditingController confirmPasswordController = TextEditingController();
}