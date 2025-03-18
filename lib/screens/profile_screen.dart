import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mrowid/screens/upgrade_screen.dart';
import 'package:mrowid/widgets/profile_info_box.dart';
import 'package:mrowid/widgets/settings_list.dart';
import 'package:mrowid/typography/typography.dart';
import 'package:mrowid/colors/color.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

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
              // Token Box (Desain Lama)
              Container(
                height: 119,
                width: double.infinity,
                child: Row(
                  children: [
                    Container(
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
                    Expanded(
                      child: Container(
                        color: AppColors.grayf6,
                        padding: const EdgeInsets.only(right: 30),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            const SizedBox(height: 32),
                            Image.asset(
                              'assets/icons/topup_profile.png',
                              width: 95,
                              height: 40,
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