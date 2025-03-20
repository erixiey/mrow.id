import 'package:flutter/material.dart';
import 'package:mrowid/typography/typography.dart';
import 'package:mrowid/colors/color.dart';

class TableNumberWidget extends StatelessWidget {
  final String tableNumber;
  final bool isSelected;
  final bool isInteractive;

  const TableNumberWidget({
    super.key,
    required this.tableNumber,
    this.isSelected = false,
    this.isInteractive = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 45,
      height: 45,
      decoration: BoxDecoration(
        color: isInteractive
            ? (isSelected ? AppColors.black2b : const Color(0xFFFAF6F6))
            : AppColors.black2b, 
        borderRadius: BorderRadius.circular(4.09),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            tableNumber,
            style: isInteractive
                ? (isSelected
                    ? Font.semiBold.fs8.whiteff()
                    : Font.semiBold.fs8.black2b())
                : Font.semiBold.fs8.whiteff(), 
          ),
          Image.asset(
            isInteractive
                ? (isSelected
                    ? 'assets/icons/chairwhite.png'
                    : 'assets/icons/chairblack.png')
                : 'assets/icons/chairwhite.png',
            width: 20.45,
            height: 11.43,
          ),
        ],
      ),
    );
  }
}