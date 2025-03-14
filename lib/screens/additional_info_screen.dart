import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mrowid/colors/color.dart';
import 'package:mrowid/typography/typography.dart';
import 'package:showcaseview/showcaseview.dart';
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
          backgroundColor: Colors.white,
          appBar: AppBar(
            backgroundColor: Colors.white,
            elevation: 0,
            leading: IconButton(
              icon: const Icon(Icons.arrow_back, color: Colors.black),
              onPressed: () => Get.back(),
            ),
            actions: [
              Padding(
                padding: const EdgeInsets.only(right: 25),
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
                        () => Container(
                          height: 209,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: const Color(0xFFE1D9D9),
                              style: BorderStyle.solid,
                              width: 1,
                              strokeAlign: BorderSide.strokeAlignOutside,
                            ),
                            borderRadius: BorderRadius.circular(5),
                          ),
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
                  const SizedBox(height: 15),
                  CustomShowcase(
                    showcaseKey: GlobalKeyProvider.addressKey,
                    title: 'Fill your address',
                    child: Input(
                      label: 'Address',
                      controller: controller.addressController,
                      onChanged: (value) => controller.addressController.text = value,
                      hintStyle: Font.regular.fs12.gray94(),
                      labelStyle: Font.semiBold.fs12.black2b(),
                      fillColor: AppColors.whiteff,
                      borderColor: const Color(0xFFE1D9D9),
                      border: true,
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
                            activeColor: Colors.black,
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
                    ),
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