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
            color: Colors.black.withOpacity(0.1), // Shadow tipis
            offset: const Offset(0, 2), // Hanya di bagian bawah
            blurRadius: 4,
            spreadRadius: 0,
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Ikon alert dan teks
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(14, 12, 0, 12),
                child: Image.asset(
                  'assets/icons/alert.png',
                  width: 24,
                  height: 24,
                ),
              ),
              const SizedBox(width: 10),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Planned?',
                    style: Font.semiBold.fs12.black2b(), // Gilroy Semibold 12 black2b
                  ),
                  const SizedBox(height: 0), // Tanpa jarak
                  Text(
                    'You have a date scheduled on 22 Feb 2024',
                    style: Font.medium.fs10.gray94(), // Gilroy Medium 10 gray94
                  ),
                ],
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(right: 14),
            child: Image.asset(
              'assets/icons/arrow.png',
              width: 24,
              height: 24,
            ),
          ),
        ],
      ),
    );
  }
}