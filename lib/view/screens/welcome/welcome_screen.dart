import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../const/color_const.dart';
import '../../../const/image_const.dart';
import '../../../routes/app_routes.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        top: false,
        child: LayoutBuilder(
          builder: (context, constraints) {
            return SingleChildScrollView(
              child: ConstrainedBox(
                constraints: BoxConstraints(
                  minHeight: constraints.maxHeight,
                ),
                child: IntrinsicHeight(
                  child: Column(
                    children: [
                      // ── Top Hero Image & Collage ──────────────────────────
                      SizedBox(
                        height: constraints.maxHeight * 0.54,
                        width: double.infinity,
                        child: Image.asset(
                          ImageConst.welcomeHero,
                          fit: BoxFit.cover,
                          alignment: Alignment.bottomCenter,
                        ),
                      ),

                      // ── Bottom Content & Actions ─────────────────────────
                      Expanded(
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal: 24.w,
                            vertical: 16.h,
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              // Headings
                              Column(
                                children: [
                                  RichText(
                                    textAlign: TextAlign.center,
                                    text: TextSpan(
                                      style: TextStyle(
                                        fontSize: 23.sp,
                                        fontWeight: FontWeight.bold,
                                        height: 1.25,
                                        fontFamily: Theme.of(context)
                                            .textTheme
                                            .bodyMedium
                                            ?.fontFamily,
                                      ),
                                      children: const [
                                        TextSpan(
                                          text: 'The Furniture App ',
                                          style: TextStyle(
                                            color: ColorConst.primaryColor,
                                          ),
                                        ),
                                        TextSpan(
                                          text: 'That\n',
                                          style: TextStyle(
                                            color: ColorConst.textBlackColor,
                                          ),
                                        ),
                                        TextSpan(
                                          text: 'Elevates Your Home',
                                          style: TextStyle(
                                            color: ColorConst.textBlackColor,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(height: 10.h),
                                  Text(
                                    'Lorem ipsum dolor sit amet, consectetur\nadipiscing elit, sed do eiusmod tempor incididunt',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      fontSize: 13.sp,
                                      color: ColorConst.textGreyColor,
                                      height: 1.4,
                                    ),
                                  ),
                                ],
                              ),

                              // Primary Button & Secondary Link
                              Column(
                                children: [
                                  SizedBox(
                                    width: double.infinity,
                                    height: 52.h,
                                    child: ElevatedButton(
                                      onPressed: () =>
                                          Get.toNamed(AppRoutes.onboarding),
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor:
                                            ColorConst.primaryColor,
                                        foregroundColor: Colors.white,
                                        elevation: 0,
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(28.r),
                                        ),
                                      ),
                                      child: Text(
                                        "Let's Get Started",
                                        style: TextStyle(
                                          fontSize: 16.sp,
                                          fontWeight: FontWeight.w600,
                                          letterSpacing: 0.2,
                                        ),
                                      ),
                                    ),
                                  ),
                                  SizedBox(height: 14.h),

                                  // Already have an account? Sign In
                                  RichText(
                                    textAlign: TextAlign.center,
                                    text: TextSpan(
                                      style: TextStyle(
                                        fontSize: 14.sp,
                                        color: ColorConst.textBlackColor,
                                        fontFamily: Theme.of(context)
                                            .textTheme
                                            .bodyMedium
                                            ?.fontFamily,
                                      ),
                                      children: [
                                        const TextSpan(
                                          text: 'Already have an account? ',
                                        ),
                                        TextSpan(
                                          text: 'Sign In',
                                          style: const TextStyle(
                                            fontWeight: FontWeight.bold,
                                            color: ColorConst.primaryColor,
                                            decoration:
                                                TextDecoration.underline,
                                          ),
                                          recognizer: TapGestureRecognizer()
                                            ..onTap = () =>
                                                Get.toNamed(AppRoutes.login),
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(height: 4.h),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
