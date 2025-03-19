import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mrowid/widgets/custom_button.dart';
import 'package:mrowid/colors/color.dart';
import 'package:mrowid/typography/typography.dart';

class HistoryDetailScreen extends StatelessWidget {
  const HistoryDetailScreen({super.key});

  void _showRateMateBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      backgroundColor: AppColors.whiteff,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (BuildContext context) {
        return SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
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
                  'Rate Your Mate',
                  style: Font.bold.fs18.black2b(),
                ),
                Divider(
                  color: AppColors.grayd9,
                  thickness: 1,
                ),
                const SizedBox(height: 20),
                Center(
                  child: Image.asset(
                    'assets/icons/avatarmate.png',
                    width: 80,
                    height: 80,
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  'Brian Adams',
                  style: Font.semiBold.fs16.black2b(),
                ),
                Text(
                  'Give your judgement about your partner.',
                  style: Font.medium.fs12.black2b(),
                ),
                Text(
                  'Please choose your vote',
                  style: Font.medium.fs12.gray94(),
                ),
                const SizedBox(height: 20),
                Divider(
                  color: AppColors.grayd9,
                  thickness: 1,
                ),
                const SizedBox(height: 20),
                CustomButton(
                  text: 'Like',
                  onPressed: () => Get.back(),
                  backgroundColor: AppColors.black2b,
                  trailing: Image.asset(
                    'assets/icons/likemate.png',
                    width: 24,
                    height: 24,
                  ),
                  textStyle: Font.semiBold.fs18.whiteff(),
                ),
                const SizedBox(height: 10),
                CustomButton(
                  text: 'Dislike',
                  onPressed: () => Get.back(),
                  backgroundColor: AppColors.whiteff,
                  borderColor: AppColors.black2b,
                  leading: Image.asset(
                    'assets/icons/dislikemate.png',
                    width: 24,
                    height: 24,
                  ),
                  textStyle: Font.semiBold.fs18.black2b(),
                ),
                const SizedBox(height: 20),
              ],
            ),
          ),
        );
      },
    );
  }

  void _showRateCafeBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      backgroundColor: AppColors.whiteff,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (BuildContext context) {
        return SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
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
                  'Rate Cafe',
                  style: Font.bold.fs18.black2b(),
                ),
                Divider(
                  color: AppColors.grayd9,
                  thickness: 1,
                ),
                const SizedBox(height: 20),
                Center(
                  child: Image.asset(
                    'assets/icons/icon.png',
                    width: 80,
                    height: 80,
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  'Konga Cafe',
                  style: Font.semiBold.fs16.black2b(),
                ),
                Text(
                  'Give your assessment of your date\'s',
                  style: Font.medium.fs12.black2b(),
                ),
                Text(
                  'venue, Please choose your vote',
                  style: Font.medium.fs12.gray94(),
                ),
                const SizedBox(height: 20),
                Divider(
                  color: AppColors.grayd9,
                  thickness: 1,
                ),
                const SizedBox(height: 20),
                CustomButton(
                  text: 'Like',
                  onPressed: () => Get.back(),
                  backgroundColor: AppColors.black2b,
                  trailing: Image.asset(
                    'assets/icons/likemate.png',
                    width: 24,
                    height: 24,
                  ),
                  textStyle: Font.semiBold.fs18.whiteff(),
                ),
                const SizedBox(height: 10),
                CustomButton(
                  text: 'Dislike',
                  onPressed: () => Get.back(),
                  backgroundColor: AppColors.whiteff,
                  borderColor: AppColors.black2b,
                  leading: Image.asset(
                    'assets/icons/dislikemate.png',
                    width: 24,
                    height: 24,
                  ),
                  textStyle: Font.semiBold.fs18.black2b(),
                ),
                const SizedBox(height: 20),
              ],
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteff,
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      color: AppColors.black2b,
                      padding: const EdgeInsets.fromLTRB(20, 10, 20, 15),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          GestureDetector(
                            onTap: () => Get.back(),
                            child: Image.asset(
                              'assets/icons/back_black.png',
                              width: 30,
                              height: 30,
                            ),
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'Cafe',
                                style: Font.bold.fs14.whiteff(),
                              ),
                              SizedBox(
                                width: 200,
                                child: Text(
                                  'Jl. Duren Tiga Selatan No. 813 Duren Tiga, Pancoran, Jakarta Selatan, DKI Jakarta',
                                  style: Font.medium.fs10.gray94(),
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                            ],
                          ),
                          Image.asset(
                            'assets/icons/notifikasi_black.png',
                            width: 30,
                            height: 30,
                          ),
                        ],
                      ),
                    ),
                    Container(
                      height: 205,
                      width: double.infinity,
                      child: Image.asset(
                        'assets/images/imgcafe.png',
                        fit: BoxFit.cover,
                      ),
                    ),
                    const SizedBox(height: 20),
                    Padding(
                      padding: const EdgeInsets.only(left: 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Detail Transaction',
                            style: Font.semiBold.fs16.black2b(),
                          ),
                          Text(
                            'Here is the information about your transaction.',
                            style: Font.medium.fs12.gray94(),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 10),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Divider(
                        color: AppColors.grayd9,
                        thickness: 1,
                      ),
                    ),
                    const SizedBox(height: 15),
                    Container(
                      height: 65,
                      width: double.infinity,
                      padding: const EdgeInsets.only(left: 25),
                      child: Row(
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'Table',
                                style: Font.semiBold.fs10.black2b(),
                              ),
                              Text(
                                'Table Number Information',
                                style: Font.medium.fs12.gray94(),
                              ),
                            ],
                          ),
                          const Spacer(),
                          Padding(
                            padding: const EdgeInsets.only(right: 20),
                            child: Container(
                              width: 45,
                              height: 45,
                              decoration: BoxDecoration(
                                color: AppColors.black2b,
                                borderRadius: BorderRadius.circular(4.09),
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    '01',
                                    style: Font.semiBold.fs8.whiteff(),
                                  ),
                                  Image.asset(
                                    'assets/icons/chairwhite.png',
                                    width: 20.45,
                                    height: 11.43,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Divider(
                      color: AppColors.grayd9,
                      thickness: 1,
                    ),
                    Container(
                      height: 65,
                      width: double.infinity,
                      padding: const EdgeInsets.only(left: 25),
                      child: Row(
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'Date Mate',
                                style: Font.semiBold.fs10.black2b(),
                              ),
                              Text(
                                'Your date\'s information',
                                style: Font.medium.fs12.gray94(),
                              ),
                            ],
                          ),
                          const Spacer(),
                          Padding(
                            padding: const EdgeInsets.only(right: 20),
                            child: Row(
                              children: [
                                Image.asset(
                                  'assets/icons/avatar.png',
                                  width: 40,
                                  height: 40,
                                ),
                                const SizedBox(width: 10),
                                Text(
                                  'Brian Adams',
                                  style: Font.regular.fs10.black2b(),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Divider(
                      color: AppColors.grayd9,
                      thickness: 1,
                    ),
                    Container(
                      height: 65,
                      width: double.infinity,
                      padding: const EdgeInsets.only(left: 25),
                      child: Row(
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'Dating Date',
                                style: Font.semiBold.fs10.black2b(),
                              ),
                              Text(
                                'Your date time information',
                                style: Font.medium.fs12.gray94(),
                              ),
                            ],
                          ),
                          const Spacer(),
                          Padding(
                            padding: const EdgeInsets.only(right: 20),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  '12 June 2024, 09:42 AM',
                                  style: Font.regular.fs10.black2b(),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Divider(
                      color: AppColors.grayd9,
                      thickness: 1,
                    ),
                    Container(
                      height: 65,
                      width: double.infinity,
                      padding: const EdgeInsets.only(left: 25),
                      child: Row(
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'Total Payment',
                                style: Font.semiBold.fs10.black2b(),
                              ),
                              Text(
                                'Total tokens paid for the date',
                                style: Font.medium.fs12.gray94(),
                              ),
                            ],
                          ),
                          const Spacer(),
                          Padding(
                            padding: const EdgeInsets.only(right: 20),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  '675 Token',
                                  style: Font.regular.fs10.black2b(),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Divider(
                      color: AppColors.grayd9,
                      thickness: 1,
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 0, 20, 10),
              child: Column(
                children: [
                  CustomButton(
                    text: 'Rate Your Mate',
                    onPressed: () => _showRateMateBottomSheet(context),
                    backgroundColor: AppColors.black2b,
                    textStyle: Font.semiBold.fs18.whiteff(),
                  ),
                  const SizedBox(height: 10),
                  CustomButton(
                    text: 'Rate Cafe',
                    onPressed: () => _showRateCafeBottomSheet(context),
                    backgroundColor: AppColors.whiteff,
                    borderColor: AppColors.black2b,
                    textStyle: Font.semiBold.fs18.black2b(),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}