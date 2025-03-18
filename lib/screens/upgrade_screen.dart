import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mrowid/widgets/transaction_box.dart';
import 'package:mrowid/widgets/custom_button.dart';
import 'package:mrowid/colors/color.dart';

class UpgradeScreen extends StatelessWidget {
  const UpgradeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteff,
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      color: AppColors.black2b,
                      padding: const EdgeInsets.only(left: 20, top: 10, bottom: 15),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          GestureDetector(
                            onTap: () => Get.back(),
                            child: Image.asset(
                              'assets/icons/back_black.png',
                              width: 30,
                              height: 30,
                            ),
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'Upgrade',
                                style: TextStyle(
                                  fontFamily: 'Gilroy',
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                  color: AppColors.whiteff,
                                ),
                              ),
                              Text(
                                'Upgrade your membership plan',
                                style: TextStyle(
                                  fontFamily: 'Gilroy',
                                  fontSize: 10,
                                  fontWeight: FontWeight.w500,
                                  color: AppColors.gray94,
                                ),
                              ),
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.only(right: 20),
                            child: Image.asset(
                              'assets/icons/notifikasi_black.png',
                              width: 30,
                              height: 30,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      height: 205,
                      width: double.infinity,
                      color: AppColors.black2b,
                      child: Center(
                        child: Image.asset(
                          'assets/icons/upgrade.png',
                          width: 100,
                          height: 100,
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    Padding(
                      padding: const EdgeInsets.only(left: 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Detail Transaction',
                            style: TextStyle(
                              fontFamily: 'Gilroy',
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                              color: AppColors.black2b,
                            ),
                          ),
                          Text(
                            'Here is the information about your transaction.',
                            style: TextStyle(
                              fontFamily: 'Gilroy',
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                              color: AppColors.gray94,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 10),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Divider(
                        color: AppColors.grayd9,
                        thickness: 1,
                      ),
                    ),
                    const SizedBox(height: 15),
                    Divider(
                      color: AppColors.grayd9,
                      thickness: 1,
                    ),
                    TransactionBox(
                      title: 'Package Name',
                      subtitle: 'Your package information',
                      value: 'Premium Member',
                    ),
                    Divider(
                      color: AppColors.grayd9,
                      thickness: 1,
                    ),
                    TransactionBox(
                      title: 'Dating Date',
                      subtitle: 'Your date time information',
                      value: '12 June 2024, 09:42 AM',
                    ),
                    Divider(
                      color: AppColors.grayd9,
                      thickness: 1,
                    ),
                    TransactionBox(
                      title: 'Total Payment',
                      subtitle: 'Total amount paid for the package',
                      value: 'Rp 250.000',
                    ),
                    Divider(
                      color: AppColors.grayd9,
                      thickness: 1,
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 0, 20, 20),
              child: CustomButton(
                text: 'Confirm Payment',
                onPressed: () {},
              ),
            ),
          ],
        ),
      ),
    );
  }
}