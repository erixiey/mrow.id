import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mrowid/colors/color.dart';
import 'package:mrowid/controllers/change_password_controller.dart';
import 'package:mrowid/typography/typography.dart';
import 'package:mrowid/widgets/custom_button.dart';
import 'package:mrowid/widgets/custom_input.dart';

void showChangePasswordBottomSheet(BuildContext context) {
  final controller = Get.put(ChangePasswordController());

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
                'Change Password',
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
                      label: 'Current Password',
                      hint: 'Enter current password',
                      obscureText: true,
                      onChanged: (value) => controller.currentPassword.value = value,
                      controller: TextEditingController(text: controller.currentPassword.value),
                    ),
                  ),
                  const SizedBox(height: 15),
                  Obx(
                    () => Input(
                      label: 'New Password',
                      hint: 'Enter new password',
                      obscureText: true,
                      onChanged: (value) => controller.newPassword.value = value,
                      controller: TextEditingController(text: controller.newPassword.value),
                    ),
                  ),
                  const SizedBox(height: 15),
                  Obx(
                    () => Input(
                      label: 'Confirm New Password',
                      hint: 'Confirm new password',
                      obscureText: true,
                      onChanged: (value) => controller.confirmPassword.value = value,
                      controller: TextEditingController(text: controller.confirmPassword.value),
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
                onPressed: () => controller.changePassword(),
                backgroundColor: AppColors.black2b,
                textStyle: Font.semiBold.fs18.whiteff(),
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      );
    },
  );
}