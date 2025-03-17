import 'package:get/get.dart';

class CafeDetailController extends GetxController {
  final Set<int> selectedTables = {};

  void toggleTableSelection(int index) {
    if (selectedTables.contains(index)) {
      selectedTables.remove(index);
    } else {
      selectedTables.add(index);
    }
    update();
  }
}