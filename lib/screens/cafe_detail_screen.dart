import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mrowid/typography/typography.dart';
import '../controllers/cafe_detail_controller.dart';

class CafeDetailScreen extends StatelessWidget {
  final String name;
  final String location;

  const CafeDetailScreen({
    super.key,
    required this.name,
    required this.location,
  });

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CafeDetailController>(
      init: CafeDetailController(),
      builder: (controller) {
        return Scaffold(
          backgroundColor: Colors.white,
          body: SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Header
                Container(
                  height: 60,
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                        onTap: () => Get.back(),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 10),
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
                            name,
                            style: Font.bold.fs14.black2b(),
                          ),
                          SizedBox(
                            width: 200,
                            child: Text(
                              location,
                              style: Font.medium.fs10.gray94(),
                              overflow: TextOverflow.ellipsis,
                              maxLines: 1,
                            ),
                          ),
                        ],
                      ),
                      Image.asset(
                        'assets/icons/notifikasi.png',
                        width: 30,
                        height: 30,
                      ),
                    ],
                  ),
                ),
                // Box Gambar
                Container(
                  height: 205,
                  width: double.infinity,
                  child: Image.asset(
                    'assets/images/imgcafe.png',
                    fit: BoxFit.cover,
                  ),
                ),
                // Judul Tables
                Padding(
                  padding: const EdgeInsets.only(left: 20, top: 20),
                  child: Text(
                    'Tables',
                    style: Font.semiBold.fs16.black2b(),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20, top: 2),
                  child: Text(
                    "Here's the table list of this cafe.",
                    style: Font.medium.fs12.gray94(),
                  ),
                ),
                Container(
                  height: 1,
                  color: const Color(0xFFD9D9D9),
                  margin: const EdgeInsets.symmetric(horizontal: 20),
                ),
                // List Table
                Expanded(
                  child: ListView.builder(
                    itemCount: 5,
                    itemBuilder: (context, index) {
                      final tableNumber = (index + 1).toString().padLeft(2, '0');
                      final isSelected = controller.selectedTables.contains(index);
                      return GestureDetector(
                        onTap: () => controller.toggleTableSelection(index),
                        child: _buildTableItem(
                          tableNumber: tableNumber,
                          isSelected: isSelected,
                        ),
                      );
                    },
                  ),
                ),
                // Floating Button LOAD MORE
                Center(
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 25),
                    child: Container(
                      width: 80,
                      height: 24,
                      decoration: BoxDecoration(
                        color: const Color(0xFF2B2A2B), // black2b
                        borderRadius: BorderRadius.circular(100),
                      ),
                      child: Center(
                        child: Text(
                          'LOAD MORE',
                          style: Font.bold.fs10.whiteff(),
                        ),
                      ),
                    ),
                  ),
                ),
                // Button Booking
                Padding(
                  padding: const EdgeInsets.fromLTRB(20, 0, 20, 20),
                  child: SizedBox(
                    width: double.infinity,
                    height: 61,
                    child: ElevatedButton(
                      onPressed: () {
                        // Tambahkan logika untuk tombol Booking di sini
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF2B2A2B), // black2b
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(4),
                        ),
                      ),
                      child: Text(
                        'Booking',
                        style: Font.semiBold.fs18.whiteff(),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildTableItem({
    required String tableNumber,
    required bool isSelected,
  }) {
    return Column(
      children: [
        Container(
          height: 65,
          width: double.infinity,
          color: isSelected ? const Color(0xFFFAF6F6) : Colors.white,
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                width: 45,
                height: 45,
                decoration: BoxDecoration(
                  color: isSelected ? const Color(0xFF2B2A2B) : const Color(0xFFFAF6F6),
                  borderRadius: BorderRadius.circular(4.09),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      tableNumber,
                      style: isSelected
                          ? Font.semiBold.fs8.whiteff()
                          : Font.semiBold.fs8.black2b(),
                    ),
                    Image.asset(
                      isSelected
                          ? 'assets/icons/chairwhite.png'
                          : 'assets/icons/chairblack.png',
                      width: 20.45,
                      height: 11.43,
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 30),
                child: Row(
                  children: [
                    Image.asset(
                      'assets/icons/avatar2.png',
                      width: 40,
                      height: 40,
                    ),
                    const SizedBox(width: 10),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Brian',
                          style: Font.medium.fs10.black2b(),
                        ),
                        Text(
                          'Adams',
                          style: Font.medium.fs10.black2b(),
                        ),
                      ],
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
        ),
      ],
    );
  }
}