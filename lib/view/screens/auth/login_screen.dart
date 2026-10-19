import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../const/color_const.dart';
import '../../../controller/auth_controller.dart';
import '../../../routes/app_routes.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

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
                  SizedBox(height: 30.h),

                  // ── Title & Subtitle ───────────────────────────────
                  Text(
                    'Sign In',
                    style: TextStyle(
                      fontSize: 26.sp,
                      fontWeight: FontWeight.bold,
                      color: ColorConst.textBlackColor,
                    ),
                  ),
                  SizedBox(height: 8.h),
                  Text(
                    'Hi! Welcome back, you’ve been missed',
                    style: TextStyle(
                      fontSize: 13.sp,
                      color: ColorConst.textGreyColor,
                    ),
                  ),
                  SizedBox(height: 36.h),

                  // ── Email Input Field ──────────────────────────────
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
                      controller: controller.loginEmailController,
                      keyboardType: TextInputType.emailAddress,
                      style: TextStyle(
                        fontSize: 14.sp,
                        color: ColorConst.textBlackColor,
                      ),
                      decoration: InputDecoration(
                        hintText: 'example@gmail.com',
                        hintStyle: TextStyle(
                          fontSize: 13.sp,
                          color: const Color(0xFF9CA3AF),
                        ),
                        border: InputBorder.none,
                        isDense: true,
                        contentPadding: EdgeInsets.zero,
                      ),
                    ),
                  ),
                  SizedBox(height: 18.h),

                  // ── Password Input Field ───────────────────────────
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
                            controller: controller.loginPasswordController,
                            obscureText: controller.isLoginPasswordHidden,
                            style: TextStyle(
                              fontSize: 14.sp,
                              color: ColorConst.textBlackColor,
                            ),
                            decoration: InputDecoration(
                              hintText: '****************',
                              hintStyle: TextStyle(
                                fontSize: 13.sp,
                                color: const Color(0xFF9CA3AF),
                                letterSpacing: 2,
                              ),
                              border: InputBorder.none,
                              isDense: true,
                              contentPadding: EdgeInsets.zero,
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: controller.toggleLoginPasswordVisibility,
                          child: Icon(
                            controller.isLoginPasswordHidden
                                ? Icons.visibility_off_outlined
                                : Icons.visibility_outlined,
                            size: 20.r,
                            color: ColorConst.textBlackColor,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 12.h),

                  // ── Forgot Password Link ───────────────────────────
                  Align(
                    alignment: Alignment.centerRight,
                    child: GestureDetector(
                      onTap: () => Get.toNamed(AppRoutes.forgotPassword),
                      child: Text(
                        'Forgot Password?',
                        style: TextStyle(
                          fontSize: 13.sp,
                          fontWeight: FontWeight.w600,
                          color: ColorConst.primaryColor,
                          decoration: TextDecoration.underline,
                          decorationColor: ColorConst.primaryColor,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 30.h),

                  // ── Sign In Button ─────────────────────────────────
                  SizedBox(
                    width: double.infinity,
                    height: 52.h,
                    child: ElevatedButton(
                      onPressed: controller.isLoading ? null : controller.login,
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
                              'Sign In',
                              style: TextStyle(
                                fontSize: 16.sp,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                    ),
                  ),
                  SizedBox(height: 36.h),

                  // ── Divider: Or sign in with ───────────────────────
                  Row(
                    children: [
                      const Expanded(child: Divider(color: Color(0xFFE5E7EB))),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 12.w),
                        child: Text(
                          'Or sign in with',
                          style: TextStyle(
                            fontSize: 12.sp,
                            color: ColorConst.textGreyColor,
                          ),
                        ),
                      ),
                      const Expanded(child: Divider(color: Color(0xFFE5E7EB))),
                    ],
                  ),
                  SizedBox(height: 24.h),

                  // ── Social Icons Row ───────────────────────────────
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
                  SizedBox(height: 36.h),

                  // ── Footer: Don't have an account? Sign Up ─────────
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Don’t have an account? ',
                        style: TextStyle(
                          fontSize: 13.sp,
                          color: ColorConst.textBlackColor,
                        ),
                      ),
                      GestureDetector(
                        onTap: () => Get.toNamed(AppRoutes.signup),
                        child: Text(
                          'Sign Up',
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
