import 'package:flutter/material.dart';
import 'package:mrowid/colors/color.dart';
import 'package:mrowid/typography/typography.dart';
import 'package:showcaseview/showcaseview.dart';

class CustomShowcase extends StatelessWidget {
  final Widget child;
  final String title;
  final bool isLastStep;
  final VoidCallback? onNext;
  final GlobalKey<State<StatefulWidget>> showcaseKey;

  const CustomShowcase({
    required this.showcaseKey,
    required this.child,
    required this.title,
    this.isLastStep = false,
    this.onNext,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Showcase.withWidget(
      key: showcaseKey,
      height: 150,
      width: 300,
      container: Container(
        padding: const EdgeInsets.all(15),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.2),
              blurRadius: 10,
              offset: const Offset(0, 5),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              children: [
                Image.asset('assets/icons/next.png', width: 20, height: 20),
                const SizedBox(width: 10),
                Expanded(
                  child: Text(
                    title,
                    style: Font.medium.fs16.black2b(),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: () => ShowCaseWidget.of(context).dismiss(),
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                    decoration: BoxDecoration(
                      color: AppColors.grayd9,
                      borderRadius: BorderRadius.circular(2),
                    ),
                    child: Text(
                      'Skip Tutorial',
                      style: Font.semiBold.fs12.black2b(),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: onNext ?? () => ShowCaseWidget.of(context).next(),
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                    decoration: BoxDecoration(
                      color: AppColors.black2b,
                      borderRadius: BorderRadius.circular(2),
                    ),
                    child: Text(
                      isLastStep ? 'Completed' : 'Next Step',
                      style: Font.semiBold.fs12.whiteff(),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
      child: child,
    );
  }
}