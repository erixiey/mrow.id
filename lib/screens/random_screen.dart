import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mrowid/screens/random_found_screen.dart';
import 'package:mrowid/colors/color.dart';

class RandomScreen extends StatefulWidget {
  const RandomScreen({super.key});

  @override
  _RandomScreenState createState() => _RandomScreenState();
}

class _RandomScreenState extends State<RandomScreen> {
  String searchingText = 'Searching';
  late Timer _timer;

  @override
  void initState() {
    super.initState();
    _timer = Timer.periodic(const Duration(milliseconds: 500), (timer) {
      setState(() {
        if (searchingText == 'Searching') {
          searchingText = 'Searching.';
        } else if (searchingText == 'Searching.') {
          searchingText = 'Searching..';
        } else if (searchingText == 'Searching..') {
          searchingText = 'Searching...';
        } else {
          searchingText = 'Searching';
        }
      });
    });
    Timer(const Duration(milliseconds: 5500), () {
      Get.off(
        () => const RandomFoundScreen(),
        transition: Transition.fade,
        duration: const Duration(milliseconds: 500),
      );
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(
              'assets/icons/random_bg.png',
              fit: BoxFit.cover,
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: 200),
              Center(
                child: Image.asset(
                  'assets/icons/random_group.png',
                  width: 254.08,
                  height: 250,
                ),
              ),
              const SizedBox(height: 90),
              Text(
                'Please Wait',
                style: TextStyle(
                  fontFamily: 'Outfit',
                  fontSize: 24,
                  fontWeight: FontWeight.w600,
                  color: AppColors.whiteff,
                ),
              ),
              Text(
                searchingText,
                style: TextStyle(
                  fontFamily: 'Outfit',
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  color: AppColors.gray94,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}