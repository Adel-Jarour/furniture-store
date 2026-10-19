import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../const/color_const.dart';
import '../../../controller/auth_controller.dart';

class ForgotPasswordScreen extends StatelessWidget {
  const ForgotPasswordScreen({super.key});

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
                    'Forgot Password',
                    style: TextStyle(
                      fontSize: 26.sp,
                      fontWeight: FontWeight.bold,
                      color: ColorConst.textBlackColor,
                    ),
                  ),
                  SizedBox(height: 8.h),
                  Text(
                    'Enter your registered email below to\nreceive your verification code.',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 13.sp,
                      color: ColorConst.textGreyColor,
                      height: 1.4,
                    ),
                  ),
                  SizedBox(height: 36.h),

                  // ── Email Field ────────────────────────────────────
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Email',
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
                    alignment: Alignment.centerLeft,
                    child: TextField(
                      controller: controller.forgotEmailController,
                      keyboardType: TextInputType.emailAddress,
                      style: TextStyle(
                        fontSize: 14.sp,
                        color: ColorConst.textBlackColor,
                      ),
                      decoration: const InputDecoration(
                        hintText: 'example@gmail.com',
                        hintStyle: TextStyle(
                          color: Color(0xFF9CA3AF),
                        ),
                        border: InputBorder.none,
                        isDense: true,
                        contentPadding: EdgeInsets.zero,
                      ),
                    ),
                  ),
                  SizedBox(height: 36.h),

                  // ── Send Code Button ───────────────────────────────
                  SizedBox(
                    width: double.infinity,
                    height: 52.h,
                    child: ElevatedButton(
                      onPressed: controller.isLoading
                          ? null
                          : controller.sendForgotPassword,
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
                              'Send Code',
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
