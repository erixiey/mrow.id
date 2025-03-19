import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mrowid/typography/typography.dart';
import 'package:mrowid/colors/color.dart';
import 'package:mrowid/screens/support_screen.dart'; // Impor halaman Support

class ProfileInfoBox extends StatelessWidget {
  final VoidCallback? onUpgradePressed;

  const ProfileInfoBox({super.key, this.onUpgradePressed});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25),
      child: Container(
        height: 123.91,
        width: double.infinity,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: MediaQuery.of(context).size.width * 0.35,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Stack(
                    clipBehavior: Clip.none,
                    alignment: Alignment.center,
                    children: [
                      GestureDetector(
                        onTap: () => Get.to(() => const SupportScreen()),
                        child: Image.asset(
                          'assets/icons/avatar_profile.png',
                          width: 85,
                          height: 85,
                        ),
                      ),
                      Positioned(
                        bottom: -10,
                        child: Image.asset(
                          'assets/icons/camera.png',
                          width: 23.04,
                          height: 23.04,
                        ),
                      ),
                    ],
                  ),
                  const Spacer(),
                  Container(
                    width: 71,
                    height: 22,
                    decoration: BoxDecoration(
                      color: AppColors.black2b,
                      borderRadius: BorderRadius.circular(27),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 5),
                          child: Image.asset(
                            'assets/icons/polygon.png',
                            width: 12,
                            height: 12,
                          ),
                        ),
                        Container(
                          width: 1,
                          height: 22,
                          color: AppColors.gray94,
                          margin: const EdgeInsets.symmetric(horizontal: 5),
                        ),
                        Text(
                          'Reguler',
                          style: Font.medium.fs10.whiteff(),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Container(
                width: 1,
                height: 123.91,
                color: AppColors.grayd9,
              ),
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 10),
                  Text(
                    'Arnold Joseph',
                    style: Font.bold.fs14.black2b(),
                  ),
                  const SizedBox(height: 10.46),
                  Row(
                    children: [
                      Image.asset(
                        'assets/icons/call.png',
                        width: 12,
                        height: 12,
                      ),
                      const SizedBox(width: 5),
                      Text(
                        '081234567899',
                        style: Font.medium.fs10.gray94(),
                      ),
                    ],
                  ),
                  const SizedBox(height: 3),
                  Row(
                    children: [
                      Image.asset(
                        'assets/icons/mail.png',
                        width: 12,
                        height: 12,
                      ),
                      const SizedBox(width: 5),
                      Text(
                        'arnold@email.com',
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
                          'Jl. Duren Tiga Selatan No. 813 Duren Tiga, Pancoran, Jakarta Selatan, DKI Jakarta',
                          style: Font.medium.fs10.gray94(),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                  const Spacer(),
                  GestureDetector(
                    onTap: onUpgradePressed,
                    child: Container(
                      width: 120,
                      height: 22,
                      decoration: BoxDecoration(
                        color: AppColors.black2b,
                        borderRadius: BorderRadius.circular(27),
                      ),
                      padding: const EdgeInsets.symmetric(horizontal: 5),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            'assets/icons/crown.png',
                            width: 12,
                            height: 12,
                          ),
                          const SizedBox(width: 5),
                          Text(
                            'Upgrade Premium',
                            style: Font.medium.fs10.whiteff(),
                          ),
                        ],
                      ),
                    ),
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