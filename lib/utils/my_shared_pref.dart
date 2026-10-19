import 'package:shared_preferences/shared_preferences.dart';

class MySharedPref {
  static SharedPreferences? _preferences;

  // Storage Keys
  static const String _keyToken = 'auth_token';
  static const String _keyUserId = 'user_id';
  static const String _keyUserName = 'user_name';
  static const String _keyUserEmail = 'user_email';
  static const String _keyIsLoggedIn = 'is_logged_in';
  static const String _keyIsOnboarded = 'is_onboarded';
  static const String _keySelectedLocation = 'selected_location';
  static const String _keyThemeMode = 'theme_mode';

  // Initialize SharedPreferences singleton
  static Future<void> init() async {
    _preferences ??= await SharedPreferences.getInstance();
  }

  // Theme Mode
  static Future<bool> setThemeMode(String mode) async {
    return await _preferences?.setString(_keyThemeMode, mode) ?? false;
  }

  static String getThemeMode() =>
      _preferences?.getString(_keyThemeMode) ?? 'light';

  // Auth Token
  static Future<bool> setAuthToken(String token) async {
    return await _preferences?.setString(_keyToken, token) ?? false;
  }

  static String getAuthToken() {
    return _preferences?.getString(_keyToken) ?? '';
  }

  // Login State
  static Future<bool> setIsLoggedIn(bool isLoggedIn) async {
    return await _preferences?.setBool(_keyIsLoggedIn, isLoggedIn) ?? false;
  }

  static bool isLoggedIn() {
    return _preferences?.getBool(_keyIsLoggedIn) ?? false;
  }

  // Onboarding State
  static Future<bool> setIsOnboarded(bool isOnboarded) async {
    return await _preferences?.setBool(_keyIsOnboarded, isOnboarded) ?? false;
  }

  static bool isOnboarded() {
    return _preferences?.getBool(_keyIsOnboarded) ?? false;
  }

  // User Profile Data
  static Future<void> setUserSession({
    required String token,
    required String userId,
    required String name,
    required String email,
  }) async {
    await setAuthToken(token);
    await setIsLoggedIn(true);
    await _preferences?.setString(_keyUserId, userId);
    await _preferences?.setString(_keyUserName, name);
    await _preferences?.setString(_keyUserEmail, email);
  }

  static String getUserId() => _preferences?.getString(_keyUserId) ?? '';
  static String getUserName() => _preferences?.getString(_keyUserName) ?? '';
  static String getUserEmail() => _preferences?.getString(_keyUserEmail) ?? '';

  // Location
  static Future<bool> setSelectedLocation(String location) async {
    return await _preferences?.setString(_keySelectedLocation, location) ??
        false;
  }

  static String getSelectedLocation() {
    return _preferences?.getString(_keySelectedLocation) ?? 'New York, USA';
  }

  // Clear Session
  static Future<void> clearSession() async {
    await _preferences?.clear();
  }
}
