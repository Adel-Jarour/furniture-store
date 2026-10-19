import 'package:dio/dio.dart';
import '../../config/api_config.dart';
import '../../config/base_client.dart';

class PaymentApi {
  final BaseClient _client = BaseClient();

  Future<Response?> getCards() async {
    return await _client.get(ApiConfig.paymentMethods);
  }

  Future<Response?> addCard(Map<String, dynamic> cardData) async {
    return await _client.post(ApiConfig.paymentMethods, data: cardData);
  }

  Future<Response?> setDefaultCard(String cardId) async {
    return await _client.put('${ApiConfig.paymentMethods}/$cardId/default');
  }

  Future<Response?> confirmPayment(Map<String, dynamic> paymentData) async {
    return await _client.post(ApiConfig.checkout, data: paymentData);
  }
}
