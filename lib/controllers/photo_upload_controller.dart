import 'dart:io';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class PhotoUploadController extends GetxController {
  var uploadProgress = 0.0.obs;
  var isUploading = false.obs;
  var isPaused = false.obs; // Status untuk pause
  var selectedImage = Rxn<File>();

  final ImagePicker _picker = ImagePicker();

  Future<void> pickImage(ImageSource source) async {
    try {
      final XFile? image = await _picker.pickImage(
        source: source,
        maxWidth: 1000,
        maxHeight: 1000,
        imageQuality: 85,
      );

      if (image != null) {
        selectedImage.value = File(image.path);
        startUploadSimulation();
      }
    } catch (e) {
      Get.snackbar('Error', 'Failed to pick image: $e');
    }
  }

  void startUploadSimulation() async {
    if (selectedImage.value == null) return;

    isUploading.value = true;
    uploadProgress.value = 0.0;
    isPaused.value = false;

    while (uploadProgress.value < 1.0) {
      if (!isPaused.value) {
        await Future.delayed(const Duration(milliseconds: 300));
        uploadProgress.value += 0.1;
        if (uploadProgress.value > 1.0) uploadProgress.value = 1.0;
      } else {
        await Future.delayed(const Duration(milliseconds: 100)); // Tunggu saat paused
      }
    }

    if (!isPaused.value) {
      await Future.delayed(const Duration(seconds: 1));
      isUploading.value = false;
      Get.back();
    }
  }

  void togglePause() {
    isPaused.value = !isPaused.value;
  }

  void cancelUpload() {
    isUploading.value = false;
    uploadProgress.value = 0.0;
    isPaused.value = false;
    Get.back();
  }

  String getRemainingTime() {
    int remainingSeconds = ((1.0 - uploadProgress.value) * 30).round();
    return '$remainingSeconds seconds remaining';
  }
}