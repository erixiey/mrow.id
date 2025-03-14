import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mrowid/colors/color.dart';
import 'package:mrowid/typography/typography.dart';
import 'package:showcaseview/showcaseview.dart';
import '../controllers/register_controller.dart';
import '../widgets/custom_button.dart';
import '../widgets/custom_input.dart';
import '../widgets/text_field_template.dart';
import '../widgets/guide_bottom_sheet.dart';
import '../widgets/custom_showcase.dart';
import '../utils/global_key_provider.dart';

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
          backgroundColor: Colors.white,
          appBar: AppBar(
            backgroundColor: Colors.white,
            elevation: 0,
            actions: [
              Padding(
                padding: const EdgeInsets.only(right: 25),
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
                      color: const Color(0xFFFAF6F6),
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
                  const SizedBox(height: 20),
                  Text(
                    'Sign Up',
                    style: Font.bold.fs16.black2b(),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    'Register to create your account',
                    style: Font.medium.fs12.gray94(),
                  ),
                  const SizedBox(height: 15),
                  CustomShowcase(
                    showcaseKey: GlobalKeyProvider.fullNameKey,
                    title: 'Enter your full name',
                    child: TextFieldTemplate(
                      label: 'Full Name',
                      controller: controller.fullNameController,
                      onChanged: (value) => controller.fullNameController.text = value,
                    ),
                  ),
                  const SizedBox(height: 15),
                  CustomShowcase(
                    showcaseKey: GlobalKeyProvider.emailKey,
                    title: 'Enter your email',
                    child: TextFieldTemplate(
                      label: 'Email',
                      controller: controller.emailController,
                      onChanged: (value) => controller.emailController.text = value,
                    ),
                  ),
                  const SizedBox(height: 15),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Phone Number',
                        style: Font.semiBold.fs12.black2b(),
                      ),
                      const SizedBox(height: 10),
                      Row(
                        children: [
                          Container(
                            height: 44,
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            decoration: const BoxDecoration(
                              color: Color(0xFFE1D9D9),
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(5),
                                bottomLeft: Radius.circular(5),
                              ),
                            ),
                            child: Row(
                              children: [
                                Text(
                                  '+62',
                                  style: Font.regular.fs12.black2b(),
                                ),
                                const SizedBox(width: 5),
                                Image.asset('assets/icons/arrowdown.png', width: 12),
                              ],
                            ),
                          ),
                          Expanded(
                            child: CustomShowcase(
                              showcaseKey: GlobalKeyProvider.phoneKey,
                              title: 'Enter your phone number',
                              child: Input(
                                controller: controller.phoneController,
                                onChanged: (value) => controller.phoneController.text = value,
                                hintStyle: Font.regular.fs12.gray94(),
                                fillColor: AppColors.whiteff,
                                borderColor: const Color(0xFFE1D9D9),
                                border: true,
                                padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(height: 15),
                  CustomShowcase(
                    showcaseKey: GlobalKeyProvider.passwordKey,
                    title: 'Enter your password',
                    child: TextFieldTemplate(
                      label: 'Password',
                      controller: controller.passwordController,
                      onChanged: (value) => controller.passwordController.text = value,
                      isPassword: true,
                    ),
                  ),
                  const SizedBox(height: 15),
                  CustomShowcase(
                    showcaseKey: GlobalKeyProvider.confirmPasswordKey,
                    title: 'Confirm your password',
                    child: TextFieldTemplate(
                      label: 'Confirm Password',
                      controller: controller.confirmPasswordController,
                      onChanged: (value) => controller.confirmPasswordController.text = value,
                      isPassword: true,
                      isConfirm: true,
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