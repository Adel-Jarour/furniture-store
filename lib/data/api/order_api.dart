import 'package:dio/dio.dart';
import '../../config/api_config.dart';
import '../../config/base_client.dart';

class OrderApi {
  final BaseClient _client = BaseClient();

  Future<Response?> getCart() async {
    return await _client.get(ApiConfig.cart);
  }

  Future<Response?> addToCart(Map<String, dynamic> data) async {
    return await _client.post(ApiConfig.cart, data: data);
  }

  Future<Response?> updateCartQuantity(String itemId, int quantity) async {
    return await _client
        .put('${ApiConfig.cart}/$itemId', data: {'quantity': quantity});
  }

  Future<Response?> removeFromCart(String itemId) async {
    return await _client.delete('${ApiConfig.cart}/$itemId');
  }

  Future<Response?> getShippingOptions() async {
    return await _client.get(ApiConfig.shippingOptions);
  }

  Future<Response?> getCoupons() async {
    return await _client.get(ApiConfig.coupons);
  }

  Future<Response?> applyCoupon(String code) async {
    return await _client.post(ApiConfig.applyCoupon, data: {'code': code});
  }

  Future<Response?> checkout(Map<String, dynamic> data) async {
    return await _client.post(ApiConfig.checkout, data: data);
  }

  Future<Response?> getOrders({String? status}) async {
    final query = status != null ? {'status': status} : null;
    return await _client.get(ApiConfig.orders, queryParameters: query);
  }

  Future<Response?> getOrderDetails(String orderId) async {
    return await _client.get('${ApiConfig.orders}/$orderId');
  }

  Future<Response?> getTrackingDetails(String orderId) async {
    return await _client.get('${ApiConfig.trackOrder}/$orderId');
  }
}
