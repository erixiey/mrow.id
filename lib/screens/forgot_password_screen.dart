import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mrowid/typography/typography.dart';
import 'package:mrowid/screens/register_screen.dart';
import 'package:mrowid/screens/reset_password_screen.dart';
import 'package:mrowid/widgets/custom_button.dart';
import 'package:mrowid/widgets/text_field_template.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({super.key});

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  final ForgotPasswordController controller = Get.put(ForgotPasswordController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
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
                      'Forgot Password',
                      style: Font.bold.fs16.black2b(),
                    ),
                    Text(
                      'Enter email, we will send a password reset link to your email',
                      style: Font.regular.fs12.gray94(),
                    ),
                    const SizedBox(height: 15),
                    TextFieldTemplate(
                      label: 'Email',
                      controller: controller.emailController,
                      onChanged: (value) => controller.emailController.text = value,
                    ),
                    const SizedBox(height: 15),
                    CustomButton(
                      text: 'Send Link',
                      onPressed: () => Get.to(() => ResetPasswordScreen()),
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

class ForgotPasswordController extends GetxController {
  final TextEditingController emailController = TextEditingController();
}