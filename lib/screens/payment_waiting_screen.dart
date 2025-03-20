import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mrowid/screens/main_menu.dart';
import 'package:mrowid/typography/typography.dart';
import 'package:mrowid/colors/color.dart';
import 'package:mrowid/widgets/custom_button.dart';
import 'package:mrowid/widgets/order_detail_box_with_border.dart'; 
import 'package:mrowid/widgets/table_number_widget.dart';
import 'package:mrowid/screens/history_screen.dart';

class PaymentWaitingScreen extends StatelessWidget {
  const PaymentWaitingScreen({super.key});

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
                                'Payment',
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
                    const SizedBox(height: 30.5),
                    Center(
                      child: Image.asset(
                        'assets/icons/waiting.png',
                        width: 40,
                        height: 40,
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
                    OrderDetailBoxWithBorder(
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
              padding: const EdgeInsets.fromLTRB(20, 0, 20, 20),
              child: Column(
                children: [
                  CustomButton(
                    text: 'History',
                    onPressed: () => Get.to(() => const HistoryScreen()),
                    backgroundColor: AppColors.black2b,
                    textStyle: Font.semiBold.fs18.whiteff(),
                  ),
                  const SizedBox(height: 10),
                  CustomButton(
                    text: 'Back Home',
                    onPressed: () => Get.to(() => const MainMenu()),
                    backgroundColor: AppColors.whiteff,
                    borderColor: AppColors.black2b,
                    textStyle: Font.semiBold.fs18.black2b(),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}