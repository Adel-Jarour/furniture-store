import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../const/color_const.dart';

class AppSnackBar {
  static void showSuccess({
    required String message,
    String title = 'Success',
    Duration duration = const Duration(seconds: 3),
  }) {
    Get.snackbar(
      title,
      message,
      snackPosition: SnackPosition.TOP,
      backgroundColor: ColorConst.primaryColor,
      colorText: ColorConst.textWhiteColor,
      icon: Icon(
        Icons.check_circle_outline,
        color: ColorConst.textWhiteColor,
        size: 24.r,
      ),
      margin: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
      borderRadius: 12.r,
      duration: duration,
      boxShadows: [
        BoxShadow(
          color: Colors.black.withValues(alpha: 0.08),
          blurRadius: 10,
          offset: const Offset(0, 4),
        ),
      ],
    );
  }

  static void showError({
    required String message,
    String title = 'Error',
    Duration duration = const Duration(seconds: 3),
  }) {
    Get.snackbar(
      title,
      message,
      snackPosition: SnackPosition.TOP,
      backgroundColor: ColorConst.errorColor,
      colorText: ColorConst.textWhiteColor,
      icon: Icon(
        Icons.error_outline,
        color: ColorConst.textWhiteColor,
        size: 24.r,
      ),
      margin: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
      borderRadius: 12.r,
      duration: duration,
      boxShadows: [
        BoxShadow(
          color: Colors.black.withValues(alpha: 0.08),
          blurRadius: 10,
          offset: const Offset(0, 4),
        ),
      ],
    );
  }

  static void showInfo({
    required String message,
    String title = 'Info',
    Duration duration = const Duration(seconds: 3),
  }) {
    Get.snackbar(
      title,
      message,
      snackPosition: SnackPosition.TOP,
      backgroundColor: ColorConst.primaryDarkColor,
      colorText: ColorConst.textWhiteColor,
      icon: Icon(
        Icons.info_outline,
        color: ColorConst.accentColor,
        size: 24.r,
      ),
      margin: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
      borderRadius: 12.r,
      duration: duration,
    );
  }
}
