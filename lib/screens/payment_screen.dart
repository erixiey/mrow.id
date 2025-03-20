import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mrowid/typography/typography.dart';
import 'package:mrowid/colors/color.dart';
import 'package:mrowid/widgets/custom_button.dart';
import 'package:mrowid/widgets/order_detail_box.dart';
import 'package:mrowid/widgets/table_number_widget.dart';
import 'package:mrowid/screens/topup_screen.dart';

class PaymentScreen extends StatelessWidget {
  const PaymentScreen({super.key});

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
                                '#ID8123U7180',
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
                        border: Border.all(color: AppColors.grayd9, width: 1),
                      ),
                      child: Row(
                        children: [
                          Container(
                            width: MediaQuery.of(context).size.width * 0.35,
                            color: AppColors.yellow70,
                            child: Center(
                              child: Text(
                                'Token Balance',
                                style: Font.medium.fs12.black2b(),
                              ),
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
                            'Detail Order',
                            style: Font.semiBold.fs16.black2b(),
                          ),
                          const SizedBox(height: 2),
                          Text(
                            'Here is the information about your order.',
                            style: Font.medium.fs12.gray94(),
                          ),
                          const SizedBox(height: 10),
                          Divider(
                            color: AppColors.grayd9,
                            thickness: 1,
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 34),
                    OrderDetailBox(
                      tableNumberWidget: const TableNumberWidget(
                        tableNumber: '01',
                        isInteractive: false,
                      ),
                      dateMateName: 'Brian Adams',
                      datingDate: '12 June 2024, 09:42 AM',
                      totalPayment: '675 Token',
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 0, 20, 25),
              child: CustomButton(
                text: 'Confirm Payment',
                onPressed: () {},
                backgroundColor: AppColors.black2b,
                textStyle: Font.semiBold.fs18.whiteff(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}