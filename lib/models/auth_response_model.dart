import 'user_model.dart';

class AuthResponseModel {
  final bool success;
  final String message;
  final String? token;
  final UserModel? user;

  const AuthResponseModel({
    required this.success,
    required this.message,
    this.token,
    this.user,
  });

  factory AuthResponseModel.fromJson(Map<String, dynamic> json) {
    return AuthResponseModel(
      success: json['success'] as bool? ?? true,
      message: json['message']?.toString() ?? '',
      token: json['token']?.toString() ?? json['access_token']?.toString(),
      user: json['user'] != null
          ? UserModel.fromJson(json['user'] as Map<String, dynamic>)
          : (json['data'] != null && json['data'] is Map<String, dynamic>
              ? UserModel.fromJson(json['data'] as Map<String, dynamic>)
              : null),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'success': success,
      'message': message,
      'token': token,
      'user': user?.toJson(),
    };
  }
}
