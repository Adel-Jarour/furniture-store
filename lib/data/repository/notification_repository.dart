import '../../models/notification_model.dart';
import '../api/notification_api.dart';

class NotificationRepository {
  final NotificationApi _api = NotificationApi();

  final List<NotificationModel> _mockToday = const [
    NotificationModel(
      id: '1',
      title: 'Order Successful!',
      body: 'You have successfully made order #65289',
      time: '1h ago',
      type: 'order',
      isRead: false,
    ),
    NotificationModel(
      id: '2',
      title: '25% Special Discount',
      body: 'Special promotion for modern sofa collection',
      time: '2h ago',
      type: 'promo',
      isRead: false,
    ),
  ];

  final List<NotificationModel> _mockYesterday = const [
    NotificationModel(
      id: '3',
      title: 'New Services Available!',
      body: 'Now you can track order directly with live GPS',
      time: '1d ago',
      type: 'review',
      isRead: true,
    ),
    NotificationModel(
      id: '4',
      title: 'Credit Card Connected',
      body: 'Your Mastercard has been successfully linked',
      time: '1d ago',
      type: 'payment',
      isRead: true,
    ),
  ];

  Future<List<NotificationModel>> getTodayNotifications() async {
    try {
      final response = await _api.getNotifications();
      if (response != null && response.data != null) {
        final List list = response.data['today'] ?? [];
        return list.map((json) => NotificationModel.fromJson(json)).toList();
      }
    } catch (_) {}
    return List.from(_mockToday);
  }

  Future<List<NotificationModel>> getYesterdayNotifications() async {
    try {
      final response = await _api.getNotifications();
      if (response != null && response.data != null) {
        final List list = response.data['yesterday'] ?? [];
        return list.map((json) => NotificationModel.fromJson(json)).toList();
      }
    } catch (_) {}
    return List.from(_mockYesterday);
  }

  Future<void> markAllAsRead() async {
    try {
      await _api.markAllAsRead();
    } catch (_) {}
  }
}
