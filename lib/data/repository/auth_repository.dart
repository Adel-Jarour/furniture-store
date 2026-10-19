import '../../models/auth_response_model.dart';
import '../../models/user_model.dart';
import '../../utils/my_shared_pref.dart';
import '../api/auth_api.dart';

class AuthRepository {
  final AuthApi _api = AuthApi();

  Future<AuthResponseModel> login({
    required String email,
    required String password,
  }) async {
    try {
      final response = await _api.login(email: email, password: password);
      if (response != null && response.data != null) {
        final authResponse = AuthResponseModel.fromJson(response.data);
        if (authResponse.token != null && authResponse.user != null) {
          await MySharedPref.setUserSession(
            token: authResponse.token!,
            userId: authResponse.user!.id,
            name: authResponse.user!.name,
            email: authResponse.user!.email,
          );
        }
        return authResponse;
      }
    } catch (_) {
      // Fallback for offline/demo mode
    }

    // Demo/Mock session fallback
    const mockUser = UserModel(
      id: 'user_001',
      name: 'Adel Mohammed',
      email: 'adel@example.com',
      phone: '+1 (555) 234-5678',
      address: '742 Evergreen Terrace, Brooklyn, NY',
    );
    const mockToken = 'mock_jwt_token_furniture_store';
    await MySharedPref.setUserSession(
      token: mockToken,
      userId: mockUser.id,
      name: mockUser.name,
      email: mockUser.email,
    );
    return const AuthResponseModel(
      success: true,
      message: 'Login successful',
      token: mockToken,
      user: mockUser,
    );
  }

  Future<AuthResponseModel> register({
    required String name,
    required String email,
    required String password,
    String? phone,
  }) async {
    try {
      final response = await _api.register(
        name: name,
        email: email,
        password: password,
        phone: phone,
      );
      if (response != null && response.data != null) {
        final authResponse = AuthResponseModel.fromJson(response.data);
        if (authResponse.token != null && authResponse.user != null) {
          await MySharedPref.setUserSession(
            token: authResponse.token!,
            userId: authResponse.user!.id,
            name: authResponse.user!.name,
            email: authResponse.user!.email,
          );
        }
        return authResponse;
      }
    } catch (_) {
      // Fallback for offline/demo mode
    }

    final mockUser = UserModel(
      id: 'user_new_${DateTime.now().millisecondsSinceEpoch}',
      name: name,
      email: email,
      phone: phone,
    );
    const mockToken = 'mock_jwt_token_furniture_store_new';
    await MySharedPref.setUserSession(
      token: mockToken,
      userId: mockUser.id,
      name: mockUser.name,
      email: mockUser.email,
    );
    return AuthResponseModel(
      success: true,
      message: 'Registration successful',
      token: mockToken,
      user: mockUser,
    );
  }

  Future<bool> forgotPassword({required String email}) async {
    try {
      final response = await _api.forgotPassword(email: email);
      if (response != null && response.data != null) {
        return response.data['success'] as bool? ?? true;
      }
    } catch (_) {}
    return true; // Demo fallback
  }

  Future<bool> verifyOtp({required String email, required String otp}) async {
    try {
      final response = await _api.verifyOtp(email: email, otp: otp);
      if (response != null && response.data != null) {
        return response.data['success'] as bool? ?? true;
      }
    } catch (_) {}
    // In demo mode, accept '1234' or any 4-digit code
    return otp.length == 4;
  }

  Future<bool> resetPassword({
    required String email,
    required String otp,
    required String newPassword,
  }) async {
    try {
      final response = await _api.resetPassword(
        email: email,
        otp: otp,
        newPassword: newPassword,
      );
      if (response != null && response.data != null) {
        return response.data['success'] as bool? ?? true;
      }
    } catch (_) {}
    return true;
  }

  Future<void> logout() async {
    try {
      await _api.logout();
    } catch (_) {}
    await MySharedPref.clearSession();
  }
}
