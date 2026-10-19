import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../data/repository/auth_repository.dart';
import '../routes/app_routes.dart';
import '../utils/app_snack_bar.dart';
import '../utils/my_shared_pref.dart';

class AuthController extends GetxController {
  final AuthRepository _repository = AuthRepository();

  bool isLoading = false;

  // ── Login Controllers ────────────────────────────────────────
  final TextEditingController loginEmailController = TextEditingController();
  final TextEditingController loginPasswordController = TextEditingController();
  bool isLoginPasswordHidden = true;

  // ── Sign Up Controllers ──────────────────────────────────────
  final TextEditingController signupNameController = TextEditingController();
  final TextEditingController signupEmailController = TextEditingController();
  final TextEditingController signupPasswordController =
      TextEditingController();
  bool isSignupPasswordHidden = true;
  bool agreeToTerms = false;

  // ── Complete Profile Controllers ─────────────────────────────
  final TextEditingController profileNameController = TextEditingController();
  final TextEditingController profilePhoneController = TextEditingController();
  String selectedCountryCode = '+1';
  String selectedGender = 'Select';
  final List<String> genderOptions = ['Select', 'Male', 'Female', 'Other'];

  // ── Forgot Password & OTP ────────────────────────────────────
  final TextEditingController forgotEmailController = TextEditingController();
  final TextEditingController otpController = TextEditingController();
  int resendCountdown = 30;
  Timer? _countdownTimer;

  // ── New Password ─────────────────────────────────────────────
  final TextEditingController newPasswordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();
  bool isNewPasswordHidden = true;
  bool isConfirmPasswordHidden = true;

  void toggleLoginPasswordVisibility() {
    isLoginPasswordHidden = !isLoginPasswordHidden;
    update();
  }

  void toggleSignupPasswordVisibility() {
    isSignupPasswordHidden = !isSignupPasswordHidden;
    update();
  }

  void toggleNewPasswordVisibility() {
    isNewPasswordHidden = !isNewPasswordHidden;
    update();
  }

  void toggleConfirmPasswordVisibility() {
    isConfirmPasswordHidden = !isConfirmPasswordHidden;
    update();
  }

  void toggleAgreeToTerms(bool? val) {
    agreeToTerms = val ?? false;
    update();
  }

  void setGender(String gender) {
    selectedGender = gender;
    update();
  }

  void setCountryCode(String code) {
    selectedCountryCode = code;
    update();
  }

  // --- Login ---
  Future<void> login() async {
    final email = loginEmailController.text.trim();
    final password = loginPasswordController.text;

    if (email.isEmpty || !GetUtils.isEmail(email)) {
      AppSnackBar.showError(message: 'Please enter a valid email address');
      return;
    }
    if (password.isEmpty || password.length < 6) {
      AppSnackBar.showError(message: 'Password must be at least 6 characters');
      return;
    }

    try {
      isLoading = true;
      update();

      final result = await _repository.login(email: email, password: password);
      if (result.success) {
        await MySharedPref.setIsLoggedIn(true);
        AppSnackBar.showSuccess(
          title: 'Welcome Back!',
          message: 'Signed in successfully as ${result.user?.name ?? email}',
        );
        Get.offAllNamed(AppRoutes.bottomNav);
      } else {
        AppSnackBar.showError(message: result.message);
      }
    } catch (e) {
      AppSnackBar.showError(message: 'Failed to sign in. Please try again.');
    } finally {
      isLoading = false;
      update();
    }
  }

  // --- Sign Up (Navigates to Complete Profile) ---
  Future<void> register() async {
    final name = signupNameController.text.trim();
    final email = signupEmailController.text.trim();
    final password = signupPasswordController.text;

    if (name.isEmpty) {
      AppSnackBar.showError(message: 'Please enter your name');
      return;
    }
    if (email.isEmpty || !GetUtils.isEmail(email)) {
      AppSnackBar.showError(message: 'Please enter a valid email address');
      return;
    }
    if (password.isEmpty || password.length < 6) {
      AppSnackBar.showError(message: 'Password must be at least 6 characters');
      return;
    }
    if (!agreeToTerms) {
      AppSnackBar.showError(
        message: 'Please agree with Terms & Condition',
      );
      return;
    }

    // Prefill profile name
    profileNameController.text = name;

    // Proceed to Complete Your Profile screen
    Get.toNamed(AppRoutes.completeProfile);
  }

  // --- Complete Profile ---
  Future<void> completeProfile() async {
    final name = profileNameController.text.trim();
    final phone = profilePhoneController.text.trim();

    if (name.isEmpty) {
      AppSnackBar.showError(message: 'Please enter your name');
      return;
    }

    try {
      isLoading = true;
      update();

      final result = await _repository.register(
        name: name,
        email: signupEmailController.text.trim().isNotEmpty
            ? signupEmailController.text.trim()
            : 'john.doe@example.com',
        password: signupPasswordController.text.isNotEmpty
            ? signupPasswordController.text
            : 'password123',
        phone: phone.isNotEmpty ? '$selectedCountryCode $phone' : null,
      );

      if (result.success) {
        await MySharedPref.setIsLoggedIn(true);
        AppSnackBar.showSuccess(
          title: 'Profile Completed',
          message: 'Welcome to Furniture Store, $name!',
        );
        Get.offAllNamed(AppRoutes.bottomNav);
      } else {
        AppSnackBar.showError(message: result.message);
      }
    } catch (_) {
      AppSnackBar.showError(message: 'Failed to complete profile.');
    } finally {
      isLoading = false;
      update();
    }
  }

  // --- Forgot Password ---
  Future<void> sendForgotPassword() async {
    final email = forgotEmailController.text.trim();
    if (email.isEmpty || !GetUtils.isEmail(email)) {
      AppSnackBar.showError(message: 'Please enter a valid email address');
      return;
    }

    try {
      isLoading = true;
      update();

      final success = await _repository.forgotPassword(email: email);
      if (success) {
        AppSnackBar.showSuccess(
          title: 'Code Sent',
          message: 'A 4-digit verification code was sent to $email',
        );
        startResendTimer();
        Get.toNamed(AppRoutes.otpVerification);
      } else {
        AppSnackBar.showError(message: 'Could not send verification code.');
      }
    } catch (_) {
      AppSnackBar.showError(message: 'Something went wrong.');
    } finally {
      isLoading = false;
      update();
    }
  }

  // --- OTP Verification ---
  void startResendTimer() {
    resendCountdown = 30;
    _countdownTimer?.cancel();
    _countdownTimer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (resendCountdown > 0) {
        resendCountdown--;
        update();
      } else {
        timer.cancel();
      }
    });
  }

  Future<void> verifyOtp() async {
    final code = otpController.text.trim();
    if (code.length != 4) {
      AppSnackBar.showError(message: 'Please enter the 4-digit code');
      return;
    }

    try {
      isLoading = true;
      update();

      final success = await _repository.verifyOtp(
        email: forgotEmailController.text.trim().isNotEmpty
            ? forgotEmailController.text.trim()
            : 'example@email.com',
        otp: code,
      );

      if (success) {
        AppSnackBar.showSuccess(
          title: 'Verified',
          message: 'Code verified successfully',
        );
        Get.toNamed(AppRoutes.resetPassword);
      } else {
        AppSnackBar.showError(message: 'Invalid code. Try 1234');
      }
    } catch (_) {
      AppSnackBar.showError(message: 'Verification failed.');
    } finally {
      isLoading = false;
      update();
    }
  }

  // --- Reset / New Password ---
  Future<void> resetPassword() async {
    final newPass = newPasswordController.text;
    final confirmPass = confirmPasswordController.text;

    if (newPass.isEmpty || newPass.length < 6) {
      AppSnackBar.showError(message: 'Password must be at least 6 characters');
      return;
    }
    if (newPass != confirmPass) {
      AppSnackBar.showError(message: 'Passwords do not match');
      return;
    }

    try {
      isLoading = true;
      update();

      final success = await _repository.resetPassword(
        email: forgotEmailController.text.trim(),
        otp: otpController.text.trim(),
        newPassword: newPass,
      );

      if (success) {
        AppSnackBar.showSuccess(
          title: 'Password Updated',
          message: 'You can now sign in with your new password',
        );
        Get.offAllNamed(AppRoutes.login);
      } else {
        AppSnackBar.showError(message: 'Failed to reset password');
      }
    } catch (_) {
      AppSnackBar.showError(message: 'Error resetting password');
    } finally {
      isLoading = false;
      update();
    }
  }

  // --- Social Login Mock ---
  Future<void> socialLogin(String provider) async {
    isLoading = true;
    update();
    await Future.delayed(const Duration(milliseconds: 600));

    final mockName = provider == 'Google'
        ? 'Google User'
        : provider == 'Apple'
            ? 'Apple User'
            : 'Facebook User';
    final mockEmail = '${provider.toLowerCase()}_user@example.com';

    await _repository.login(email: mockEmail, password: 'password123');
    await MySharedPref.setIsLoggedIn(true);

    isLoading = false;
    update();

    AppSnackBar.showSuccess(
      title: 'Signed in with $provider',
      message: 'Welcome $mockName!',
    );
    Get.offAllNamed(AppRoutes.bottomNav);
  }

  @override
  void onClose() {
    _countdownTimer?.cancel();
    loginEmailController.dispose();
    loginPasswordController.dispose();
    signupNameController.dispose();
    signupEmailController.dispose();
    signupPasswordController.dispose();
    profileNameController.dispose();
    profilePhoneController.dispose();
    forgotEmailController.dispose();
    otpController.dispose();
    newPasswordController.dispose();
    confirmPasswordController.dispose();
    super.onClose();
  }
}
