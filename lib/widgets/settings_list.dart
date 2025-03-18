import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mrowid/screens/term_condition_screen.dart';
import 'package:mrowid/screens/privacy_policy_screen.dart';
import 'package:mrowid/screens/sign_in_screen.dart';
import 'package:mrowid/screens/history_screen.dart';
import 'package:mrowid/colors/color.dart';

class SettingsList extends StatelessWidget {
  const SettingsList({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25),
      child: Column(
        children: [
          GestureDetector(
            onTap: () => Get.to(() => const HistoryScreen()),
            child: Container(
              height: 65,
              width: double.infinity,
              decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide(
                    color: AppColors.grayd9,
                    width: 1,
                  ),
                ),
              ),
              child: Row(
                children: [
                  Image.asset(
                    'assets/icons/history.png',
                    width: 24,
                    height: 24,
                  ),
                  const SizedBox(width: 10),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'History',
                        style: TextStyle(
                          fontFamily: 'Outfit',
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                          color: AppColors.black2b,
                        ),
                      ),
                      Text(
                        'Check out your history outfit',
                        style: TextStyle(
                          fontFamily: 'Outfit',
                          fontSize: 12,
                          fontWeight: FontWeight.w300,
                          color: AppColors.gray94,
                        ),
                      ),
                    ],
                  ),
                  const Spacer(),
                  Image.asset(
                    'assets/icons/arrow_gray.png',
                    width: 24,
                    height: 24,
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 5),
          Container(
            height: 65,
            width: double.infinity,
            decoration: BoxDecoration(
              border: Border(
                bottom: BorderSide(
                  color: AppColors.grayd9,
                  width: 1,
                ),
              ),
            ),
            child: Row(
              children: [
                Image.asset(
                  'assets/icons/key.png',
                  width: 24,
                  height: 24,
                ),
                const SizedBox(width: 10),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Change Password',
                      style: TextStyle(
                        fontFamily: 'Outfit',
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                        color: AppColors.black2b,
                      ),
                    ),
                    Text(
                      'Keep your password secure',
                      style: TextStyle(
                        fontFamily: 'Outfit',
                        fontSize: 12,
                        fontWeight: FontWeight.w300,
                        color: AppColors.gray94,
                      ),
                    ),
                  ],
                ),
                const Spacer(),
                Image.asset(
                  'assets/icons/arrow_gray.png',
                  width: 24,
                  height: 24,
                ),
              ],
            ),
          ),
          const SizedBox(height: 5),
          Container(
            height: 65,
            width: double.infinity,
            decoration: BoxDecoration(
              border: Border(
                bottom: BorderSide(
                  color: AppColors.grayd9,
                  width: 1,
                ),
              ),
            ),
            child: Row(
              children: [
                Image.asset(
                  'assets/icons/idcard.png',
                  width: 24,
                  height: 24,
                ),
                const SizedBox(width: 10),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'ID Card',
                      style: TextStyle(
                        fontFamily: 'Outfit',
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                        color: AppColors.black2b,
                      ),
                    ),
                    Text(
                      'Manage your identity card',
                      style: TextStyle(
                        fontFamily: 'Outfit',
                        fontSize: 12,
                        fontWeight: FontWeight.w300,
                        color: AppColors.gray94,
                      ),
                    ),
                  ],
                ),
                const Spacer(),
                Image.asset(
                  'assets/icons/arrow_gray.png',
                  width: 24,
                  height: 24,
                ),
              ],
            ),
          ),
          const SizedBox(height: 5),
          GestureDetector(
            onTap: () => Get.to(() => const TermConditionScreen()),
            child: Container(
              height: 65,
              width: double.infinity,
              decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide(
                    color: AppColors.grayd9,
                    width: 1,
                  ),
                ),
              ),
              child: Row(
                children: [
                  Image.asset(
                    'assets/icons/term.png',
                    width: 24,
                    height: 24,
                  ),
                  const SizedBox(width: 10),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Term & Condition',
                        style: TextStyle(
                          fontFamily: 'Outfit',
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                          color: AppColors.black2b,
                        ),
                      ),
                      Text(
                        'Please read more',
                        style: TextStyle(
                          fontFamily: 'Outfit',
                          fontSize: 12,
                          fontWeight: FontWeight.w300,
                          color: AppColors.gray94,
                        ),
                      ),
                    ],
                  ),
                  const Spacer(),
                  Image.asset(
                    'assets/icons/arrow_gray.png',
                    width: 24,
                    height: 24,
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 5),
          GestureDetector(
            onTap: () => Get.to(() => const PrivacyPolicyScreen()),
            child: Container(
              height: 65,
              width: double.infinity,
              decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide(
                    color: AppColors.grayd9,
                    width: 1,
                  ),
                ),
              ),
              child: Row(
                children: [
                  Image.asset(
                    'assets/icons/lock.png',
                    width: 24,
                    height: 24,
                  ),
                  const SizedBox(width: 10),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Privacy & Policy',
                        style: TextStyle(
                          fontFamily: 'Outfit',
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                          color: AppColors.black2b,
                        ),
                      ),
                      Text(
                        'Please read more',
                        style: TextStyle(
                          fontFamily: 'Outfit',
                          fontSize: 12,
                          fontWeight: FontWeight.w300,
                          color: AppColors.gray94,
                        ),
                      ),
                    ],
                  ),
                  const Spacer(),
                  Image.asset(
                    'assets/icons/arrow_gray.png',
                    width: 24,
                    height: 24,
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 5),
          GestureDetector(
            onTap: () {
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    title: Text(
                      'Log Out',
                      style: TextStyle(
                        fontFamily: 'Gilroy',
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        color: AppColors.black2b,
                      ),
                    ),
                    content: Text(
                      'Are you sure you want to log out?',
                      style: TextStyle(
                        fontFamily: 'Gilroy',
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: AppColors.black2b,
                      ),
                    ),
                    actions: [
                      TextButton(
                        onPressed: () => Get.back(),
                        child: Text(
                          'Cancel',
                          style: TextStyle(
                            fontFamily: 'Gilroy',
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            color: AppColors.gray94,
                          ),
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          Get.back();
                          Get.snackbar(
                            'Success',
                            'You have successfully logged out',
                            snackPosition: SnackPosition.TOP,
                            backgroundColor: AppColors.black2b,
                            colorText: AppColors.whiteff,
                            duration: const Duration(seconds: 2),
                            icon: const Icon(
                              Icons.check_circle,
                              color: AppColors.whiteff,
                            ),
                          );
                          Future.delayed(const Duration(seconds: 2), () {
                            Get.offAll(() => const SignInScreen());
                          });
                        },
                        child: Text(
                          'Log Out',
                          style: TextStyle(
                            fontFamily: 'Gilroy',
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            color: AppColors.black2b,
                          ),
                        ),
                      ),
                    ],
                  );
                },
              );
            },
            child: Container(
              height: 65,
              width: double.infinity,
              decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide(
                    color: AppColors.grayd9,
                    width: 1,
                  ),
                ),
              ),
              child: Row(
                children: [
                  Image.asset(
                    'assets/icons/logout.png',
                    width: 24,
                    height: 24,
                  ),
                  const SizedBox(width: 10),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Log Out',
                        style: TextStyle(
                          fontFamily: 'Outfit',
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                          color: AppColors.black2b,
                        ),
                      ),
                      Text(
                        'Sign out from your account now',
                        style: TextStyle(
                          fontFamily: 'Outfit',
                          fontSize: 12,
                          fontWeight: FontWeight.w300,
                          color: AppColors.gray94,
                        ),
                      ),
                    ],
                  ),
                  const Spacer(),
                  Image.asset(
                    'assets/icons/arrow_gray.png',
                    width: 24,
                    height: 24,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}