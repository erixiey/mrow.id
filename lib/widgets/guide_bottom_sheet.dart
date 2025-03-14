import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mrowid/colors/color.dart';
import 'package:mrowid/typography/typography.dart';
import 'package:mrowid/widgets/custom_button.dart';

class GuideBottomSheet extends StatelessWidget {
  final VoidCallback? onComplete;

  const GuideBottomSheet({super.key, this.onComplete});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(15),
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset('assets/icons/bargrey.png', width: 40),
            const SizedBox(height: 15),
            Text(
              'Guide',
              style: Font.bold.fs18.black2b(),
            ),
            const SizedBox(height: 15),
            Container(
              height: 1,
              color: AppColors.grayd9,
            ),
            const SizedBox(height: 65),
            Image.asset(
              'assets/icons/book.png',
              width: 100,
              height: 100,
            ),
            const SizedBox(height: 37.5),
            Text(
              'Guide Steps',
              style: Font.semiBold.fs16.black2b(),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 19),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 54.36),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('1. Lorem ipsum dolor sit amet, consectet.', style: Font.medium.fs12.gray94()),
                  Text('2. Aliquam tincidunt mauris eu risus.', style: Font.medium.fs12.gray94()),
                  Text('3. Vestibulum auctor dapibus neque.', style: Font.medium.fs12.gray94()),
                  Text('4. Nunc dignissim risus id metus.', style: Font.medium.fs12.gray94()),
                  Text('5. Cras ornare tristique elit.', style: Font.medium.fs12.gray94()),
                  Text('6. Vivamus vestibulum ntulla nec ante.', style: Font.medium.fs12.gray94()),
                  Text('7. Praesent placerat risus quis eros.', style: Font.medium.fs12.gray94()),
                  Text('8. Fusce pellentesque suscipit nibh.', style: Font.medium.fs12.gray94()),
                  Text('9. Cras iaculis ultricies nulla', style: Font.medium.fs12.gray94()),
                  Text('10. Vestibulum commodo felis quis tortor.', style: Font.medium.fs12.gray94()),
                ],
              ),
            ),
            const SizedBox(height: 20),
            Container(
              height: 1,
              color: AppColors.grayd9,
            ),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20, bottom: 20),
              child: CustomButton(
                text: 'Next',
                onPressed: () {
                  Get.back();
                  GuideSecondBottomSheet.show(context, onComplete: onComplete);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  static void show(BuildContext context, {VoidCallback? onComplete}) {
    Get.bottomSheet(
      GuideBottomSheet(onComplete: onComplete),
      isScrollControlled: true,
    );
  }
}

class GuideSecondBottomSheet extends StatelessWidget {
  final VoidCallback? onComplete;

  const GuideSecondBottomSheet({super.key, this.onComplete});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(15),
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset('assets/icons/bar.png', width: 40),
            const SizedBox(height: 15),
            Text(
              'Guide',
              style: Font.bold.fs18.black2b(),
            ),
            const SizedBox(height: 15),
            Container(
              height: 1,
              color: AppColors.grayd9,
            ),
            const SizedBox(height: 65),
            Image.asset(
              'assets/icons/heart.png',
              width: 100,
              height: 100,
            ),
            const SizedBox(height: 37.5),
            Text(
              'Find Your Best Partner',
              style: Font.semiBold.fs16.black2b(),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 19),
            Text(
              'Application aimed at singles looking for a serious relationship',
              style: Font.medium.fs12.gray94(),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),
            Container(
              height: 1,
              color: AppColors.grayd9,
            ),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20, bottom: 20),
              child: CustomButton(
                text: 'Next',
                onPressed: () {
                  Get.back();
                  GuideThirdBottomSheet.show(context, onComplete: onComplete);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  static void show(BuildContext context, {VoidCallback? onComplete}) {
    Get.bottomSheet(
      GuideSecondBottomSheet(onComplete: onComplete),
      isScrollControlled: true,
    );
  }
}

class GuideThirdBottomSheet extends StatelessWidget {
  final VoidCallback? onComplete;

  const GuideThirdBottomSheet({super.key, this.onComplete});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(15),
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset('assets/icons/bar.png', width: 40),
            const SizedBox(height: 15),
            Text(
              'Guide',
              style: Font.bold.fs18.black2b(),
            ),
            const SizedBox(height: 15),
            Container(
              height: 1,
              color: AppColors.grayd9,
            ),
            const SizedBox(height: 65),
            Image.asset(
              'assets/icons/support.png',
              width: 100,
              height: 100,
            ),
            const SizedBox(height: 37.5),
            Text(
              'Support',
              style: Font.semiBold.fs16.black2b(),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 19),
            Text(
              'We can help.',
              style: Font.medium.fs12.gray94(),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 10),
            Text(
              'Find solutions to common problems.',
              style: Font.medium.fs12.gray94(),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),
            Container(
              height: 1,
              color: AppColors.grayd9,
            ),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20, bottom: 20),
              child: CustomButton(
                text: 'Next',
                onPressed: () {
                  print('GuideThirdBottomSheet: Next pressed');
                  Get.back();
                  onComplete?.call();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  static void show(BuildContext context, {VoidCallback? onComplete}) {
    Get.bottomSheet(
      GuideThirdBottomSheet(onComplete: onComplete),
      isScrollControlled: true,
    );
  }
}