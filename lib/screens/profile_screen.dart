import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mrowid/screens/upgrade_screen.dart';
import 'package:mrowid/screens/topup_screen.dart'; // Import TopupScreen
import 'package:mrowid/widgets/profile_info_box.dart';
import 'package:mrowid/widgets/settings_list.dart';
import 'package:mrowid/typography/typography.dart';
import 'package:mrowid/colors/color.dart';

import '../widgets/custom_button.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  void _showTokenBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      backgroundColor: AppColors.whiteff,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (BuildContext context) {
        return SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const SizedBox(height: 15),
              Center(
                child: Image.asset(
                  'assets/icons/bar.png',
                  width: 40,
                  height: 4,
                ),
              ),
              const SizedBox(height: 15),
              Text(
                'Important',
                style: Font.bold.fs18.black2b(),
              ),
              Divider(
                color: AppColors.grayd9,
                thickness: 1,
                height: 0,
              ),
              const SizedBox(height: 35.76),
              Image.asset(
                'assets/icons/token.png',
                width: 80,
                height: 80,
              ),
              const SizedBox(height: 25.76),
              Text(
                'Your Token isn\'t Available',
                style: Font.semiBold.fs16.black2b(),
              ),
              Text(
                'Please make a token purchase first to be able',
                style: Font.medium.fs12.gray94(),
              ),
              Text(
                'to continue accessing the application',
                style: Font.medium.fs12.gray94(),
              ),
              const SizedBox(height: 20),
              Divider(
                color: AppColors.grayd9,
                thickness: 1,
                height: 0,
              ),
              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: CustomButton(
                  text: 'Topup Token',
                  onPressed: () {
                    Get.back();
                    Get.to(() => const TopupScreen());
                  },
                  backgroundColor: AppColors.black2b,
                  textStyle: Font.semiBold.fs18.whiteff(),
                ),
              ),
              const SizedBox(height: 20),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteff,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header
              Container(
                height: 60,
                padding: const EdgeInsets.only(left: 20, right: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: () => Get.back(),
                      child: Padding(
                        padding: const EdgeInsets.only(top: 10, bottom: 15),
                        child: Image.asset(
                          'assets/icons/back.png',
                          width: 30,
                          height: 30,
                        ),
                      ),
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'My Profile',
                          style: Font.bold.fs14.black2b(),
                        ),
                        Text(
                          'Personalize your profile',
                          style: Font.medium.fs10.gray94(),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 10, bottom: 15),
                      child: Image.asset(
                        'assets/icons/edit.png',
                        width: 30,
                        height: 30,
                      ),
                    ),
                  ],
                ),
              ),
              // Token Box (Desain Lama dengan Modifikasi)
              Container(
                height: 119,
                width: double.infinity,
                child: Row(
                  children: [
                    GestureDetector(
                      onTap: () => _showTokenBottomSheet(context),
                      child: Container(
                        width: MediaQuery.of(context).size.width * 0.35,
                        color: AppColors.yellow70,
                        padding: const EdgeInsets.only(left: 30),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(height: 32),
                            Row(
                              children: [
                                Text(
                                  'Token Balance',
                                  style: Font.medium.fs12.black2b(),
                                ),
                              ],
                            ),
                            const SizedBox(height: 2),
                            Image.asset(
                              'assets/icons/badgecheck.png',
                              width: 81,
                              height: 35,
                            ),
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        color: AppColors.grayf6,
                        padding: const EdgeInsets.only(right: 30),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            const SizedBox(height: 32),
                            GestureDetector(
                              onTap: () => Get.to(() => const TopupScreen()),
                              child: Image.asset(
                                'assets/icons/topup_profile.png',
                                width: 95,
                                height: 40,
                              ),
                            ),
                            const SizedBox(height: 7.5),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Image.asset(
                                  'assets/icons/calendar.png',
                                  width: 12,
                                  height: 12,
                                ),
                                const SizedBox(width: 5),
                                Text(
                                  'Expired in 3 Month',
                                  style: Font.medium.fs10.black2b(),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 15),
              // Profile Info Box
              ProfileInfoBox(
                onUpgradePressed: () => Get.to(() => const UpgradeScreen()),
              ),
              const SizedBox(height: 15),
              // Settings List
              const SettingsList(),
            ],
          ),
        ),
      ),
    );
  }
}