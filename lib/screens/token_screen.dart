import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mrowid/typography/typography.dart';
import 'package:mrowid/colors/color.dart';
import 'package:mrowid/screens/topup_screen.dart';

class TokenScreen extends StatelessWidget {
  const TokenScreen({super.key});

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
                          'My Token',
                          style: Font.bold.fs14.black2b(),
                        ),
                        Text(
                          'Token Information',
                          style: Font.medium.fs10.gray94(),
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
              Container(
                height: 119,
                width: double.infinity,
                decoration: BoxDecoration(
                  border: Border(bottom: BorderSide(color: AppColors.grayd9, width: 1)),
                ),
                child: Row(
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width * 0.35,
                      color: const Color(0xFFF1E9E9),
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
                            'assets/icons/warning_token.png',
                            width: 81,
                            height: 35,
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: GestureDetector(
                        onTap: () => Get.to(() => const TopupScreen()),
                        child: Container(
                          color: AppColors.grayf6,
                          child: Center(
                            child: Image.asset(
                              'assets/icons/topup_token.png',
                              width: 192,
                              height: 40,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 15),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'History Transaction',
                      style: Font.semiBold.fs16.black2b(),
                    ),
                    Text(
                      'Here is the information about your transaction.',
                      style: Font.medium.fs12.gray94(),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 15),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child: Divider(
                  color: AppColors.grayd9,
                  thickness: 1,
                ),
              ),
              ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: 10,
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      Container(
                        height: 65,
                        padding: const EdgeInsets.symmetric(horizontal: 25),
                        child: Row(
                          children: [
                            Image.asset(
                              'assets/icons/used.png',
                              width: 40,
                              height: 40,
                            ),
                            const SizedBox(width: 10),
                            Expanded(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Used Token',
                                    style: TextStyle(
                                      fontFamily: 'Outfit',
                                      fontSize: 12,
                                      fontWeight: FontWeight.w500,
                                      color: AppColors.black2b,
                                    ),
                                  ),
                                  Text(
                                    '12 June 2024 09:42 AM',
                                    style: Font.regular.fs10.gray94(),
                                  ),
                                ],
                              ),
                            ),
                            Center(
                              child: Text(
                                '- 100',
                                style: Font.semiBold.fs12.black2b(),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 25),
                        child: Divider(
                          color: AppColors.grayd9,
                          thickness: 1,
                        ),
                      ),
                    ],
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}