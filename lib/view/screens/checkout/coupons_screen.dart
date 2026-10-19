import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../const/color_const.dart';
import '../../../controller/coupon_controller.dart';
import 'widget/custom_coupon_card.dart';

class CouponsScreen extends StatelessWidget {
  const CouponsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CouponController>(
      init: CouponController(),
      builder: (controller) {
        return Scaffold(
          backgroundColor: Colors.white,
          body: SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // ── Top Bar ──────────────────────────────────────────
                Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
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
                      Text(
                        'Coupon',
                        style: TextStyle(
                          fontSize: 18.sp,
                          fontWeight: FontWeight.bold,
                          color: ColorConst.textBlackColor,
                        ),
                      ),
                      SizedBox(width: 44.r),
                    ],
                  ),
                ),

                // ── Section Title ────────────────────────────────────
                Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: 20.w, vertical: 12.h),
                  child: Text(
                    'Best offers for you',
                    style: TextStyle(
                      fontSize: 17.sp,
                      fontWeight: FontWeight.bold,
                      color: ColorConst.textBlackColor,
                    ),
                  ),
                ),

                // ── Coupons List ─────────────────────────────────────
                Expanded(
                  child: controller.isLoading
                      ? const Center(child: CircularProgressIndicator())
                      : ListView.builder(
                          padding: EdgeInsets.symmetric(horizontal: 20.w),
                          itemCount: controller.coupons.length,
                          itemBuilder: (context, index) {
                            final coupon = controller.coupons[index];
                            return CustomCouponCard(
                              coupon: coupon,
                              onCopyTap: () => controller.copyCode(coupon.code),
                            );
                          },
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
