import 'package:dio/dio.dart';
import '../../config/api_config.dart';
import '../../config/base_client.dart';

class CatalogApi {
  final BaseClient _client = BaseClient();

  Future<Response?> getCategories() async {
    return await _client.get(ApiConfig.categories);
  }

  Future<Response?> getProductDetails(String id) async {
    return await _client.get('${ApiConfig.productDetails}/$id');
  }

  Future<Response?> filterProducts(Map<String, dynamic> queryParams) async {
    return await _client.get(ApiConfig.searchProducts,
        queryParameters: queryParams);
  }

  Future<Response?> submitReview(Map<String, dynamic> data) async {
    return await _client.post(
      '${ApiConfig.productDetails}/${data['product_id']}/reviews',
      data: data,
    );
  }
}
