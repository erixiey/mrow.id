import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../widgets/filter_bottom_sheet.dart';

class CafeController extends GetxController {
  void showFilterBottomSheet() {
    Get.bottomSheet(
      FilterBottomSheet(),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
    );
  }
}