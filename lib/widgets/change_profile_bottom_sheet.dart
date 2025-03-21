import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mrowid/colors/color.dart';
import 'package:mrowid/controllers/change_profile_controller.dart';
import 'package:mrowid/typography/typography.dart';
import 'package:mrowid/widgets/custom_button.dart';
import 'package:mrowid/widgets/custom_input.dart';
import 'package:mrowid/widgets/custom_phone_input.dart';

void showChangeProfileBottomSheet(BuildContext context) {
  final controller = Get.put(ChangeProfileController());

  showModalBottomSheet(
    context: context,
    backgroundColor: AppColors.whiteff,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
    ),
    isScrollControlled: true,
    builder: (BuildContext context) {
      return Padding(
        padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
        child: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Center(
                  child: Image.asset(
                    'assets/icons/bar.png',
                    width: 40,
                    height: 4,
                  ),
                ),
                const SizedBox(height: 15),
                Text(
                  'Change Profile',
                  style: TextStyle(
                    fontFamily: 'Gilroy',
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    color: AppColors.black2b,
                  ),
                ),
                Divider(
                  color: AppColors.grayd9,
                  thickness: 1,
                  height: 30,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 20),
                    Obx(
                      () => Input(
                        label: 'Full Name',
                        hint: 'Arnold Joseph',
                        onChanged: (value) => controller.fullName.value = value,
                        controller: TextEditingController(text: controller.fullName.value),
                      ),
                    ),
                    const SizedBox(height: 15),
                    Obx(
                      () => Input(
                        label: 'Email',
                        hint: 'arnold@email.com',
                        onChanged: (value) => controller.email.value = value,
                        controller: TextEditingController(text: controller.email.value),
                        keyboardType: TextInputType.emailAddress,
                      ),
                    ),
                    const SizedBox(height: 15),
                    Obx(
                      () => CustomPhoneInput(
                        countryCode: controller.countryCode,
                        updateCountryCode: controller.updateCountryCode,
                        label: 'Phone Number',
                        hint: '82212345678',
                        onChanged: (value) => controller.phoneNumber.value = value,
                        phoneController: TextEditingController(text: controller.phoneNumber.value),
                      ),
                    ),
                    const SizedBox(height: 15),
                    Obx(
                      () => Input(
                        label: 'Address',
                        hint: 'Jl. Duren Tiga Selatan No. 813 Duren Tiga, Pancoran, Jakarta Selatan, DKI Jakarta',
                        onChanged: (value) => controller.address.value = value,
                        controller: TextEditingController(text: controller.address.value),
                        maxLines: 5,
                        isMultiline: true,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                Divider(
                  color: AppColors.grayd9,
                  thickness: 1,
                  height: 0,
                ),
                const SizedBox(height: 20),
                CustomButton(
                  text: 'Submit',
                  onPressed: () => controller.saveProfile(),
                  backgroundColor: AppColors.black2b,
                  textStyle: Font.semiBold.fs18.whiteff(),
                ),
                const SizedBox(height: 20),
              ],
            ),
          ),
        ),
      );
    },
  );
}