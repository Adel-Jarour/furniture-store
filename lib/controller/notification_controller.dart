import 'package:get/get.dart';
import '../data/repository/notification_repository.dart';
import '../models/notification_model.dart';

class NotificationController extends GetxController {
  final NotificationRepository _repository = NotificationRepository();

  int newCount = 2;
  bool isLoading = false;
  List<NotificationModel> todayNotifications = [];
  List<NotificationModel> yesterdayNotifications = [];

  @override
  void onInit() {
    super.onInit();
    fetchNotifications();
  }

  Future<void> fetchNotifications() async {
    isLoading = true;
    update();
    todayNotifications = await _repository.getTodayNotifications();
    yesterdayNotifications = await _repository.getYesterdayNotifications();
    newCount = todayNotifications.where((n) => !n.isRead).length;
    isLoading = false;
    update();
  }

  void markAllRead() {
    newCount = 0;
    _repository.markAllAsRead();
    update();
  }
}
