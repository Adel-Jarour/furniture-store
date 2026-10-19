import '../../models/auth_response_model.dart';
import '../../models/user_model.dart';
import '../../utils/my_shared_pref.dart';

class AuthRepository {
  Future<AuthResponseModel> login({
    required String email,
    required String password,
  }) async {
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
    return true;
  }

  Future<bool> verifyOtp({required String email, required String otp}) async {
    return otp.length == 4;
  }

  Future<bool> resetPassword({
    required String email,
    required String otp,
    required String newPassword,
  }) async {
    return true;
  }

  Future<void> logout() async {
    await MySharedPref.clearSession();
  }
}
