import 'package:get/get.dart';
import '../models/notification_model.dart';

class NotificationController extends GetxController {
  int newCount = 2;

  final List<NotificationModel> todayNotifications = const [
    NotificationModel(
      id: 'n1',
      title: 'Order Shipped',
      type: 'order',
      time: '1h',
      body:
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.',
    ),
    NotificationModel(
      id: 'n2',
      title: 'Flash Sale Alert',
      type: 'promo',
      time: '1h',
      body:
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.',
    ),
    NotificationModel(
      id: 'n3',
      title: 'Product Review Request',
      type: 'review',
      time: '1h',
      body:
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis',
    ),
  ];

  final List<NotificationModel> yesterdayNotifications = const [
    NotificationModel(
      id: 'n4',
      title: 'Order Shipped',
      type: 'order',
      time: '1d',
      body:
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.',
      isRead: true,
    ),
    NotificationModel(
      id: 'n5',
      title: 'New Paypal Added',
      type: 'payment',
      time: '1d',
      body:
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.',
      isRead: true,
    ),
    NotificationModel(
      id: 'n6',
      title: 'Flash Sale Alert',
      type: 'promo',
      time: '1d',
      body:
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.',
      isRead: true,
    ),
  ];

  void markAllRead() {
    newCount = 0;
    update();
  }
}
