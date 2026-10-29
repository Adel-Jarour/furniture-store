import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../data/repository/auth_repository.dart';
import '../routes/app_routes.dart';
import '../utils/app_snack_bar.dart';

class PasswordManagerController extends GetxController {
  final AuthRepository _authRepository = AuthRepository();

  final TextEditingController currentPasswordController =
      TextEditingController();
  final TextEditingController newPasswordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();

  bool obscureCurrent = true;
  bool obscureNew = true;
  bool obscureConfirm = true;
  bool isLoading = false;

  void toggleObscureCurrent() {
    obscureCurrent = !obscureCurrent;
    update();
  }

  void toggleObscureNew() {
    obscureNew = !obscureNew;
    update();
  }

  void toggleObscureConfirm() {
    obscureConfirm = !obscureConfirm;
    update();
  }

  void onForgotPassword() {
    Get.toNamed(AppRoutes.forgotPassword);
  }

  Future<void> changePassword() async {
    final current = currentPasswordController.text.trim();
    final newPass = newPasswordController.text.trim();
    final confirmPass = confirmPasswordController.text.trim();

    if (current.isEmpty) {
      AppSnackBar.showError(message: 'Please enter your current password');
      return;
    }
    if (newPass.length < 6) {
      AppSnackBar.showError(
          message: 'New password must be at least 6 characters');
      return;
    }
    if (newPass != confirmPass) {
      AppSnackBar.showError(message: 'Passwords do not match');
      return;
    }

    try {
      isLoading = true;
      update();

      await _authRepository.changePassword(
        currentPassword: current,
        newPassword: newPass,
      );

      AppSnackBar.showSuccess(
        title: 'Success',
        message: 'Password changed successfully',
      );
      Get.back();
    } catch (_) {
      AppSnackBar.showError(message: 'Failed to change password');
    } finally {
      isLoading = false;
      update();
    }
  }

  @override
  void onClose() {
    currentPasswordController.dispose();
    newPasswordController.dispose();
    confirmPasswordController.dispose();
    super.onClose();
  }
}
