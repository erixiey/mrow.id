import 'package:flutter/material.dart';
import 'package:mrowid/typography/typography.dart';

class CustomBox extends StatelessWidget {
  const CustomBox({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 51,
      padding: const EdgeInsets.symmetric(horizontal: 25),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.05), 
            offset: const Offset(0, 2), 
            blurRadius: 2,
            spreadRadius: -1, 
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 12),
                child: Image.asset(
                  'assets/icons/alert.png',
                  width: 27,
                  height: 27,
                ),
              ),
              const SizedBox(width: 14),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Planned?',
                    style: Font.semiBold.fs12.black2b(),
                  ),
                  const SizedBox(height: 0),
                  Text(
                    'You have a date scheduled on 22 Feb 2024',
                    style: Font.medium.fs10.gray94(),
                  ),
                ],
              ),
            ],
          ),
          Image.asset(
            'assets/icons/arrow.png',
            width: 12,
            height: 12,
          ),
        ],
      ),
    );
  }
}