import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mrowid/colors/color.dart';
import 'package:mrowid/typography/typography.dart';
import 'package:mrowid/screens/forgot_password_screen.dart';
import 'package:mrowid/screens/register_screen.dart';
import 'package:mrowid/widgets/custom_button.dart';
import 'package:mrowid/widgets/custom_input.dart';
import 'package:mrowid/controllers/sign_in_controller.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final SignInController controller = Get.put(SignInController());

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
                      'Login',
                      style: Font.bold.fs16.black2b(),
                    ),
                    Text(
                      'Welcome back, Please fill the form for sign in to your account',
                      style: Font.regular.fs12.gray94(),
                    ),
                    const SizedBox(height: 15),
                    Input(
                      label: 'Email',
                      hint: 'Enter your email',
                      controller: controller.emailController,
                      onChanged: (value) => controller.emailController.text = value,
                      keyboardType: TextInputType.emailAddress,
                    ),
                    const SizedBox(height: 15),
                    Input(
                      label: 'Password',
                      hint: 'Enter your password',
                      controller: controller.passwordController,
                      onChanged: (value) => controller.passwordController.text = value,
                      obscureText: true,
                    ),
                    const SizedBox(height: 15),
                    GestureDetector(
                      onTap: () => Get.to(() => ForgotPasswordScreen()),
                      child: Text(
                        'Forgot Password?',
                        style: Font.medium.fs12.gray94().copyWith(
                              decoration: TextDecoration.underline,
                            ),
                      ),
                    ),
                    const SizedBox(height: 15),
                    CustomButton(
                      text: 'Login',
                      onPressed: controller.login,
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