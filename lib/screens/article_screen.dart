import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mrowid/typography/typography.dart';

class ArticleScreen extends StatelessWidget {
  final String imagePath;
  final String title;

  const ArticleScreen({
    super.key,
    required this.imagePath,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 55,
                color: Colors.white,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 20),
                      child: GestureDetector(
                        onTap: () => Get.back(), 
                        child: Image.asset(
                          'assets/icons/back.png',
                          width: 30,
                          height: 30,
                        ),
                      ),
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Article',
                          style: Font.bold.fs14.black2b(),
                        ),
                        Text(
                          'Happy reading',
                          style: Font.medium.fs10.gray94(),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 20),
                      child: Image.asset(
                        'assets/icons/notifikasi.png',
                        width: 30,
                        height: 30,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                height: 215,
                width: double.infinity,
                child: Image.asset(
                  imagePath,
                  fit: BoxFit.cover,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 15),
                    Text(
                      'Get To Know Your Mate This Way',
                      style: Font.semiBold.fs16.black2b(),
                    ),
                    const SizedBox(height: 3),
                    Text(
                      'Author Jean Pearce',
                      style: Font.medium.fs10.black2b(),
                    ),
                    const SizedBox(height: 10),
                    Container(
                      height: 1,
                      color: const Color(0xFFDDDADA),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      'We all know that communication is the core of successful relationships. But how do you create meaningful conversation and dialogue when you\'re just getting to know someone?',
                      style: Font.regular.fs10.black2b(),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      'Men and women often tell us that on early dating experiences — first and second dates — they feel as if they\'re on the witness stand being interrogated by a friendly but persistent prosecutor. Yikes! Not attractive.',
                      style: Font.regular.fs10.black2b(),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}