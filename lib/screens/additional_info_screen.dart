import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mrowid/colors/color.dart';
import 'package:mrowid/typography/typography.dart';
import 'package:showcaseview/showcaseview.dart';
import 'package:dotted_border/dotted_border.dart';
import '../controllers/register_controller.dart';
import '../widgets/custom_button.dart';
import '../widgets/custom_input.dart';
import '../widgets/custom_showcase.dart';
import '../widgets/guide_bottom_sheet.dart';
import '../utils/global_key_provider.dart';
import 'register_screen.dart';

class AdditionalInfoScreen extends StatefulWidget {
  const AdditionalInfoScreen({super.key});

  @override
  State<AdditionalInfoScreen> createState() => _AdditionalInfoScreenState();
}

class _AdditionalInfoScreenState extends State<AdditionalInfoScreen> {
  late final RegisterController controller;
  BuildContext? _showcaseContext;

  @override
  void initState() {
    super.initState();
    controller = Get.find<RegisterController>();
  }

  void _startShowcase() {
    if (_showcaseContext == null) {
      print('Showcase context is null, cannot start showcase');
      return;
    }
    print('Starting Showcase in AdditionalInfoScreen');
    ShowCaseWidget.of(_showcaseContext!).startShowCase([
      GlobalKeyProvider.photoKey,
      GlobalKeyProvider.addressKey,
      GlobalKeyProvider.agreementKey,
      GlobalKeyProvider.signUpKey,
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
                            print('Opening Guide Bottom Sheet in AdditionalInfoScreen');
                            GuideBottomSheet.show(
                              context,
                              onComplete: () {
                                print('Guide completed, starting showcase in AdditionalInfoScreen');
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
                    'Additional Info',
                    style: Font.bold.fs16.black2b(),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    'Provide more details to complete your registration',
                    style: Font.medium.fs12.gray94(),
                  ),
                  const SizedBox(height: 15),
                  CustomShowcase(
                    showcaseKey: GlobalKeyProvider.photoKey,
                    title: 'Upload your ID Card Photo',
                    child: GestureDetector(
                      onTap: controller.pickImage,
                      child: Obx(
                        () => DottedBorder(
                          borderType: BorderType.RRect,
                          radius: const Radius.circular(5),
                          color: AppColors.grayd9,
                          strokeWidth: 1,
                          dashPattern: const [4, 4],
                          child: Container(
                            height: 209,
                            width: double.infinity,
                            child: controller.selectedImage.value == null
                                ? Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Image.asset('assets/icons/upload.png', width: 42),
                                      const SizedBox(height: 10),
                                      Text(
                                        'Upload Your ID Card',
                                        style: Font.semiBold.fs12.black2b(),
                                      ),
                                      const SizedBox(height: 5),
                                      Text(
                                        'Max size: 2MB',
                                        style: Font.regular.fs12.gray94(),
                                      ),
                                    ],
                                  )
                                : Image.file(controller.selectedImage.value!, fit: BoxFit.cover),
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 15),
                  CustomShowcase(
                    showcaseKey: GlobalKeyProvider.addressKey,
                    title: 'Fill your address',
                    child: Input(
                      label: 'Address',
                      hint: 'Enter your address',
                      controller: controller.addressController,
                      onChanged: (value) => controller.addressController.text = value,
                      maxLines: 5,
                      isMultiline: true,
                    ),
                  ),
                  const SizedBox(height: 15),
                  CustomShowcase(
                    showcaseKey: GlobalKeyProvider.agreementKey,
                    title: 'Check this section to agree with our **terms conditions** and **privacy policy**',
                    child: Row(
                      children: [
                        Obx(
                          () => Checkbox(
                            value: controller.isChecked.value,
                            onChanged: (value) => controller.isChecked.value = value ?? false,
                            activeColor: AppColors.black2b,
                          ),
                        ),
                        Expanded(
                          child: Text(
                            'By checking this box, I agree to the Terms & Conditions and Privacy Policy',
                            style: Font.regular.fs12.black2b(),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),
                  CustomShowcase(
                    showcaseKey: GlobalKeyProvider.signUpKey,
                    title: 'Tap button **Sign Up** to complete your registration',
                    isLastStep: true,
                    onNext: () {
                      print('Showcase completed, returning to RegisterScreen');
                      Get.off(() => const RegisterScreen());
                    },
                    child: CustomButton(
                      text: 'Sign Up',
                      onPressed: () => controller.onSignUp(context),
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