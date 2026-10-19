import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../const/color_const.dart';
import '../../../controller/onboarding_controller.dart';
import 'widget/custom_onboarding_item.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<OnboardingController>(
      init: OnboardingController(),
      builder: (controller) {
        return Scaffold(
          backgroundColor: Colors.white,
          body: SafeArea(
            child: Column(
              children: [
                // ── Top Bar with Skip ────────────────────────────────
                Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: 20.w, vertical: 4.h),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const SizedBox(width: 48),
                      if (controller.currentPage < controller.items.length - 1)
                        TextButton(
                          onPressed: controller.skip,
                          style: TextButton.styleFrom(
                            foregroundColor: ColorConst.primaryColor,
                            splashFactory: NoSplash.splashFactory,
                          ),
                          child: Text(
                            'Skip',
                            style: TextStyle(
                              fontSize: 15.sp,
                              fontWeight: FontWeight.w500,
                              color: ColorConst.primaryColor,
                            ),
                          ),
                        )
                      else
                        const SizedBox(height: 40),
                    ],
                  ),
                ),

                // ── Paged Content ────────────────────────────────────
                Expanded(
                  child: PageView.builder(
                    controller: controller.pageController,
                    onPageChanged: controller.onPageChanged,
                    itemCount: controller.items.length,
                    itemBuilder: (context, index) {
                      return CustomOnboardingItem(
                        item: controller.items[index],
                      );
                    },
                  ),
                ),

                // ── Bottom Navigation Controls ───────────────────────
                Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: 24.w, vertical: 20.h),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      // Back Button (shown on page 2 & 3)
                      if (controller.currentPage > 0)
                        InkWell(
                          onTap: controller.previous,
                          borderRadius: BorderRadius.circular(28.r),
                          child: Container(
                            width: 52.r,
                            height: 52.r,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(
                                color: ColorConst.primaryColor,
                                width: 1.2.w,
                              ),
                              color: Colors.white,
                            ),
                            child: Icon(
                              Icons.arrow_back,
                              color: ColorConst.primaryColor,
                              size: 22.r,
                            ),
                          ),
                        )
                      else
                        SizedBox(width: 52.r, height: 52.r),

                      // Indicators Dots (always centered)
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: List.generate(
                          controller.items.length,
                          (index) {
                            final isActive = controller.currentPage == index;
                            return AnimatedContainer(
                              duration: const Duration(milliseconds: 250),
                              margin: EdgeInsets.symmetric(horizontal: 4.w),
                              width: isActive ? 20.w : 8.w,
                              height: 8.h,
                              decoration: BoxDecoration(
                                color: isActive
                                    ? ColorConst.primaryColor
                                    : const Color(0xFFD9D9D9),
                                borderRadius: BorderRadius.circular(4.r),
                              ),
                            );
                          },
                        ),
                      ),

                      // Next / Complete Button
                      InkWell(
                        onTap: controller.next,
                        borderRadius: BorderRadius.circular(28.r),
                        child: Container(
                          width: 52.r,
                          height: 52.r,
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color: ColorConst.primaryColor,
                          ),
                          child: Icon(
                            Icons.arrow_forward,
                            color: Colors.white,
                            size: 22.r,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
