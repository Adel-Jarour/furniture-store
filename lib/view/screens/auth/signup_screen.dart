import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../const/color_const.dart';
import '../../../controller/auth_controller.dart';
import '../../../routes/app_routes.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AuthController>(
      init: AuthController(),
      builder: (controller) {
        return Scaffold(
          backgroundColor: Colors.white,
          body: SafeArea(
            child: SingleChildScrollView(
              padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 20.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(height: 24.h),

                  // ── Title & Subtitle ───────────────────────────────
                  Text(
                    'Create Account',
                    style: TextStyle(
                      fontSize: 26.sp,
                      fontWeight: FontWeight.bold,
                      color: ColorConst.textBlackColor,
                    ),
                  ),
                  SizedBox(height: 8.h),
                  Text(
                    'Fill your information below or register\nwith your social account.',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 13.sp,
                      color: ColorConst.textGreyColor,
                      height: 1.4,
                    ),
                  ),
                  SizedBox(height: 30.h),

                  // ── Name Field ─────────────────────────────────────
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Name',
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
                      controller: controller.signupNameController,
                      style: TextStyle(
                        fontSize: 14.sp,
                        color: ColorConst.textBlackColor,
                      ),
                      decoration: const InputDecoration(
                        hintText: 'John Doe',
                        hintStyle: TextStyle(
                          color: Color(0xFF9CA3AF),
                        ),
                        border: InputBorder.none,
                        isDense: true,
                        contentPadding: EdgeInsets.zero,
                      ),
                    ),
                  ),
                  SizedBox(height: 16.h),

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
                      controller: controller.signupEmailController,
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
                  SizedBox(height: 16.h),

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
                            controller: controller.signupPasswordController,
                            obscureText: controller.isSignupPasswordHidden,
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
                          onTap: controller.toggleSignupPasswordVisibility,
                          child: Icon(
                            controller.isSignupPasswordHidden
                                ? Icons.visibility_off_outlined
                                : Icons.visibility_outlined,
                            size: 20.r,
                            color: ColorConst.textBlackColor,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 16.h),

                  // ── Agree with Terms & Condition Checkbox ──────────
                  Row(
                    children: [
                      GestureDetector(
                        onTap: () => controller
                            .toggleAgreeToTerms(!controller.agreeToTerms),
                        child: Container(
                          width: 22.r,
                          height: 22.r,
                          decoration: BoxDecoration(
                            color: controller.agreeToTerms
                                ? ColorConst.primaryColor
                                : Colors.white,
                            borderRadius: BorderRadius.circular(6.r),
                            border: Border.all(
                              color: controller.agreeToTerms
                                  ? ColorConst.primaryColor
                                  : const Color(0xFF9CA3AF),
                              width: 1.5,
                            ),
                          ),
                          alignment: Alignment.center,
                          child: controller.agreeToTerms
                              ? Icon(Icons.check,
                                  size: 16.r, color: Colors.white)
                              : null,
                        ),
                      ),
                      SizedBox(width: 10.w),
                      RichText(
                        text: TextSpan(
                          style: TextStyle(
                            fontSize: 13.sp,
                            color: ColorConst.textBlackColor,
                            fontFamily: Theme.of(context)
                                .textTheme
                                .bodyMedium
                                ?.fontFamily,
                          ),
                          children: const [
                            TextSpan(text: 'Agree with '),
                            TextSpan(
                              text: 'Terms & Condition',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: ColorConst.primaryColor,
                                decoration: TextDecoration.underline,
                                decorationColor: ColorConst.primaryColor,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 28.h),

                  // ── Sign Up Button ─────────────────────────────────
                  SizedBox(
                    width: double.infinity,
                    height: 52.h,
                    child: ElevatedButton(
                      onPressed:
                          controller.isLoading ? null : controller.register,
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
                              'Sign Up',
                              style: TextStyle(
                                fontSize: 16.sp,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                    ),
                  ),
                  SizedBox(height: 32.h),

                  // ── Divider: Or sign up with ───────────────────────
                  Row(
                    children: [
                      const Expanded(child: Divider(color: Color(0xFFE5E7EB))),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 12.w),
                        child: Text(
                          'Or sign up with',
                          style: TextStyle(
                            fontSize: 12.sp,
                            color: ColorConst.textGreyColor,
                          ),
                        ),
                      ),
                      const Expanded(child: Divider(color: Color(0xFFE5E7EB))),
                    ],
                  ),
                  SizedBox(height: 20.h),

                  // ── Social Buttons ─────────────────────────────────
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      _buildSocialCircle(
                        icon: Icons.apple_rounded,
                        color: Colors.black,
                        onTap: () => controller.socialLogin('Apple'),
                      ),
                      SizedBox(width: 16.w),
                      _buildSocialCircle(
                        icon: Icons.g_mobiledata_rounded,
                        color: const Color(0xFFEA4335),
                        isGoogle: true,
                        onTap: () => controller.socialLogin('Google'),
                      ),
                      SizedBox(width: 16.w),
                      _buildSocialCircle(
                        icon: Icons.facebook_rounded,
                        color: const Color(0xFF1877F2),
                        onTap: () => controller.socialLogin('Facebook'),
                      ),
                    ],
                  ),
                  SizedBox(height: 28.h),

                  // ── Footer: Already have an account? Sign In ───────
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Already have an account? ',
                        style: TextStyle(
                          fontSize: 13.sp,
                          color: ColorConst.textBlackColor,
                        ),
                      ),
                      GestureDetector(
                        onTap: () => Get.toNamed(AppRoutes.login),
                        child: Text(
                          'Sign In',
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
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _buildSocialCircle({
    required IconData icon,
    required Color color,
    bool isGoogle = false,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 54.r,
        height: 54.r,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(color: const Color(0xFFE5E7EB), width: 1.w),
          color: Colors.white,
        ),
        alignment: Alignment.center,
        child: isGoogle
            ? Text(
                'G',
                style: TextStyle(
                  fontSize: 24.sp,
                  fontWeight: FontWeight.bold,
                  color: const Color(0xFF4285F4),
                ),
              )
            : Icon(icon, size: 28.r, color: color),
      ),
    );
  }
}
