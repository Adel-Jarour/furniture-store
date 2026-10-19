import 'package:dio/dio.dart';
import '../../config/api_config.dart';
import '../../config/base_client.dart';

class HomeApi {
  final BaseClient _client = BaseClient();

  Future<Response?> getBanners() async {
    return await _client.get(ApiConfig.banners);
  }

  Future<Response?> getCategories() async {
    return await _client.get(ApiConfig.categories);
  }

  Future<Response?> getFlashSaleProducts() async {
    return await _client.get(ApiConfig.flashSale);
  }

  Future<Response?> getPopularProducts() async {
    return await _client.get(ApiConfig.popularProducts);
  }

  Future<Response?> getWishlist() async {
    return await _client.get(ApiConfig.wishlist);
  }

  Future<Response?> toggleWishlist(String productId) async {
    return await _client.post(
      ApiConfig.wishlist,
      data: {'product_id': productId},
    );
  }

  Future<Response?> getChatConversations() async {
    return await _client.get(ApiConfig.chatConversations);
  }
}
