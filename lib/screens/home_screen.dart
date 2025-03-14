import 'package:flutter/material.dart';
import 'package:mrowid/typography/typography.dart';

import '../widgets/custom_box.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 20),
                    child: Image.asset(
                      'assets/icons/avatar.png',
                      width: 40,
                      height: 40,
                    ),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        'Hai, Arnold 👋',
                        style: Font.bold.fs14.black2b(),
                      ),
                      const SizedBox(height: 0),
                      Text(
                        'Welcome back to mrow',
                        style: Font.medium.fs10.gray94(),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 20),
                    child: Image.asset(
                      'assets/icons/notifikasi.png',
                      width: 24,
                      height: 24,
                    ),
                  ),
                ],
              ),
            ),
            const CustomBox(), 
            const Expanded(
              child: Center(
                child: Text(
                  'Welcome to Home Screen!',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}