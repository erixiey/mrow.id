import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mrowid/typography/typography.dart';
import 'package:mrowid/screens/cafe_detail_screen.dart';
import '../controllers/cafe_controller.dart';

class CafeScreen extends StatelessWidget {
  const CafeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final CafeController controller = Get.put(CafeController());

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header
            Container(
              height: 60,
              color: const Color(0xFF2B2A2B),
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Image.asset(
                    'assets/icons/avatar2.png',
                    width: 40,
                    height: 40,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Hai, Arnold 👋',
                        style: Font.bold.fs14.whiteff(),
                      ),
                      Text(
                        'Welcome back to mrow',
                        style: Font.medium.fs10.gray94(),
                      ),
                    ],
                  ),
                  Image.asset(
                    'assets/icons/notifikasi_black.png',
                    width: 24,
                    height: 24,
                  ),
                ],
              ),
            ),
            // Box Besar dengan Stack
            Container(
              height: 200,
              width: double.infinity,
              color: const Color(0xFF2B2A2B),
              child: Center(
                child: Stack(
                  alignment: Alignment.center,
                  clipBehavior: Clip.none,
                  children: [
                    Container(
                      width: 119.50,
                      height: 34.56,
                      decoration: BoxDecoration(
                        color: const Color(0xFF373231),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            'ROLL',
                            style: TextStyle(
                              fontFamily: 'Roboto',
                              fontWeight: FontWeight.bold,
                              fontSize: 16.75,
                              color: Color(0xFFFFFFFF),
                            ),
                          ),
                          const SizedBox(width: 5),
                          Image.asset(
                            'assets/icons/shuffle.png',
                            width: 16,
                            height: 16,
                          ),
                        ],
                      ),
                    ),
                    Positioned(
                      top: 12,
                      right: -7,
                      child: Image.asset(
                        'assets/icons/cursor.png',
                        width: 32.26,
                        height: 32.26,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            // Judul dan Filter
            Padding(
              padding: const EdgeInsets.only(left: 25, top: 20, right: 25),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Cafe',
                        style: Font.semiBold.fs16.black2b(),
                      ),
                      Text(
                        'List of cafes and restaurants around you',
                        style: Font.medium.fs12.gray94(),
                      ),
                    ],
                  ),
                  GestureDetector(
                    onTap: controller.showFilterBottomSheet,
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 0),
                      child: Image.asset(
                        'assets/icons/filter.png',
                        width: 14,
                        height: 14,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            // List Cafe
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    _buildCafeItem(
                      'Konga Cafe',
                      '345 Likes',
                      'Jl. Duren Tiga Selatan No. 813 Duren Tiga, Pancoran, Jakarta Selatan, DKI Jakarta',
                      context,
                    ),
                    _buildCafeItem(
                      'Bean Bliss',
                      '512 Likes',
                      'Jl. Melawai Raya No. 12, Kebayoran Baru, Jakarta Selatan, DKI Jakarta',
                      context,
                    ),
                    _buildCafeItem(
                      'Mocha Haven',
                      '278 Likes',
                      'Jl. Senopati No. 45, Senayan, Jakarta Selatan, DKI Jakarta',
                      context,
                    ),
                    _buildCafeItem(
                      'Brew Break',
                      '401 Likes',
                      'Jl. Panglima Polim No. 78, Kebayoran Baru, Jakarta Selatan, DKI Jakarta',
                      context,
                    ),
                    _buildCafeItem(
                      'Cafe Lush',
                      '632 Likes',
                      'Jl. Kemang Raya No. 23, Kemang, Jakarta Selatan, DKI Jakarta',
                      context,
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 31),
          ],
        ),
      ),
      floatingActionButton: Container(
        width: 80,
        height: 24,
        decoration: BoxDecoration(
          color: const Color(0xFF2B2A2B),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Center(
          child: Text(
            'LOAD MORE',
            style: Font.bold.fs10.whiteff(),
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }

  Widget _buildCafeItem(String name, String likes, String location, BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.to(() => CafeDetailScreen(name: name, location: location));
      },
      child: Column(
        children: [
          Container(
            height: 75,
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: Column(
              children: [
                Expanded(
                  child: Row(
                    children: [
                      Image.asset(
                        'assets/images/imglist.png',
                        width: 60,
                        height: 60,
                      ),
                      const SizedBox(width: 15),
                      Expanded(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              name,
                              style: Font.semiBold.fs12.black2b(),
                            ),
                            const SizedBox(height: 3),
                            Row(
                              children: [
                                Image.asset(
                                  'assets/icons/like.png',
                                  width: 12,
                                  height: 12,
                                ),
                                const SizedBox(width: 5),
                                Text(
                                  likes,
                                  style: Font.medium.fs10.gray94(),
                                ),
                              ],
                            ),
                            const SizedBox(height: 3),
                            Row(
                              children: [
                                Image.asset(
                                  'assets/icons/location.png',
                                  width: 12,
                                  height: 12,
                                ),
                                const SizedBox(width: 5),
                                Expanded(
                                  child: Text(
                                    location,
                                    style: Font.medium.fs10.gray94(),
                                    overflow: TextOverflow.ellipsis,
                                    maxLines: 1,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Container(
            height: 1,
            color: const Color(0xFFD9D9D9),
            margin: const EdgeInsets.symmetric(horizontal: 25),
          ),
        ],
      ),
    );
  }
}