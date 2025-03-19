import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mrowid/colors/color.dart';
import 'package:mrowid/controllers/support_controller.dart';
import 'package:mrowid/screens/faq_screen.dart';
import 'package:mrowid/widgets/custom_button.dart';
import 'package:mrowid/typography/typography.dart';

class SupportScreen extends StatelessWidget {
  const SupportScreen({super.key});

  void _showPingBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      backgroundColor: AppColors.whiteff,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (BuildContext context) {
        return SingleChildScrollView(
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
                'Ping!',
                style: Font.bold.fs18.black2b(),
              ),
              const SizedBox(height: 15),
              Divider(
                color: AppColors.grayd9,
                thickness: 1,
                height: 0,
              ),
              const SizedBox(height: 35.76),
              Image.asset(
                'assets/icons/ping.png',
                width: 80,
                height: 80,
              ),
              const SizedBox(height: 25.76),
              Text(
                'Admin Has Pinged',
                style: Font.semiBold.fs16.black2b(),
              ),
              Text(
                'Please wait. Your message has been sent',
                style: Font.medium.fs12.gray94(),
              ),
              Text(
                'for immediate processing by Admin.',
                style: Font.medium.fs12.gray94(),
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
                  text: 'Close',
                  onPressed: () => Get.back(),
                  backgroundColor: AppColors.black2b,
                  textStyle: Font.semiBold.fs18.whiteff(),
                ),
              ),
              const SizedBox(height: 20),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final SupportController controller = Get.put(SupportController());

    return Scaffold(
      backgroundColor: AppColors.grayf6,
      body: SafeArea(
        child: Column(
          children: [
            Container(
              color: AppColors.whiteff,
              padding: const EdgeInsets.fromLTRB(20, 10, 20, 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      GestureDetector(
                        onTap: () => Get.back(),
                        child: Image.asset(
                          'assets/icons/back.png',
                          width: 30,
                          height: 30,
                        ),
                      ),
                      const SizedBox(width: 15),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Support',
                            style: Font.bold.fs14.black2b(),
                          ),
                          Text(
                            'Tell me what your problem',
                            style: Font.medium.fs10.gray94(),
                          ),
                        ],
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      GestureDetector(
                        onTap: () => Get.to(() => const FaqScreen()),
                        child: Image.asset(
                          'assets/icons/faq.png',
                          width: 30,
                          height: 30,
                        ),
                      ),
                      const SizedBox(width: 10),
                      GestureDetector(
                        onTap: () => _showPingBottomSheet(context),
                        child: Image.asset(
                          'assets/icons/warn.png',
                          width: 30,
                          height: 30,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Expanded(
              child: Obx(
                () => SingleChildScrollView(
                  child: Column(
                    children: [
                      const SizedBox(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.only(left: 25),
                              child: Divider(
                                color: AppColors.grayd9,
                                thickness: 1,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            child: Text(
                              'Today',
                              style: Font.regular.fs12.black31(),
                            ),
                          ),
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.only(right: 25),
                              child: Divider(
                                color: AppColors.grayd9,
                                thickness: 1,
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 20),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 25),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                constraints: const BoxConstraints(maxWidth: 250),
                                padding: const EdgeInsets.fromLTRB(16, 14, 16, 22),
                                decoration: BoxDecoration(
                                  color: AppColors.whiteff,
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(15),
                                    topRight: Radius.circular(15),
                                    bottomLeft: Radius.circular(0),
                                    bottomRight: Radius.circular(15),
                                  ),
                                ),
                                child: Text(
                                  'Hi Jake, how are you? I saw on the app that we’ve crossed paths several times this week 😄',
                                  style: Font.regular.fs12.black2b(),
                                ),
                              ),
                              const SizedBox(height: 5),
                              Text(
                                '2:55 PM',
                                style: Font.regular.fs12.gray94(),
                              ),
                            ],
                          ),
                        ),
                      ),
                      ...controller.messages.map(
                        (msg) => Padding(
                          padding: const EdgeInsets.symmetric(vertical: 10),
                          child: Align(
                            alignment: msg['isUser'] ? Alignment.centerRight : Alignment.centerLeft,
                            child: Padding(
                              padding: EdgeInsets.only(
                                left: msg['isUser'] ? 25 : 25,
                                right: msg['isUser'] ? 25 : 25,
                              ),
                              child: Column(
                                crossAxisAlignment: msg['isUser'] ? CrossAxisAlignment.end : CrossAxisAlignment.start,
                                children: [
                                  GestureDetector(
                                    onTap: msg['image'] != null ? () => controller.showImagePreview(msg['image']) : null,
                                    child: Container(
                                      constraints: const BoxConstraints(maxWidth: 250),
                                      padding: msg['isUser']
                                          ? const EdgeInsets.fromLTRB(16, 16, 16, 25)
                                          : const EdgeInsets.fromLTRB(16, 14, 16, 22),
                                      decoration: BoxDecoration(
                                        color: AppColors.whiteff,
                                        borderRadius: msg['isUser']
                                            ? const BorderRadius.only(
                                                topLeft: Radius.circular(15),
                                                topRight: Radius.circular(15),
                                                bottomLeft: Radius.circular(15),
                                                bottomRight: Radius.circular(0),
                                              )
                                            : const BorderRadius.only(
                                                topLeft: Radius.circular(15),
                                                topRight: Radius.circular(15),
                                                bottomLeft: Radius.circular(0),
                                                bottomRight: Radius.circular(15),
                                              ),
                                      ),
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          if (msg['image'] != null) Image.file(msg['image']),
                                          if (msg['text'].isNotEmpty) const SizedBox(height: 10),
                                          if (msg['text'].isNotEmpty)
                                            Text(
                                              msg['text'],
                                              style: Font.regular.fs12.black2b(),
                                            ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  const SizedBox(height: 5),
                                  Row(
                                    mainAxisAlignment: msg['isUser'] ? MainAxisAlignment.end : MainAxisAlignment.start,
                                    children: [
                                      Text(
                                        msg['time'],
                                        style: Font.regular.fs12.gray94(),
                                      ),
                                      if (msg['isUser']) const SizedBox(width: 5),
                                      if (msg['isUser'])
                                        Image.asset(
                                          'assets/icons/read.png',
                                          width: 16,
                                          height: 16,
                                        ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: AppColors.whiteff,
                border: Border(top: BorderSide(color: AppColors.grayf6, width: 1)),
              ),
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Column(
                children: [
                  Obx(
                    () => controller.selectedImage.value != null
                        ? Stack(
                            children: [
                              Container(
                                height: 100,
                                width: 100,
                                margin: const EdgeInsets.only(bottom: 5),
                                child: Image.file(controller.selectedImage.value!),
                              ),
                              Positioned(
                                top: 0,
                                right: 0,
                                child: GestureDetector(
                                  onTap: controller.removeImage,
                                  child: Container(
                                    padding: const EdgeInsets.all(2),
                                    decoration: const BoxDecoration(
                                      color: Colors.black54,
                                      shape: BoxShape.circle,
                                    ),
                                    child: const Icon(Icons.close, color: Colors.white, size: 16),
                                  ),
                                ),
                              ),
                            ],
                          )
                        : const SizedBox.shrink(),
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      GestureDetector(
                        onTap: controller.pickImage,
                        child: Image.asset(
                          'assets/icons/attach.png',
                          width: 24,
                          height: 24,
                        ),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: Container(
                          height: 35,
                          decoration: BoxDecoration(
                            color: AppColors.grayf6,
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: TextField(
                            controller: controller.textController,
                            onChanged: controller.updateMessage,
                            textAlignVertical: TextAlignVertical.center,
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              contentPadding: const EdgeInsets.only(left: 10, right: 10, top: 2, bottom: 12),
                              hintText: 'Type your message...',
                              hintStyle: Font.regular.fs12.gray94(),
                            ),
                            style: Font.regular.fs12.black2b(),
                          ),
                        ),
                      ),
                      const SizedBox(width: 12),
                      GestureDetector(
                        onTap: controller.sendMessage,
                        child: Image.asset(
                          'assets/icons/send.png',
                          width: 24,
                          height: 24,
                        ),
                      ),
                    ],
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