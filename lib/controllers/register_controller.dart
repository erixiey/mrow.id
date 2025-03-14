import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mrowid/screens/additional_info_screen.dart';
import 'package:mrowid/screens/register_screen.dart';

import '../typography/typography.dart';
import '../widgets/custom_button.dart';

class RegisterController extends GetxController {
  final fullNameController = TextEditingController();
  final emailController = TextEditingController();
  final phoneController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  final addressController = TextEditingController();

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
    if (fullNameController.text.isEmpty) {
      Get.snackbar('Error', 'Full Name is required',
          backgroundColor: Colors.red, colorText: Colors.white);
      return false;
    }
    if (!GetUtils.isEmail(emailController.text)) {
      Get.snackbar('Error', 'Invalid Email',
          backgroundColor: Colors.red, colorText: Colors.white);
      return false;
    }
    if (phoneController.text.isEmpty || !GetUtils.isPhoneNumber(phoneController.text)) {
      Get.snackbar('Error', 'Invalid Phone Number',
          backgroundColor: Colors.red, colorText: Colors.white);
      return false;
    }
    if (passwordController.text.length < 6) {
      Get.snackbar('Error', 'Password must be at least 6 characters',
          backgroundColor: Colors.red, colorText: Colors.white);
      return false;
    }
    if (passwordController.text != confirmPasswordController.text) {
      Get.snackbar('Error', 'Passwords do not match',
          backgroundColor: Colors.red, colorText: Colors.white);
      return false;
    }
    return true;
  }

  bool validateAdditionalInfoForm() {
    if (selectedImage.value == null) {
      Get.snackbar('Error', 'Please upload an ID Card',
          backgroundColor: Colors.red, colorText: Colors.white);
      return false;
    }
    if (addressController.text.isEmpty) {
      Get.snackbar('Error', 'Address is required',
          backgroundColor: Colors.red, colorText: Colors.white);
      return false;
    }
    if (!isChecked.value) {
      Get.snackbar('Error', 'You must agree to the terms and conditions',
          backgroundColor: Colors.red, colorText: Colors.white);
      return false;
    }
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
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
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