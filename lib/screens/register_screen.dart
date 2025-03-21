import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mrowid/colors/color.dart';
import 'package:mrowid/typography/typography.dart';
import 'package:showcaseview/showcaseview.dart';
import 'package:mrowid/controllers/register_controller.dart';
import 'package:mrowid/widgets/custom_button.dart';
import 'package:mrowid/widgets/custom_input.dart';
import 'package:mrowid/widgets/custom_phone_input.dart';
import 'package:mrowid/widgets/guide_bottom_sheet.dart';
import 'package:mrowid/widgets/custom_showcase.dart';
import 'package:mrowid/utils/global_key_provider.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  late final RegisterController controller;
  BuildContext? _showcaseContext;
  bool _isShowcaseActive = false;

  @override
  void initState() {
    super.initState();
    controller = Get.put(RegisterController());
  }

  void _startShowcase() {
    if (_showcaseContext == null) {
      print('Showcase context is null, cannot start showcase');
      return;
    }
    setState(() {
      _isShowcaseActive = true;
    });
    print('Starting Showcase in RegisterScreen');
    ShowCaseWidget.of(_showcaseContext!).startShowCase([
      GlobalKeyProvider.fullNameKey,
      GlobalKeyProvider.emailKey,
      GlobalKeyProvider.phoneKey,
      GlobalKeyProvider.passwordKey,
      GlobalKeyProvider.confirmPasswordKey,
      GlobalKeyProvider.continueKey,
    ]);
  }

  @override
  Widget build(BuildContext context) {
    return ShowCaseWidget(
      builder: (context) {
        _showcaseContext = context;
        return Scaffold(
          backgroundColor: AppColors.whiteff,
          body: SafeArea(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 15, right: 0),
                        child: GestureDetector(
                          onTap: () {
                            print('Opening Guide Bottom Sheet');
                            GuideBottomSheet.show(
                              context,
                              onComplete: () {
                                print('Guide completed, starting showcase');
                                WidgetsBinding.instance.addPostFrameCallback((_) {
                                  _startShowcase();
                                });
                              },
                            );
                          },
                          child: Container(
                            width: 76,
                            height: 30,
                            decoration: BoxDecoration(
                              color: AppColors.grayf6,
                              borderRadius: BorderRadius.circular(8.57),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Image.asset('assets/icons/guide.png', width: 16),
                                const SizedBox(width: 5),
                                Text(
                                  'Guide',
                                  style: Font.semiBold.fs12.black2b(),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Center(
                    child: Image.asset(
                      'assets/icons/logo.png',
                      width: 126,
                      height: 126,
                    ),
                  ),
                  const SizedBox(height: 20),
                  Text(
                    'Sign Up',
                    style: Font.bold.fs16.black2b(),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    'Register to create your account',
                    style: Font.regular.fs12.gray94(),
                  ),
                  const SizedBox(height: 15),
                  CustomShowcase(
                    showcaseKey: GlobalKeyProvider.fullNameKey,
                    title: 'Enter your full name',
                    child: Input(
                      label: 'Full Name',
                      hint: 'Enter your full name',
                      controller: controller.fullNameController,
                      onChanged: (value) => controller.fullNameController.text = value,
                    ),
                  ),
                  const SizedBox(height: 15),
                  CustomShowcase(
                    showcaseKey: GlobalKeyProvider.emailKey,
                    title: 'Enter your email',
                    child: Input(
                      label: 'Email',
                      hint: 'Enter your email',
                      controller: controller.emailController,
                      onChanged: (value) => controller.emailController.text = value,
                      keyboardType: TextInputType.emailAddress,
                    ),
                  ),
                  const SizedBox(height: 15),
                  CustomShowcase(
                    showcaseKey: GlobalKeyProvider.phoneKey,
                    title: 'Enter your phone number',
                    child: CustomPhoneInput(
                      countryCode: controller.countryCode,
                      updateCountryCode: (code) => controller.countryCode.value = code,
                      label: 'Phone Number',
                      hint: 'Enter your phone number',
                      onChanged: (value) => controller.phoneController.text = value,
                      phoneController: controller.phoneController,
                    ),
                  ),
                  const SizedBox(height: 15),
                  CustomShowcase(
                    showcaseKey: GlobalKeyProvider.passwordKey,
                    title: 'Enter your password',
                    child: Input(
                      label: 'Password',
                      hint: 'Enter your password',
                      controller: controller.passwordController,
                      onChanged: (value) => controller.passwordController.text = value,
                      obscureText: true,
                    ),
                  ),
                  const SizedBox(height: 15),
                  CustomShowcase(
                    showcaseKey: GlobalKeyProvider.confirmPasswordKey,
                    title: 'Confirm your password',
                    child: Input(
                      label: 'Confirm Password',
                      hint: 'Confirm your password',
                      controller: controller.confirmPasswordController,
                      onChanged: (value) => controller.confirmPasswordController.text = value,
                      obscureText: true,
                    ),
                  ),
                  const SizedBox(height: 20),
                  CustomShowcase(
                    showcaseKey: GlobalKeyProvider.continueKey,
                    title: 'Tap button Continue to next step',
                    onNext: () {
                      ShowCaseWidget.of(context).next();
                    },
                    child: CustomButton(
                      text: 'Continue',
                      onPressed: () {
                        FocusScope.of(context).unfocus();
                        if (!_isShowcaseActive) {
                          controller.onContinue();
                        }
                      },
                      backgroundColor: AppColors.black2b,
                      textStyle: Font.semiBold.fs18.whiteff(),
                    ),
                  ),
                  const SizedBox(height: 34),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Already have an account?',
                        style: Font.medium.fs12.gray94(),
                      ),
                      const SizedBox(width: 5),
                      GestureDetector(
                        onTap: () => Get.back(),
                        child: Text(
                          'Sign In!',
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
      },
    );
  }
}