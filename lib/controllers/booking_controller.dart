import 'package:get/get.dart';

class BookingController extends GetxController {
  RxString selectedDate = 'Select Time'.obs;

  final List<String> dates = [
    '2025-03-18',
    '2025-03-19',
    '2025-03-20',
    '2025-03-21',
    '2025-03-22',
  ];

  void selectDate(String date) {
    selectedDate.value = date;
    Get.back();
  }

  void submitBooking() {
    Get.back();
    Get.snackbar('Booking Submitted', 'Date: ${selectedDate.value}');
  }
}