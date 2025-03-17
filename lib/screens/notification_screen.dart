import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mrowid/typography/typography.dart';
import '../controllers/notification_controller.dart';
import '../widgets/notification_item.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final NotificationController controller = Get.put(NotificationController());

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            Container(
              height: 55,
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () => Get.back(),
                    child: Image.asset(
                      'assets/icons/back.png',
                      width: 30,
                      height: 30,
                    ),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Inbox',
                        style: Font.bold.fs14.black2b(),
                      ),
                      Text(
                        'Message for you',
                        style: Font.medium.fs10.gray94(),
                      ),
                    ],
                  ),
                  Image.asset(
                    'assets/icons/notif_option.png',
                    width: 30,
                    height: 30,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 21),
            Expanded(
              child: Obx(
                () => ListView.separated(
                  itemCount: controller.notifications.length,
                  separatorBuilder: (context, index) => Container(
                    height: 0.5, 
                    color: const Color(0xFFE1D9D9), 
                  ),
                  itemBuilder: (context, index) {
                    final notif = controller.notifications[index];
                    return NotificationItem(
                      title: notif['title'] as String,
                      description: notif['description'] as String,
                      date: notif['date'] as String,
                      isRead: notif['isRead'] as bool,
                      onTap: () => controller.markAsRead(index),
                      index: index,
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}