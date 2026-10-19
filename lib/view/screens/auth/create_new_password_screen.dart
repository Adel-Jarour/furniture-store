import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../const/color_const.dart';
import '../../../controller/auth_controller.dart';

class CreateNewPasswordScreen extends StatelessWidget {
  const CreateNewPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AuthController>(
      builder: (controller) {
        return Scaffold(
          backgroundColor: Colors.white,
          body: SafeArea(
            child: SingleChildScrollView(
              padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 16.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // ── Back Button ────────────────────────────────────
                  Align(
                    alignment: Alignment.centerLeft,
                    child: GestureDetector(
                      onTap: () => Get.back(),
                      child: Container(
                        width: 44.r,
                        height: 44.r,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.white,
                          border: Border.all(
                            color: const Color(0xFFE5E7EB),
                            width: 1.w,
                          ),
                        ),
                        alignment: Alignment.center,
                        child: Icon(
                          Icons.arrow_back,
                          size: 20.r,
                          color: ColorConst.textBlackColor,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 24.h),

                  // ── Title & Subtitle ───────────────────────────────
                  Text(
                    'New Password',
                    style: TextStyle(
                      fontSize: 26.sp,
                      fontWeight: FontWeight.bold,
                      color: ColorConst.textBlackColor,
                    ),
                  ),
                  SizedBox(height: 8.h),
                  Text(
                    'Your new password must be different\nfrom previously used passwords.',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 13.sp,
                      color: ColorConst.textGreyColor,
                      height: 1.4,
                    ),
                  ),
                  SizedBox(height: 36.h),

                  // ── Password Field ─────────────────────────────────
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Password',
                      style: TextStyle(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w600,
                        color: ColorConst.textBlackColor,
                      ),
                    ),
                  ),
                  SizedBox(height: 8.h),
                  Container(
                    height: 52.h,
                    padding: EdgeInsets.symmetric(horizontal: 16.w),
                    decoration: BoxDecoration(
                      color: const Color(0xFFF7F8F9),
                      borderRadius: BorderRadius.circular(12.r),
                    ),
                    child: Row(
                      children: [
                        Expanded(
                          child: TextField(
                            controller: controller.newPasswordController,
                            obscureText: controller.isNewPasswordHidden,
                            style: TextStyle(
                              fontSize: 14.sp,
                              color: ColorConst.textBlackColor,
                            ),
                            decoration: const InputDecoration(
                              hintText: '****************',
                              hintStyle: TextStyle(
                                color: Color(0xFF9CA3AF),
                                letterSpacing: 2,
                              ),
                              border: InputBorder.none,
                              isDense: true,
                              contentPadding: EdgeInsets.zero,
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: controller.toggleNewPasswordVisibility,
                          child: Icon(
                            controller.isNewPasswordHidden
                                ? Icons.visibility_off_outlined
                                : Icons.visibility_outlined,
                            size: 20.r,
                            color: ColorConst.textBlackColor,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 20.h),

                  // ── Confirm Password Field ─────────────────────────
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Confirm Password',
                      style: TextStyle(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w600,
                        color: ColorConst.textBlackColor,
                      ),
                    ),
                  ),
                  SizedBox(height: 8.h),
                  Container(
                    height: 52.h,
                    padding: EdgeInsets.symmetric(horizontal: 16.w),
                    decoration: BoxDecoration(
                      color: const Color(0xFFF7F8F9),
                      borderRadius: BorderRadius.circular(12.r),
                    ),
                    child: Row(
                      children: [
                        Expanded(
                          child: TextField(
                            controller: controller.confirmPasswordController,
                            obscureText: controller.isConfirmPasswordHidden,
                            style: TextStyle(
                              fontSize: 14.sp,
                              color: ColorConst.textBlackColor,
                            ),
                            decoration: const InputDecoration(
                              hintText: '****************',
                              hintStyle: TextStyle(
                                color: Color(0xFF9CA3AF),
                                letterSpacing: 2,
                              ),
                              border: InputBorder.none,
                              isDense: true,
                              contentPadding: EdgeInsets.zero,
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: controller.toggleConfirmPasswordVisibility,
                          child: Icon(
                            controller.isConfirmPasswordHidden
                                ? Icons.visibility_off_outlined
                                : Icons.visibility_outlined,
                            size: 20.r,
                            color: ColorConst.textBlackColor,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 36.h),

                  // ── Create New Password Button ─────────────────────
                  SizedBox(
                    width: double.infinity,
                    height: 52.h,
                    child: ElevatedButton(
                      onPressed: controller.isLoading
                          ? null
                          : controller.resetPassword,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: ColorConst.primaryColor,
                        foregroundColor: Colors.white,
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(28.r),
                        ),
                      ),
                      child: controller.isLoading
                          ? SizedBox(
                              width: 22.r,
                              height: 22.r,
                              child: const CircularProgressIndicator(
                                color: Colors.white,
                                strokeWidth: 2,
                              ),
                            )
                          : Text(
                              'Create New Password',
                              style: TextStyle(
                                fontSize: 16.sp,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
