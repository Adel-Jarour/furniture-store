import 'package:dio/dio.dart';
import '../../config/api_config.dart';
import '../../config/base_client.dart';

class SearchApi {
  final BaseClient _client = BaseClient();

  Future<Response?> searchProducts(String query) async {
    return await _client.get(
      ApiConfig.searchProducts,
      queryParameters: {'q': query},
    );
  }

  Future<Response?> getRecentSearches() async {
    return await _client.get(ApiConfig.searchRecent);
  }

  Future<Response?> searchLocations(String query) async {
    return await _client.get(
      ApiConfig.searchLocation,
      queryParameters: {'q': query},
    );
  }
}
