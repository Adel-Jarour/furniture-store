import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../const/color_const.dart';
import '../../../controller/splash_controller.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SplashController>(
      init: SplashController(),
      builder: (controller) {
        return Scaffold(
          backgroundColor: Colors.white,
          body: Stack(
            children: [
              // ── Decorative circle — top right ──────────────────────────
              Positioned(
                top: -60.r,
                right: -60.r,
                child: Container(
                  width: 180.r,
                  height: 180.r,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: const Color(0xFFF0F0F0),
                  ),
                ),
              ),

              // ── Decorative circle — bottom left ────────────────────────
              Positioned(
                bottom: -70.r,
                left: -70.r,
                child: Container(
                  width: 200.r,
                  height: 200.r,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: const Color(0xFFF0F0F0),
                  ),
                ),
              ),

              // ── Centred logo row ────────────────────────────────────────
              Center(
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    // Circular teal icon badge
                    Container(
                      width: 52.r,
                      height: 52.r,
                      decoration: const BoxDecoration(
                        color: ColorConst.primaryColor,
                        shape: BoxShape.circle,
                      ),
                      alignment: Alignment.center,
                      child: Icon(
                        Icons.weekend_rounded, // sofa-like icon
                        size: 28.r,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(width: 12.w),
                    // App name
                    Text(
                      'Furniture',
                      style: TextStyle(
                        fontSize: 30.sp,
                        fontWeight: FontWeight.bold,
                        color: ColorConst.textBlackColor,
                        letterSpacing: 0.3,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
