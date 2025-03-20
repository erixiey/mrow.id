import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mrowid/screens/payment_screen.dart';
import 'package:mrowid/typography/typography.dart';
import 'package:mrowid/widgets/custom_button.dart';
import 'package:mrowid/colors/color.dart';
import 'random_screen.dart';
import 'cafe_screen.dart';

class RandomFoundScreen extends StatelessWidget {
  const RandomFoundScreen({super.key});

  void _showTryAgainBottomSheet(BuildContext context) {
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
                'Alert',
                style: Font.bold.fs18.black2b(),
              ),
              const SizedBox(height: 15),
              Divider(
                color: AppColors.grayd9,
                thickness: 1,
                height: 0,
              ),
              const SizedBox(height: 20),
              Center(
                child: Image.asset(
                  'assets/icons/ping.png',
                  width: 100,
                  height: 100,
                ),
              ),
              const SizedBox(height: 10),
              Text(
                'Not Found',
                style: Font.semiBold.fs16.black2b(),
              ),
              Text(
                'Would you agree if we moved the search',
                style: Font.medium.fs12.gray94(),
              ),
              Text(
                'to the end of this week?',
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
                child: Column(
                  children: [
                    CustomButton(
                      text: ' Agree ',
                      onPressed: () {
                        Get.off(() => const PaymentScreen());
                        _showNotFoundBottomSheet(context);
                      },
                      backgroundColor: AppColors.black2b,
                      textStyle: Font.semiBold.fs18.whiteff(),
                    ),
                    const SizedBox(height: 10),
                    Container(
                      decoration: BoxDecoration(
                        border: Border.all(color: AppColors.black2b, width: 1),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: CustomButton(
                          text: 'Cancel',
                          onPressed: () {
                            Get.back();
                          },
                          backgroundColor: AppColors.whiteff,
                          textStyle: Font.semiBold.fs18.black2b(),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
            ],
          ),
        );
      },
    );
  }

  void _showNotFoundBottomSheet(BuildContext context) {
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
                'Alert',
                style: Font.bold.fs18.black2b(),
              ),
              const SizedBox(height: 15),
              Divider(
                color: AppColors.grayd9,
                thickness: 1,
                height: 0,
              ),
              const SizedBox(height: 20),
              Center(
                child: Image.asset(
                  'assets/icons/ping.png',
                  width: 100,
                  height: 100,
                ),
              ),
              const SizedBox(height: 10),
              Text(
                'Not Found',
                style: Font.semiBold.fs16.black2b(),
              ),
              Text(
                'Sorry the search still hasn\'t found any result',
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
                child: Column(
                  children: [
                    CustomButton(
                      text: 'Try Again',
                      onPressed: () {
                        Get.back();
                        Get.to(() => const RandomScreen());
                      },
                      backgroundColor: AppColors.black2b,
                      textStyle: Font.semiBold.fs18.whiteff(),
                    ),
                    const SizedBox(height: 10),
                    Container(
                      decoration: BoxDecoration(
                        border: Border.all(color: AppColors.black2b, width: 1),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: CustomButton(
                          text: 'Back Home',
                          onPressed: () {
                            Get.back();
                            Get.to(() => const CafeScreen());
                          },
                          backgroundColor: AppColors.whiteff,
                          textStyle: Font.semiBold.fs18.black2b(),
                        ),
                      ),
                    ),
                  ],
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
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(
              'assets/icons/random_bg.png',
              fit: BoxFit.cover,
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: 125.5),
              Text(
                'It\'s a match',
                style: Font.regular.fs14.whiteff(),
              ),
              Text(
                'Congratulations',
                style: Font.semiBold.fs24.whiteff(),
              ),
              const SizedBox(height: 66.03),
              Center(
                child: Image.asset(
                  'assets/icons/random_match.png',
                  width: 185.81,
                  height: 181.93,
                ),
              ),
              const SizedBox(height: 10),
              Text(
                'Angela Dean',
                style: Font.medium.fs14.whiteff(),
              ),
              Text(
                'Konga Cafe - Table 010',
                style: Font.regular.fs12.whiteff(),
              ),
              const Spacer(),
              Padding(
                padding: const EdgeInsets.only(bottom: 50),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 25),
                      child: CustomButton(
                        text: 'Accept',
                        onPressed: () {
                          Get.to(() => const PaymentScreen());
                        },
                        backgroundColor: AppColors.whiteff,
                        textStyle: Font.semiBold.fs18.black2b(),
                      ),
                    ),
                    const SizedBox(height: 10),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 25),
                      child: Container(
                        decoration: BoxDecoration(
                          border: Border.all(color: AppColors.whiteff, width: 1),
                          borderRadius: BorderRadius.circular(4),
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(4),
                          child: CustomButton(
                            text: 'Try Again',
                            onPressed: () {
                              _showTryAgainBottomSheet(context);
                            },
                            backgroundColor: AppColors.black2b,
                            textStyle: Font.semiBold.fs18.whiteff(),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}