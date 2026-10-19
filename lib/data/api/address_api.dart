import 'package:dio/dio.dart';
import '../../config/api_config.dart';
import '../../config/base_client.dart';

class AddressApi {
  final BaseClient _client = BaseClient();

  Future<Response?> getAddresses() async {
    return await _client.get(ApiConfig.addresses);
  }

  Future<Response?> addAddress(Map<String, dynamic> addressData) async {
    return await _client.post(ApiConfig.addresses, data: addressData);
  }

  Future<Response?> selectAddress(String addressId) async {
    return await _client.put('${ApiConfig.addresses}/$addressId/select');
  }
}
