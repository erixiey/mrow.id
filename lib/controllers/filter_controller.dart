import 'package:get/get.dart';

class FilterController extends GetxController {
  RxString selectedCity = 'Select'.obs;

  final List<String> cities = [
    'Jakarta',
    'Bandung',
    'Surabaya',
    'Yogyakarta',
    'Medan',
    'Bali',
    'Makassar',
    'Semarang',
  ];

  void selectCity(String city) {
    selectedCity.value = city;
    Get.back(); 
  }

  void submitFilter() {
    Get.back();
    Get.snackbar('Filter Applied', 'Location: ${selectedCity.value}');
  }
}