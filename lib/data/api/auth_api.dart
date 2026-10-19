import 'package:dio/dio.dart';
import '../../config/api_config.dart';
import '../../config/base_client.dart';

class AuthApi {
  final BaseClient _client = BaseClient();

  Future<Response?> login({
    required String email,
    required String password,
  }) async {
    return await _client.post(
      ApiConfig.login,
      data: {
        'email': email,
        'password': password,
      },
    );
  }

  Future<Response?> register({
    required String name,
    required String email,
    required String password,
    String? phone,
  }) async {
    return await _client.post(
      ApiConfig.register,
      data: {
        'name': name,
        'email': email,
        'password': password,
        if (phone != null) 'phone': phone,
      },
    );
  }

  Future<Response?> forgotPassword({
    required String email,
  }) async {
    return await _client.post(
      ApiConfig.forgotPassword,
      data: {'email': email},
    );
  }

  Future<Response?> verifyOtp({
    required String email,
    required String otp,
  }) async {
    return await _client.post(
      ApiConfig.verifyOtp,
      data: {
        'email': email,
        'otp': otp,
      },
    );
  }

  Future<Response?> resetPassword({
    required String email,
    required String otp,
    required String newPassword,
  }) async {
    return await _client.post(
      ApiConfig.resetPassword,
      data: {
        'email': email,
        'otp': otp,
        'new_password': newPassword,
      },
    );
  }

  Future<Response?> logout() async {
    return await _client.post(ApiConfig.logout);
  }

  Future<Response?> getProfile() async {
    return await _client.get(ApiConfig.profile);
  }
}
