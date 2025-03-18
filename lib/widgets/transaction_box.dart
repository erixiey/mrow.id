import 'package:flutter/material.dart';
import 'package:mrowid/colors/color.dart';

class TransactionBox extends StatelessWidget {
  final String title;
  final String subtitle;
  final String value;

  const TransactionBox({
    super.key,
    required this.title,
    required this.subtitle,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 65,
      width: double.infinity,
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 25),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    fontFamily: 'Gilroy',
                    fontSize: 10,
                    fontWeight: FontWeight.w600, // Semibold
                    color: AppColors.black2b,
                  ),
                ),
                Text(
                  subtitle,
                  style: TextStyle(
                    fontFamily: 'Gilroy',
                    fontSize: 10,
                    fontWeight: FontWeight.w400, // Regular
                    color: AppColors.gray94,
                  ),
                ),
              ],
            ),
          ),
          const Spacer(),
          Padding(
            padding: const EdgeInsets.only(right: 30),
            child: Text(
              value,
              style: TextStyle(
                fontFamily: 'Gilroy',
                fontSize: 10,
                fontWeight: FontWeight.w400, // Regular
                color: AppColors.black2b,
              ),
            ),
          ),
        ],
      ),
    );
  }
}