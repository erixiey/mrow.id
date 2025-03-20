import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mrowid/typography/typography.dart';
import 'package:mrowid/colors/color.dart';
import 'package:mrowid/widgets/custom_button.dart';
import 'package:mrowid/screens/token_screen.dart';

class TokenBox extends StatelessWidget {
  const TokenBox({super.key});

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
                    Get.to(() => const TokenScreen());
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
    return Container(
      height: 119,
      padding: const EdgeInsets.symmetric(horizontal: 25),
      child: Row(
        children: [
          GestureDetector(
            onTap: () => _showTokenBottomSheet(context),
            child: Container(
              width: 141,
              height: 119,
              color: AppColors.yellow70,
              padding: const EdgeInsets.fromLTRB(30, 32, 0, 0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        'Token Balance',
                        style: Font.semiBold.fs12.black2b(),
                      ),
                    ],
                  ),
                  const SizedBox(height: 5),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 20),
                    child: Image.asset(
                      'assets/icons/badgecheck.png',
                      width: 81,
                      height: 35,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: Container(
              height: 119,
              color: AppColors.grayf6,
              padding: const EdgeInsets.symmetric(vertical: 20),
              child: Column(
                children: [
                  Image.asset(
                    'assets/icons/topup.png',
                    width: 100,
                    height: 45,
                  ),
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
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
    );
  }
}