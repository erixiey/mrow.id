import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mrowid/typography/typography.dart';
import 'package:mrowid/colors/color.dart';
import 'package:mrowid/widgets/custom_button.dart';
import 'package:image_picker/image_picker.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:mrowid/screens/payment_waiting_screen.dart';
import 'dart:io';

class TopupScreen extends StatelessWidget {
  const TopupScreen({super.key});

  void _showConfirmBottomSheet(BuildContext context) async {
    final ImagePicker picker = ImagePicker();
    XFile? image;

    await showModalBottomSheet(
      context: context,
      backgroundColor: AppColors.whiteff,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      isScrollControlled: true,
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
                    'Confirm Payment',
                    style: Font.bold.fs18.black2b(),
                  ),
                  const SizedBox(height: 15),
                  Divider(
                    color: AppColors.grayd9,
                    thickness: 1,
                  ),
                  GestureDetector(
                    onTap: () async {
                      final XFile? pickedFile = await picker.pickImage(source: ImageSource.gallery);
                      if (pickedFile != null) {
                        setState(() {
                          image = pickedFile;
                        });
                      }
                    },
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: DottedBorder(
                        borderType: BorderType.RRect,
                        radius: const Radius.circular(5),
                        color: AppColors.grayd9,
                        strokeWidth: 1,
                        dashPattern: const [4, 4],
                        child: Container(
                          height: 452,
                          width: double.infinity,
                          child: image == null
                              ? Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Image.asset(
                                      'assets/icons/upload.png',
                                      width: 80,
                                      height: 80,
                                    ),
                                    const SizedBox(height: 20),
                                    Text(
                                      'Upload Payment Receipt',
                                      style: Font.bold.fs16.black2b(),
                                    ),
                                    const SizedBox(height: 2),
                                    Text(
                                      'Image specifications with an image ratio of 6:9 and a maximum of 5 Megabytes',
                                      style: Font.medium.fs12.gray94(),
                                      textAlign: TextAlign.center,
                                    ),
                                  ],
                                )
                              : Image.file(
                                  File(image!.path),
                                  fit: BoxFit.cover,
                                  width: double.infinity,
                                  height: 452,
                                ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 25),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Total Payment',
                              style: Font.semiBold.fs10.black2b(),
                            ),
                            Text(
                              'Total payment amount paid for token.',
                              style: Font.regular.fs10.gray94(),
                            ),
                          ],
                        ),
                        Text(
                          'Rp, 250.000-',
                          style: Font.semiBold.fs10.black2b(),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),
                  Divider(
                    color: AppColors.grayd9,
                    thickness: 1,
                  ),
                  const SizedBox(height: 20),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: CustomButton(
                      text: 'Submit',
                      onPressed: () {
                        Get.back();
                        Get.to(() => const PaymentWaitingScreen());
                      },
                      backgroundColor: AppColors.black2b,
                      textStyle: Font.semiBold.fs18.whiteff(),
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
    return Scaffold(
      backgroundColor: AppColors.whiteff,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                color: AppColors.whiteff,
                padding: const EdgeInsets.fromLTRB(20, 10, 20, 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: () => Get.back(),
                      child: Image.asset(
                        'assets/icons/back.png',
                        width: 30,
                        height: 30,
                      ),
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Topup My Token',
                          style: Font.bold.fs14.black2b(),
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
              const SizedBox(height: 6),
              Padding(
                padding: const EdgeInsets.only(left: 25),
                child: Text(
                  'Topup Amount',
                  style: Font.semiBold.fs12.black2b(),
                ),
              ),
              const SizedBox(height: 10),
              Container(
                height: 45,
                margin: const EdgeInsets.symmetric(horizontal: 25),
                decoration: BoxDecoration(
                  border: Border.all(color: AppColors.grayd9, width: 1),
                  borderRadius: BorderRadius.circular(5),
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: TextField(
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          contentPadding: const EdgeInsets.symmetric(horizontal: 10),
                          hintText: '0',
                          hintStyle: Font.regular.fs12.gray94(),
                        ),
                        style: Font.regular.fs12.black2b(),
                        keyboardType: TextInputType.number,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 10),
                      child: Center(
                        child: Text(
                          'Token',
                          style: Font.medium.fs12.black2b(),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 15),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child: Divider(
                  color: AppColors.grayd9,
                  thickness: 1,
                ),
              ),
              const SizedBox(height: 15),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Total Payment',
                          style: Font.semiBold.fs10.black2b(),
                        ),
                        Text(
                          'Total payment amount paid for token.',
                          style: Font.regular.fs10.gray94(),
                        ),
                      ],
                    ),
                    Center(
                      child: Text(
                        'Rp, 0-',
                        style: Font.regular.fs10.black2b(),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 15),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 25),
                padding: const EdgeInsets.only(top: 10, left: 10, bottom: 10),
                decoration: BoxDecoration(
                  border: Border.all(color: AppColors.grayd9, width: 1),
                  borderRadius: BorderRadius.circular(4),
                ),
                child: Stack(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Note',
                          style: Font.semiBold.fs12.black2b(),
                        ),
                        const SizedBox(height: 5),
                        Text(
                          '- Prices 1 Token = Rp 50.000',
                          style: Font.regular.fs10.black2b(),
                        ),
                        Text(
                          '- Minimum purchase of 3 tokens',
                          style: Font.regular.fs10.black2b(),
                        ),
                        const SizedBox(height: 10),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: Divider(
                            color: AppColors.grayd9,
                            thickness: 1,
                          ),
                        ),
                        const SizedBox(height: 10),
                        Text(
                          'Payment Instruction',
                          style: Font.semiBold.fs12.black2b(),
                        ),
                        const SizedBox(height: 5),
                        Text(
                          '1. Make sure the payment is in accordance with the bill amount.\n'
                          '2. Make payments before the due date.\n'
                          '3. Payments are made only through available payment gateways.',
                          style: Font.medium.fs10.gray94(),
                        ),
                      ],
                    ),
                    Positioned(
                      top: 15,
                      right: 0,
                      child: Padding(
                        padding: const EdgeInsets.only(right: 10),
                        child: Image.asset(
                          'assets/icons/alert.png',
                          width: 27,
                          height: 27,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 15),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child: CustomButton(
                  text: 'Confirm Payment',
                  onPressed: () => _showConfirmBottomSheet(context),
                  backgroundColor: AppColors.black2b,
                  textStyle: Font.semiBold.fs18.whiteff(),
                ),
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}