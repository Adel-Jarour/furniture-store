import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../const/color_const.dart';
import '../view/widgets/custom_button.dart';

class AppDialog {
  static Future<bool?> showConfirmation({
    required String title,
    required String message,
    String confirmText = 'Confirm',
    String cancelText = 'Cancel',
    Color confirmColor = ColorConst.primaryColor,
  }) async {
    return await Get.dialog<bool>(
      Dialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16.r),
        ),
        backgroundColor: ColorConst.cardBgColor,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 24.h),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                title,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 18.sp,
                  fontWeight: FontWeight.bold,
                  color: ColorConst.textBlackColor,
                ),
              ),
              SizedBox(height: 12.h),
              Text(
                message,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 14.sp,
                  color: ColorConst.textGreyColor,
                  height: 1.4,
                ),
              ),
              SizedBox(height: 24.h),
              Row(
                children: [
                  Expanded(
                    child: OutlinedButton(
                      onPressed: () => Get.back(result: false),
                      style: OutlinedButton.styleFrom(
                        side: BorderSide(
                            color: ColorConst.borderColor, width: 1.w),
                        padding: EdgeInsets.symmetric(vertical: 12.h),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(24.r),
                        ),
                      ),
                      child: Text(
                        cancelText,
                        style: TextStyle(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w600,
                          color: ColorConst.textGreyColor,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 12.w),
                  Expanded(
                    child: CustomButton(
                      text: confirmText,
                      onPressed: () => Get.back(result: true),
                      backgroundColor: confirmColor,
                      height: 44.h,
                      fontSize: 14.sp,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  static void showLoading({String message = 'Loading...'}) {
    Get.dialog(
      PopScope(
        canPop: false,
        child: Center(
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 20.h),
            decoration: BoxDecoration(
              color: ColorConst.cardBgColor,
              borderRadius: BorderRadius.circular(16.r),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withValues(alpha: 0.1),
                  blurRadius: 16,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                CircularProgressIndicator(
                  valueColor:
                      AlwaysStoppedAnimation<Color>(ColorConst.primaryColor),
                  strokeWidth: 3.w,
                ),
                SizedBox(height: 16.h),
                Text(
                  message,
                  style: TextStyle(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w500,
                    color: ColorConst.textBlackColor,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      barrierDismissible: false,
    );
  }

  static void hideLoading() {
    if (Get.isDialogOpen ?? false) {
      Get.back();
    }
  }
}
