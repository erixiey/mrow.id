import 'package:flutter/material.dart';
import 'package:mrowid/typography/typography.dart';
import 'package:mrowid/colors/color.dart';

class OrderDetailBox extends StatelessWidget {
  final Widget tableNumberWidget;
  final String dateMateName;
  final String datingDate;
  final String totalPayment;

  const OrderDetailBox({
    super.key,
    required this.tableNumberWidget,
    required this.dateMateName,
    required this.datingDate,
    required this.totalPayment,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Table',
                    style: Font.semiBold.fs10.black2b(),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    'Table Number Information',
                    style: Font.regular.fs10.gray94(),
                  ),
                ],
              ),
              tableNumberWidget,
            ],
          ),
          const SizedBox(height: 16),
          Divider(
            color: AppColors.grayd9,
            thickness: 1,
          ),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Date Mate',
                    style: Font.semiBold.fs10.black2b(),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    'Your date\'s information',
                    style: Font.regular.fs10.gray94(),
                  ),
                ],
              ),
              Row(
                children: [
                  Image.asset(
                    'assets/icons/avatar.png',
                    width: 30,
                    height: 30,
                  ),
                  const SizedBox(width: 10),
                  Text(
                    dateMateName,
                    style: Font.regular.fs10.black2b(),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 16),
          Divider(
            color: AppColors.grayd9,
            thickness: 1,
          ),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Dating Date',
                    style: Font.semiBold.fs10.black2b(),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    'Your date time information',
                    style: Font.regular.fs10.gray94(),
                  ),
                ],
              ),
              Text(
                datingDate,
                style: Font.regular.fs10.black2b(),
              ),
            ],
          ),
          const SizedBox(height: 16),
          Divider(
            color: AppColors.grayd9,
            thickness: 1,
          ),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Total Payment',
                    style: Font.semiBold.fs10.black2b(),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    'Total tokens paid for the date',
                    style: Font.regular.fs10.gray94(),
                  ),
                ],
              ),
              Text(
                totalPayment,
                style: Font.regular.fs10.black2b(),
              ),
            ],
          ),
          const SizedBox(height: 16),
          Divider(
            color: AppColors.grayd9,
            thickness: 1,
          ),
        ],
      ),
    );
  }
}