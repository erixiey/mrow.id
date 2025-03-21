import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mrowid/typography/typography.dart';
import 'package:mrowid/colors/color.dart';
import 'package:mrowid/screens/support_screen.dart';
import 'package:mrowid/controllers/photo_upload_controller.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:mrowid/widgets/custom_button.dart';
import 'package:image_picker/image_picker.dart';

class ProfileInfoBox extends StatelessWidget {
  final VoidCallback? onUpgradePressed;

  const ProfileInfoBox({super.key, this.onUpgradePressed});

  void _showPhotoUploadBottomSheet(BuildContext context) {
    final controller = Get.put(PhotoUploadController());

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
                      'Change Photo',
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
                                            'Upload Photo',
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
                            : () {
                                controller.startUploadSimulation();
                              },
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
                        child: GestureDetector(
                          onTap: () => _showPhotoUploadBottomSheet(context),
                          child: Image.asset(
                            'assets/icons/camera.png',
                            width: 23.04,
                            height: 23.04,
                          ),
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