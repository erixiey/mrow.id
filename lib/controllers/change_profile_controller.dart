import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mrowid/colors/color.dart';

class ChangeProfileController extends GetxController {
  var fullName = 'Arnold Joseph'.obs;
  var email = 'arnold@email.com'.obs;
  var phoneNumber = '82212345678'.obs;
  var address = 'Jl. Duren Tiga Selatan No. 813 Duren Tiga, Pancoran, Jakarta Selatan, DKI Jakarta'.obs;
  var countryCode = '+62'.obs;

  void updateCountryCode(String code) {
    countryCode.value = code;
  }

  void saveProfile() {
    if (fullName.value.isEmpty ||
        email.value.isEmpty ||
        phoneNumber.value.isEmpty ||
        address.value.isEmpty) {
      Get.snackbar('Error', 'All fields are required');
    } else {
      Get.back();
      Get.snackbar(
        'Success',
        'Profile updated successfully',
        snackPosition: SnackPosition.TOP,
        backgroundColor: AppColors.black2b,
        colorText: AppColors.whiteff,
        duration: const Duration(seconds: 2),
        icon: const Icon(Icons.check_circle, color: AppColors.whiteff),
      );
    }
  }
}