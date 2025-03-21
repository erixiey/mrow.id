import 'package:flutter/material.dart';
import 'package:mrowid/colors/color.dart';
import 'package:mrowid/typography/typography.dart';

class SettingsItem extends StatelessWidget {
  final String icon;
  final String title;
  final String subtitle;
  final VoidCallback onTap;

  const SettingsItem({
    super.key,
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
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
              icon,
              width: 35,
              height: 35,
            ),
            const SizedBox(width: 10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  title,
                  style: Font.regular.fs12.black2b(),
                ),
                Text(
                  subtitle,
                  style: Font.regular.fs10.gray94(),
                ),
              ],
            ),
            const Spacer(),
            Image.asset(
              'assets/icons/arrow_gray.png',
              width: 18,
              height: 18,
            ),
          ],
        ),
      ),
    );
  }
}