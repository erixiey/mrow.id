import 'package:get/get.dart';

class NotificationController extends GetxController {
  RxList<Map<String, dynamic>> notifications = <Map<String, dynamic>>[
    {
      'title': 'Something Wrong!',
      'description': 'Your token payment failed. Try Again',
      'date': '12 June 2023, 09:42 AM',
      'isRead': false,
    },
    {
      'title': 'Success',
      'description': 'Your token payment failed. Try Again',
      'date': '12 June 2023, 09:42 AM',
      'isRead': false,
    },
    {
      'title': 'Information',
      'description': 'Your token payment failed. Try Again',
      'date': '12 June 2023, 09:42 AM',
      'isRead': false,
    },
  ].obs;

  void markAsRead(int index) {
    notifications[index]['isRead'] = true;
    notifications.refresh(); 
  }

  void deleteNotification(int index) {
    notifications.removeAt(index);
    notifications.refresh(); 
  }
}