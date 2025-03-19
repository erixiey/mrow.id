import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class SupportController extends GetxController {
  RxString message = ''.obs;
  Rx<File?> selectedImage = Rx<File?>(null);
  RxList<Map<String, dynamic>> messages = <Map<String, dynamic>>[].obs;

  final TextEditingController textController = TextEditingController();
  final ImagePicker _picker = ImagePicker();

  void updateMessage(String value) {
    message.value = value;
  }

  Future<void> pickImage() async {
    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      selectedImage.value = File(image.path);
    }
  }

  void removeImage() {
    selectedImage.value = null;
  }

  void sendMessage() {
    if (message.value.isNotEmpty || selectedImage.value != null) {
      messages.add({
        'text': message.value,
        'image': selectedImage.value,
        'isUser': true,
        'time': DateTime.now().toString().substring(11, 16),
      });
      message.value = '';
      selectedImage.value = null;
      textController.clear();
    }
  }

  void showImagePreview(File image) {
    Get.dialog(
      Dialog(
        child: Stack(
          children: [
            Image.file(image),
            Positioned(
              top: 10,
              right: 10,
              child: GestureDetector(
                onTap: () => Get.back(),
                child: Container(
                  padding: const EdgeInsets.all(5),
                  decoration: const BoxDecoration(
                    color: Colors.black54,
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(Icons.close, color: Colors.white, size: 20),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}