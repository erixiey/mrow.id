import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mrowid/typography/typography.dart';
import '../widgets/custom_box.dart';
import '../widgets/token_box.dart';
import '../widgets/card_widget.dart';
import '../widgets/article_box.dart';
import 'notification_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
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
                      child: GestureDetector(
                        onTap: () {
                          Get.to(() => const NotificationScreen(),
                              transition: Transition.rightToLeft,
                              duration: const Duration(milliseconds: 300));
                        },
                        child: Image.asset(
                          'assets/icons/notifikasi.png',
                          width: 24,
                          height: 24,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const CustomBox(),
              const SizedBox(height: 15),
              const TokenBox(),
              const SizedBox(height: 15),
              const CardWidget(),
              Padding(
                padding: const EdgeInsets.only(left: 25, top: 15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Articles',
                      style: Font.semiBold.fs16.black2b(),
                    ),
                    const SizedBox(height: 2),
                    Text(
                      'Read other interesting articles',
                      style: Font.medium.fs12.gray94(),
                    ),
                  ],
                ),
              ),
              const ArticleBox(
                imagePath: 'assets/images/img1.png',
                title: 'Get to know your Mate this Way',
                description:
                    'Maecenas nec libero turpis. Duis nisi nisi, maximus varius risus quis, rhoncus laoreet nunc. Pellentesq venenatis elit, eget sollicitudin lectus. Suspendisse eget ssollicitudin',
              ),
              const ArticleBox(
                imagePath: 'assets/images/img2.png',
                title: 'Get to know your Mate this Way',
                description:
                    'Maecenas nec libero turpis. Duis nisi nisi, maximus varius risus quis, rhoncus laoreet nunc. Pellentesq venenatis elit, eget sollicitudin lectus. Suspendisse eget ssollicitudin',
              ),
              const ArticleBox(
                imagePath: 'assets/images/img3.png',
                title: 'Get to know your Mate this Way',
                description:
                    'Maecenas nec libero turpis. Duis nisi nisi, maximus varius risus quis, rhoncus laoreet nunc. Pellentesq venenatis elit, eget sollicitudin lectus. Suspendisse eget ssollicitudin',
              ),
            ],
          ),
        ),
      ),
    );
  }
}