import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:pinput/pinput.dart';
import '../../../const/color_const.dart';
import '../../../controller/auth_controller.dart';

class OtpVerificationScreen extends StatelessWidget {
  const OtpVerificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AuthController>(
      init: AuthController(),
      builder: (controller) {
        final defaultPinTheme = PinTheme(
          width: 58.w,
          height: 58.h,
          textStyle: TextStyle(
            fontSize: 22.sp,
            fontWeight: FontWeight.bold,
            color: ColorConst.textBlackColor,
          ),
          decoration: BoxDecoration(
            color: const Color(0xFFF7F8F9),
            borderRadius: BorderRadius.circular(14.r),
          ),
        );

        final focusedPinTheme = defaultPinTheme.copyWith(
          decoration: BoxDecoration(
            color: const Color(0xFFF7F8F9),
            borderRadius: BorderRadius.circular(14.r),
            border: Border.all(color: ColorConst.primaryColor, width: 1.5.w),
          ),
        );

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
                    'Verify Code',
                    style: TextStyle(
                      fontSize: 26.sp,
                      fontWeight: FontWeight.bold,
                      color: ColorConst.textBlackColor,
                    ),
                  ),
                  SizedBox(height: 10.h),
                  Text(
                    'Please enter the code we just sent to email',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 13.sp,
                      color: ColorConst.textGreyColor,
                    ),
                  ),
                  SizedBox(height: 4.h),
                  Text(
                    controller.forgotEmailController.text.isNotEmpty
                        ? controller.forgotEmailController.text
                        : 'example@email.com',
                    style: TextStyle(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w600,
                      color: ColorConst.primaryColor,
                    ),
                  ),
                  SizedBox(height: 36.h),

                  // ── 4-Digit Pinput Boxes ───────────────────────────
                  Pinput(
                    length: 4,
                    controller: controller.otpController,
                    defaultPinTheme: defaultPinTheme,
                    focusedPinTheme: focusedPinTheme,
                    showCursor: true,
                    onCompleted: (pin) => controller.verifyOtp(),
                  ),
                  SizedBox(height: 32.h),

                  // ── Didn't receive OTP? Resend code ────────────────
                  Column(
                    children: [
                      Text(
                        'Didn’t receive OTP?',
                        style: TextStyle(
                          fontSize: 13.sp,
                          color: ColorConst.textGreyColor,
                        ),
                      ),
                      SizedBox(height: 4.h),
                      GestureDetector(
                        onTap: controller.resendCountdown == 0
                            ? controller.startResendTimer
                            : null,
                        child: Text(
                          controller.resendCountdown > 0
                              ? 'Resend code (${controller.resendCountdown}s)'
                              : 'Resend code',
                          style: TextStyle(
                            fontSize: 13.sp,
                            fontWeight: FontWeight.bold,
                            color: ColorConst.primaryColor,
                            decoration: TextDecoration.underline,
                            decorationColor: ColorConst.primaryColor,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 36.h),

                  // ── Verify Button ──────────────────────────────────
                  SizedBox(
                    width: double.infinity,
                    height: 52.h,
                    child: ElevatedButton(
                      onPressed:
                          controller.isLoading ? null : controller.verifyOtp,
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
                              'Verify',
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
