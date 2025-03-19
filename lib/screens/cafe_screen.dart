import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mrowid/typography/typography.dart';
import 'package:mrowid/screens/cafe_detail_screen.dart';
import 'package:mrowid/screens/random_screen.dart';
import 'package:mrowid/widgets/custom_button.dart';
import '../controllers/cafe_controller.dart';

class CafeScreen extends StatelessWidget {
  const CafeScreen({super.key});

  void _showRollBottomSheet(BuildContext context) {
    bool isWeekendChecked = false;
    bool isPremiumChecked = false;
    bool isTermsChecked = false;

    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.white,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (BuildContext context) {
        return StatefulBuilder(
          builder: (BuildContext context, StateSetter setState) {
            return SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const SizedBox(height: 15),
                  Center(
                    child: Image.asset(
                      'assets/icons/bar.png',
                      width: 40,
                      height: 4,
                    ),
                  ),
                  const SizedBox(height: 15),
                  Text(
                    'Random Options',
                    style: TextStyle(
                      fontFamily: 'Gilroy',
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: const Color(0xFF2B2A2B),
                    ),
                  ),
                  const SizedBox(height: 15),
                  Divider(
                    color: const Color(0xFFD9D9D9),
                    thickness: 1,
                    height: 0,
                  ),
                  const SizedBox(height: 20),
                  Padding(
                    padding: const EdgeInsets.only(left: 20),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Dateing Date',
                        style: TextStyle(
                          fontFamily: 'Gilroy',
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: const Color(0xFF2B2A2B),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Container(
                      height: 44,
                      decoration: BoxDecoration(
                        border: Border.all(color: const Color(0xFFD9D9D9), width: 1),
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 10),
                            child: Row(
                              children: [
                                Image.asset(
                                  'assets/icons/calendar.png',
                                  width: 20,
                                  height: 20,
                                ),
                                const SizedBox(width: 10),
                                Text(
                                  'Select time',
                                  style: TextStyle(
                                    fontFamily: 'Gilroy',
                                    fontSize: 12,
                                    fontWeight: FontWeight.w400,
                                    color: const Color(0xFF2B2A2B),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(right: 10),
                            child: Image.asset(
                              'assets/icons/arrow_down.png',
                              width: 20,
                              height: 20,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 15),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Divider(
                      color: const Color(0xFFDDDADA),
                      thickness: 1,
                      height: 0,
                    ),
                  ),
                  const SizedBox(height: 15),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          isWeekendChecked = !isWeekendChecked;
                        });
                      },
                      child: Row(
                        children: [
                          Image.asset(
                            isWeekendChecked ? 'assets/icons/checkbox.png' : 'assets/icons/uncheckbox.png',
                            width: 20,
                            height: 20,
                          ),
                          const SizedBox(width: 10),
                          Text(
                            'It\'s okay on weekend',
                            style: TextStyle(
                              fontFamily: 'Outfit',
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                              color: isWeekendChecked ? const Color(0xFF2B2A2B) : const Color(0xFF949494),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 15),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          isPremiumChecked = !isPremiumChecked;
                        });
                      },
                      child: Row(
                        children: [
                          Image.asset(
                            isPremiumChecked ? 'assets/icons/checkbox.png' : 'assets/icons/uncheckbox.png',
                            width: 20,
                            height: 20,
                          ),
                          const SizedBox(width: 10),
                          Text(
                            'Random Premium',
                            style: TextStyle(
                              fontFamily: 'Outfit',
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                              color: isPremiumChecked ? const Color(0xFF2B2A2B) : const Color(0xFF949494),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 15),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          isTermsChecked = !isTermsChecked;
                        });
                      },
                      child: Row(
                        children: [
                          Image.asset(
                            isTermsChecked ? 'assets/icons/checkbox.png' : 'assets/icons/uncheckbox.png',
                            width: 20,
                            height: 20,
                          ),
                          const SizedBox(width: 10),
                          Text(
                            'I agree with terms conditions and privacy policy',
                            style: TextStyle(
                              fontFamily: 'Outfit',
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                              color: isTermsChecked ? const Color(0xFF2B2A2B) : const Color(0xFF949494),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: CustomButton(
                      text: 'Random',
                      onPressed: () {
                        Get.back(); // Tutup bottom sheet
                        Get.to(() => const RandomScreen()); // Pindah ke RandomScreen
                      },
                      backgroundColor: const Color(0xFF2B2A2B),
                      textStyle: TextStyle(
                        fontFamily: 'Gilroy',
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                ],
              ),
            );
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final CafeController controller = Get.put(CafeController());

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
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
            Container(
              height: 200,
              width: double.infinity,
              color: const Color(0xFF2B2A2B),
              child: Center(
                child: Stack(
                  alignment: Alignment.center,
                  clipBehavior: Clip.none,
                  children: [
                    GestureDetector(
                      onTap: () => _showRollBottomSheet(context),
                      child: Container(
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