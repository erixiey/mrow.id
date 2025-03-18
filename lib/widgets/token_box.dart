import 'package:flutter/material.dart';
import 'package:mrowid/typography/typography.dart';
import 'package:mrowid/colors/color.dart';

class TokenBox extends StatelessWidget {
  const TokenBox({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 119,
      padding: const EdgeInsets.symmetric(horizontal: 25),
      child: Row(
        children: [
          Container(
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