import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mrowid/colors/color.dart';

class HistoryScreen extends StatelessWidget {
  const HistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteff,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                color: AppColors.whiteff,
                padding: const EdgeInsets.fromLTRB(20, 10, 20, 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: () => Get.back(),
                      child: Image.asset(
                        'assets/icons/back.png',
                        width: 30,
                        height: 30,
                      ),
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'History',
                          style: TextStyle(
                            fontFamily: 'Gilroy',
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            color: AppColors.black2b,
                          ),
                        ),
                        Text(
                          'Transaction History',
                          style: TextStyle(
                            fontFamily: 'Gilroy',
                            fontSize: 10,
                            fontWeight: FontWeight.w500,
                            color: AppColors.black2b,
                          ),
                        ),
                      ],
                    ),
                    Image.asset(
                      'assets/icons/notifikasi.png',
                      width: 30,
                      height: 30,
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 26),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Image.asset(
                          'assets/icons/avatar.png',
                          width: 40,
                          height: 40,
                        ),
                        const SizedBox(width: 10),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Arnold Joseph',
                                style: TextStyle(
                                  fontFamily: 'Outfit',
                                  fontSize: 12,
                                  fontWeight: FontWeight.w500,
                                  color: AppColors.black2b,
                                ),
                              ),
                              Text(
                                'Konga Cafe - Table 02',
                                style: TextStyle(
                                  fontFamily: 'Outfit',
                                  fontSize: 12,
                                  fontWeight: FontWeight.w300,
                                  color: AppColors.gray94,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text(
                              '12 June 2024',
                              style: TextStyle(
                                fontFamily: 'Gilroy',
                                fontSize: 12,
                                fontWeight: FontWeight.w400,
                                color: AppColors.black2b,
                              ),
                            ),
                            Text(
                              '09:42 AM',
                              style: TextStyle(
                                fontFamily: 'Gilroy',
                                fontSize: 10,
                                fontWeight: FontWeight.w400,
                                color: AppColors.gray94,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    Divider(
                      color: AppColors.grayd9,
                      thickness: 1,
                    ),
                    const SizedBox(height: 10),
                    Row(
                      children: [
                        Image.asset(
                          'assets/icons/avatar.png',
                          width: 40,
                          height: 40,
                        ),
                        const SizedBox(width: 10),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Arnold Joseph',
                                style: TextStyle(
                                  fontFamily: 'Outfit',
                                  fontSize: 12,
                                  fontWeight: FontWeight.w500,
                                  color: AppColors.black2b,
                                ),
                              ),
                              Text(
                                'Konga Cafe - Table 02',
                                style: TextStyle(
                                  fontFamily: 'Outfit',
                                  fontSize: 12,
                                  fontWeight: FontWeight.w300,
                                  color: AppColors.gray94,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text(
                              '13 June 2024',
                              style: TextStyle(
                                fontFamily: 'Gilroy',
                                fontSize: 12,
                                fontWeight: FontWeight.w400,
                                color: AppColors.black2b,
                              ),
                            ),
                            Text(
                              '10:15 AM',
                              style: TextStyle(
                                fontFamily: 'Gilroy',
                                fontSize: 10,
                                fontWeight: FontWeight.w400,
                                color: AppColors.gray94,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    Divider(
                      color: AppColors.grayd9,
                      thickness: 1,
                    ),
                    const SizedBox(height: 10),
                    Row(
                      children: [
                        Image.asset(
                          'assets/icons/avatar.png',
                          width: 40,
                          height: 40,
                        ),
                        const SizedBox(width: 10),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Arnold Joseph',
                                style: TextStyle(
                                  fontFamily: 'Outfit',
                                  fontSize: 12,
                                  fontWeight: FontWeight.w500,
                                  color: AppColors.black2b,
                                ),
                              ),
                              Text(
                                'Konga Cafe - Table 02',
                                style: TextStyle(
                                  fontFamily: 'Outfit',
                                  fontSize: 12,
                                  fontWeight: FontWeight.w300,
                                  color: AppColors.gray94,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text(
                              '14 June 2024',
                              style: TextStyle(
                                fontFamily: 'Gilroy',
                                fontSize: 12,
                                fontWeight: FontWeight.w400,
                                color: AppColors.black2b,
                              ),
                            ),
                            Text(
                              '02:30 PM',
                              style: TextStyle(
                                fontFamily: 'Gilroy',
                                fontSize: 10,
                                fontWeight: FontWeight.w400,
                                color: AppColors.gray94,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    Divider(
                      color: AppColors.grayd9,
                      thickness: 1,
                    ),
                    const SizedBox(height: 10),
                    Row(
                      children: [
                        Image.asset(
                          'assets/icons/avatar.png',
                          width: 40,
                          height: 40,
                        ),
                        const SizedBox(width: 10),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Arnold Joseph',
                                style: TextStyle(
                                  fontFamily: 'Outfit',
                                  fontSize: 12,
                                  fontWeight: FontWeight.w500,
                                  color: AppColors.black2b,
                                ),
                              ),
                              Text(
                                'Konga Cafe - Table 02',
                                style: TextStyle(
                                  fontFamily: 'Outfit',
                                  fontSize: 12,
                                  fontWeight: FontWeight.w300,
                                  color: AppColors.gray94,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text(
                              '15 June 2024',
                              style: TextStyle(
                                fontFamily: 'Gilroy',
                                fontSize: 12,
                                fontWeight: FontWeight.w400,
                                color: AppColors.black2b,
                              ),
                            ),
                            Text(
                              '08:00 AM',
                              style: TextStyle(
                                fontFamily: 'Gilroy',
                                fontSize: 10,
                                fontWeight: FontWeight.w400,
                                color: AppColors.gray94,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    Divider(
                      color: AppColors.grayd9,
                      thickness: 1,
                    ),
                    const SizedBox(height: 10),
                    Row(
                      children: [
                        Image.asset(
                          'assets/icons/avatar.png',
                          width: 40,
                          height: 40,
                        ),
                        const SizedBox(width: 10),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Arnold Joseph',
                                style: TextStyle(
                                  fontFamily: 'Outfit',
                                  fontSize: 12,
                                  fontWeight: FontWeight.w500,
                                  color: AppColors.black2b,
                                ),
                              ),
                              Text(
                                'Konga Cafe - Table 02',
                                style: TextStyle(
                                  fontFamily: 'Outfit',
                                  fontSize: 12,
                                  fontWeight: FontWeight.w300,
                                  color: AppColors.gray94,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text(
                              '16 June 2024',
                              style: TextStyle(
                                fontFamily: 'Gilroy',
                                fontSize: 12,
                                fontWeight: FontWeight.w400,
                                color: AppColors.black2b,
                              ),
                            ),
                            Text(
                              '11:45 AM',
                              style: TextStyle(
                                fontFamily: 'Gilroy',
                                fontSize: 10,
                                fontWeight: FontWeight.w400,
                                color: AppColors.gray94,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    Divider(
                      color: AppColors.grayd9,
                      thickness: 1,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}