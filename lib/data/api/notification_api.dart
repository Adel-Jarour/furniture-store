import 'package:dio/dio.dart';
import '../../config/api_config.dart';
import '../../config/base_client.dart';

class NotificationApi {
  final BaseClient _client = BaseClient();

  Future<Response?> getNotifications() async {
    return await _client.get(ApiConfig.notifications);
  }

  Future<Response?> markAllAsRead() async {
    return await _client.post('${ApiConfig.notifications}/mark-read');
  }
}
