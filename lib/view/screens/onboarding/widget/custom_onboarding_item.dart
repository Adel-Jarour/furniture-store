import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../const/color_const.dart';
import '../../../../controller/onboarding_controller.dart';

class CustomOnboardingItem extends StatelessWidget {
  final OnboardingItem item;

  const CustomOnboardingItem({
    super.key,
    required this.item,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return SingleChildScrollView(
          physics: const NeverScrollableScrollPhysics(),
          child: Column(
            children: [
              // ── Phone Mockup / Hero Image ──────────────────────────
              SizedBox(
                height: constraints.maxHeight * 0.58,
                width: double.infinity,
                child: Image.asset(
                  item.image,
                  fit: BoxFit.contain,
                  alignment: Alignment.center,
                ),
              ),

              SizedBox(height: 16.h),

              // ── Title & Subtitle ───────────────────────────────────
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 24.w),
                child: Column(
                  children: [
                    RichText(
                      textAlign: TextAlign.center,
                      text: TextSpan(
                        style: TextStyle(
                          fontSize: 22.sp,
                          fontWeight: FontWeight.bold,
                          height: 1.25,
                          fontFamily: Theme.of(context)
                              .textTheme
                              .bodyMedium
                              ?.fontFamily,
                        ),
                        children: item.titleSpan.children,
                      ),
                    ),
                    SizedBox(height: 12.h),
                    Text(
                      item.description,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 13.sp,
                        color: ColorConst.textGreyColor,
                        height: 1.45,
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
