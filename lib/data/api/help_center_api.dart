import 'package:dio/dio.dart';
import '../../config/api_config.dart';
import '../../config/base_client.dart';

class HelpCenterApi {
  final BaseClient _client = BaseClient();

  Future<Response?> getFaqs() async {
    return await _client.get(ApiConfig.faqs);
  }

  Future<Response?> getContactChannels() async {
    return await _client.get(ApiConfig.contactChannels);
  }
}
