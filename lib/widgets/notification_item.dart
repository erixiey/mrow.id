import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:get/get.dart';
import 'package:mrowid/typography/typography.dart';
import '../controllers/notification_controller.dart';

class NotificationItem extends StatelessWidget {
  final String title;
  final String description;
  final String date;
  final bool isRead;
  final VoidCallback onTap;
  final int index; // Tambahkan indeks untuk menghapus

  const NotificationItem({
    super.key,
    required this.title,
    required this.description,
    required this.date,
    required this.isRead,
    required this.onTap,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    final NotificationController controller = Get.find<NotificationController>();

    return Slidable(
      key: ValueKey(index), 
      endActionPane: ActionPane(
        motion: const ScrollMotion(),
        extentRatio: 0.2, 
        children: [
          GestureDetector(
            onTap: () {
              controller.deleteNotification(index); 
            },
            child: Container(
              color: Colors.white, 
              alignment: Alignment.center,
              padding: const EdgeInsets.only(right: 20),
              child: Image.asset(
                'assets/icons/trash.png',
                width: 24,
                height: 24,
              ),
            ),
          ),
        ],
      ),
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          padding: const EdgeInsets.only(left: 20, right: 20),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 10), 
                    Text(
                      title,
                      style: isRead
                          ? TextStyle(
                              fontFamily: 'Gilroy',
                              fontWeight: FontWeight.w600, 
                              fontSize: 10,
                              color: const Color(0xFF2B2A2B).withValues(alpha: 0.5), // black2b 50%
                            )
                          : Font.semiBold.fs10.black2b(), 
                    ),
                    const SizedBox(height: 3), 
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Expanded(
                          child: RichText(
                            text: TextSpan(
                              children: [
                                TextSpan(
                                  text: description.split('Try Again')[0],
                                  style: isRead
                                      ? TextStyle(
                                          fontFamily: 'Gilroy',
                                          fontWeight: FontWeight.w400, 
                                          fontSize: 10,
                                          color: const Color(0xFF2B2A2B).withValues(alpha: 0.5), // black2b 50%
                                        )
                                      : Font.regular.fs10.black2b(), 
                                ),
                                TextSpan(
                                  text: 'Try Again',
                                  style: isRead
                                      ? TextStyle(
                                          fontFamily: 'Gilroy',
                                          fontWeight: FontWeight.w400,
                                          fontSize: 10,
                                          color: const Color(0xFF2B2A2B).withValues(alpha: 0.5),
                                          decoration: TextDecoration.underline,
                                        )
                                      : Font.regular.fs10.black2b().copyWith(
                                          decoration: TextDecoration.underline,
                                        ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        if (!isRead) 
                          Padding(
                            padding: const EdgeInsets.only(left: 10),
                            child: Image.asset(
                              'assets/icons/dot.png',
                              width: 5,
                              height: 5,
                            ),
                          ),
                      ],
                    ),
                    const SizedBox(height: 6.6),
                    Row(
                      children: [
                        Image.asset(
                          isRead
                              ? 'assets/icons/calendar50%.png'
                              : 'assets/icons/calendar_gray.png', 
                          width: 10,
                          height: 10,
                        ),
                        const SizedBox(width: 4),
                        Text(
                          date,
                          style: isRead
                              ? TextStyle(
                                  fontFamily: 'Gilroy',
                                  fontWeight: FontWeight.w400,
                                  fontSize: 10,
                                  color: const Color(0xFF949494).withValues(alpha: 0.5), // gray94 50%
                                )
                              : Font.regular.fs10.gray94(), 
                        ),
                      ],
                    ),
                    const SizedBox(height: 10), 
                  ],
                ),
              ),
              if (!isRead) 
                const SizedBox(width: 20),
            ],
          ),
        ),
      ),
    );
  }
}