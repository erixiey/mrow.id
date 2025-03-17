import 'package:flutter/material.dart';
import 'package:mrowid/typography/typography.dart';

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
            color: const Color(0xFFEAFE70), // yellow70, sesuaikan kode warna jika berbeda
            padding: const EdgeInsets.fromLTRB(30, 32, 30, 0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Token Balance',
                  style: Font.semiBold.fs12.black2b(),
                ),
                const Spacer(),
                Padding(
                  padding: const EdgeInsets.only(bottom: 20), // Jarak 20 dari bawah
                  child: Image.asset(
                    'assets/icons/badgecheck.png',
                    width: 60,
                    height: 30,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Container(
              height: 119,
              color: Colors.white,
              padding: const EdgeInsets.symmetric(vertical: 20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Image.asset(
                    'assets/icons/topup.png',
                    width: 100,
                    height: 50,
                  ),
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