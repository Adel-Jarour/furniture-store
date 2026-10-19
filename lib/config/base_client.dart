import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import '../config/api_config.dart';
import '../utils/my_shared_pref.dart';

class BaseClient {
  static final BaseClient _instance = BaseClient._internal();
  factory BaseClient() => _instance;

  late final Dio _dio;

  BaseClient._internal() {
    _dio = Dio(
      BaseOptions(
        baseUrl: ApiConfig.baseUrl,
        connectTimeout: ApiConfig.connectTimeout,
        receiveTimeout: ApiConfig.receiveTimeout,
        responseType: ResponseType.json,
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
        },
      ),
    );

    // Request & Auth Token Interceptor
    _dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) {
          final token = MySharedPref.getAuthToken();
          if (token.isNotEmpty) {
            options.headers['Authorization'] = 'Bearer $token';
          }
          return handler.next(options);
        },
        onError: (DioException e, handler) {
          if (e.response?.statusCode == 401) {
            // Handle unauthorized - clear token
            MySharedPref.clearSession();
          }
          return handler.next(e);
        },
      ),
    );

    // Logging in debug mode
    if (kDebugMode) {
      _dio.interceptors.add(
        PrettyDioLogger(
          requestHeader: true,
          requestBody: true,
          responseBody: true,
          responseHeader: false,
          error: true,
          compact: true,
        ),
      );
    }
  }

  // GET request
  Future<Response?> get(
    String path, {
    Map<String, dynamic>? queryParameters,
    Options? options,
  }) async {
    try {
      final response = await _dio.get(
        path,
        queryParameters: queryParameters,
        options: options,
      );
      return response;
    } on DioException catch (e) {
      _handleDioError(e);
      return null;
    }
  }

  // POST request
  Future<Response?> post(
    String path, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    Options? options,
  }) async {
    try {
      final response = await _dio.post(
        path,
        data: data,
        queryParameters: queryParameters,
        options: options,
      );
      return response;
    } on DioException catch (e) {
      _handleDioError(e);
      return null;
    }
  }

  // PUT request
  Future<Response?> put(
    String path, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    Options? options,
  }) async {
    try {
      final response = await _dio.put(
        path,
        data: data,
        queryParameters: queryParameters,
        options: options,
      );
      return response;
    } on DioException catch (e) {
      _handleDioError(e);
      return null;
    }
  }

  // DELETE request
  Future<Response?> delete(
    String path, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    Options? options,
  }) async {
    try {
      final response = await _dio.delete(
        path,
        data: data,
        queryParameters: queryParameters,
        options: options,
      );
      return response;
    } on DioException catch (e) {
      _handleDioError(e);
      return null;
    }
  }

  void _handleDioError(DioException error) {
    if (kDebugMode) {
      debugPrint('[BaseClient Error] [${error.type}] -> ${error.message}');
    }
  }
}
