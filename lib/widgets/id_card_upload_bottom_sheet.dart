import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mrowid/controllers/id_card_upload_controller.dart';
import 'package:mrowid/colors/color.dart';
import 'package:mrowid/typography/typography.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:mrowid/widgets/custom_button.dart';
import 'package:image_picker/image_picker.dart';

void showIdCardUploadBottomSheet(BuildContext context) {
  final controller = Get.put(IdCardUploadController());

  showModalBottomSheet(
    context: context,
    backgroundColor: AppColors.whiteff,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
    ),
    isScrollControlled: true,
    builder: (BuildContext context) {
      return ConstrainedBox(
        constraints: BoxConstraints(
          maxHeight: MediaQuery.of(context).size.height * 0.85,
          minHeight: 500,
        ),
        child: Obx(() => Container(
              padding: const EdgeInsets.symmetric(vertical: 0),
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
                    'Upload ID Card',
                    style: Font.bold.fs18.black2b(),
                  ),
                  Divider(
                    color: AppColors.grayd9,
                    thickness: 1,
                    height: 0,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Column(
                      children: [
                        const SizedBox(height: 20),
                        DottedBorder(
                          borderType: BorderType.RRect,
                          radius: const Radius.circular(5),
                          color: AppColors.grayd9,
                          strokeWidth: 1,
                          dashPattern: const [5, 5],
                          child: GestureDetector(
                            onTap: () {
                              showModalBottomSheet(
                                context: context,
                                builder: (context) => Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    ListTile(
                                      leading: const Icon(Icons.photo_library),
                                      title: const Text('Gallery'),
                                      onTap: () {
                                        Get.back();
                                        controller.pickImage(ImageSource.gallery);
                                      },
                                    ),
                                    ListTile(
                                      leading: const Icon(Icons.camera_alt),
                                      title: const Text('Camera'),
                                      onTap: () {
                                        Get.back();
                                        controller.pickImage(ImageSource.camera);
                                      },
                                    ),
                                  ],
                                ),
                              );
                            },
                            child: Container(
                              height: 335,
                              width: double.infinity,
                              child: controller.selectedImage.value == null
                                  ? Column(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Image.asset(
                                          'assets/icons/upload.png',
                                          width: 80,
                                          height: 80,
                                        ),
                                        const SizedBox(height: 20),
                                        Text(
                                          'Upload ID Card',
                                          style: Font.bold.fs16.black2b(),
                                        ),
                                        const SizedBox(height: 5),
                                        Padding(
                                          padding: const EdgeInsets.symmetric(horizontal: 20),
                                          child: Text(
                                            'Image specifications with an image ratio of 1:1 and a maximum of 5 Megabytes',
                                            style: Font.medium.fs12.gray94(),
                                            textAlign: TextAlign.center,
                                          ),
                                        ),
                                      ],
                                    )
                                  : Image.file(
                                      controller.selectedImage.value!,
                                      fit: BoxFit.cover,
                                      height: 335,
                                      width: double.infinity,
                                    ),
                            ),
                          ),
                        ),
                        if (controller.isUploading.value) ...[
                          const SizedBox(height: 10),
                          Container(
                            height: 82,
                            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                            decoration: BoxDecoration(
                              color: AppColors.grayf6,
                              borderRadius: BorderRadius.circular(5),
                              border: Border.all(color: AppColors.grayd9),
                            ),
                            child: Stack(
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      'Uploading...',
                                      style: Font.medium.fs12.black2b(),
                                    ),
                                    const SizedBox(height: 5),
                                    Text(
                                      '${(controller.uploadProgress.value * 100).round()}% • ${controller.getRemainingTime()}',
                                      style: Font.light.fs12.black2b(),
                                    ),
                                    const SizedBox(height: 10),
                                    SizedBox(
                                      width: 303,
                                      height: 8,
                                      child: LinearProgressIndicator(
                                        value: controller.uploadProgress.value,
                                        backgroundColor: AppColors.whiteff,
                                        valueColor: const AlwaysStoppedAnimation<Color>(AppColors.black2b),
                                      ),
                                    ),
                                  ],
                                ),
                                Positioned(
                                  top: 0,
                                  right: 0,
                                  child: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      GestureDetector(
                                        onTap: () => controller.togglePause(),
                                        child: Image.asset(
                                          'assets/icons/pause.png',
                                          width: 24,
                                          height: 24,
                                        ),
                                      ),
                                      const SizedBox(width: 10),
                                      GestureDetector(
                                        onTap: () => controller.cancelUpload(),
                                        child: Image.asset(
                                          'assets/icons/cancel.png',
                                          width: 24,
                                          height: 24,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),
                  Divider(
                    color: AppColors.grayd9,
                    thickness: 1,
                    height: 0,
                  ),
                  const SizedBox(height: 20),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: CustomButton(
                      text: 'Submit',
                      onPressed: controller.isUploading.value || controller.selectedImage.value == null
                          ? () {}
                          : () => controller.startUploadSimulation(),
                      backgroundColor: AppColors.black2b,
                      textStyle: Font.semiBold.fs18.whiteff(),
                    ),
                  ),
                  const SizedBox(height: 20),
                ],
              ),
            )),
      );
    },
  );
}