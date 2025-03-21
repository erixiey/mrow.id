import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mrowid/screens/additional_info_screen.dart';
import 'package:mrowid/screens/register_screen.dart';
import 'package:mrowid/colors/color.dart';
import 'package:mrowid/typography/typography.dart';
import 'package:mrowid/widgets/custom_button.dart';

class RegisterController extends GetxController {
  final fullNameController = TextEditingController();
  final emailController = TextEditingController();
  final phoneController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  final addressController = TextEditingController();
  
  var countryCode = '+62'.obs; 
  final isChecked = false.obs;
  final selectedImage = Rxn<File>();

  Future<void> pickImage() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      selectedImage.value = File(pickedFile.path);
    }
  }

  bool validateRegisterForm() {
    return true;
  }

  bool validateAdditionalInfoForm() {
    return true;
  }

  void onContinue() {
    if (validateRegisterForm()) {
      Get.to(() => const AdditionalInfoScreen());
    }
  }

  void onSignUp(BuildContext context) {
    if (validateAdditionalInfoForm()) {
      _showBottomSheet(context);
    }
  }

  void _showBottomSheet(BuildContext context) {
    Get.bottomSheet(
      Container(
        padding: const EdgeInsets.all(15),
        decoration: BoxDecoration(
          color: AppColors.whiteff,
          borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset('assets/icons/bar.png', width: 40),
            const SizedBox(height: 15),
            Text(
              'Alert',
              style: Font.bold.fs18.black2b(),
            ),
            const SizedBox(height: 50),
            Image.asset(
              'assets/icons/wait.png',
              width: 100,
              height: 100,
            ),
            const SizedBox(height: 25.76),
            Text(
              'Please Wait',
              style: Font.semiBold.fs16.black2b(),
            ),
            const SizedBox(height: 2),
            Text(
              'Registration is complete.',
              style: Font.medium.fs12.gray94(),
            ),
            Text(
              'Your account will be verified by Admin soon',
              style: Font.medium.fs12.gray94(),
            ),
            const SizedBox(height: 50),
            CustomButton(
              text: 'Close',
              onPressed: () {
                Get.back();
                Get.off(() => const RegisterScreen());
              },
              backgroundColor: AppColors.black2b, 
              textStyle: Font.semiBold.fs18.whiteff(),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void onClose() {
    fullNameController.dispose();
    emailController.dispose();
    phoneController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    addressController.dispose();
    super.onClose();
  }
}