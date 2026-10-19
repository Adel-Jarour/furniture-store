import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../const/color_const.dart';
import '../../../../models/coupon_model.dart';

class CustomCouponCard extends StatelessWidget {
  final CouponModel coupon;
  final VoidCallback onCopyTap;

  const CustomCouponCard({
    super.key,
    required this.coupon,
    required this.onCopyTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 16.h),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16.r),
        border: Border.all(color: const Color(0xFFE5E7EB)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.02),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(16.r),
        child: Stack(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Top Content Area
                Padding(
                  padding: EdgeInsets.fromLTRB(20.w, 16.h, 20.w, 14.h),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        coupon.code,
                        style: TextStyle(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.bold,
                          color: ColorConst.textBlackColor,
                          letterSpacing: 0.5,
                        ),
                      ),
                      SizedBox(height: 4.h),
                      Text(
                        coupon.requirement,
                        style: TextStyle(
                          fontSize: 13.sp,
                          color: ColorConst.textGreyColor,
                        ),
                      ),
                      SizedBox(height: 10.h),
                      Row(
                        children: [
                          Icon(
                            Icons.verified_rounded,
                            size: 16.r,
                            color: ColorConst.primaryColor,
                          ),
                          SizedBox(width: 6.w),
                          Text(
                            coupon.discountBadge,
                            style: TextStyle(
                              fontSize: 14.sp,
                              fontWeight: FontWeight.bold,
                              color: ColorConst.textBlackColor,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),

                // Bottom Copy Code Strip
                GestureDetector(
                  onTap: onCopyTap,
                  behavior: HitTestBehavior.opaque,
                  child: Container(
                    width: double.infinity,
                    padding: EdgeInsets.symmetric(vertical: 12.h),
                    color: const Color(0xFFF9FAFB),
                    alignment: Alignment.center,
                    child: Text(
                      'COPY CODE',
                      style: TextStyle(
                        fontSize: 13.sp,
                        fontWeight: FontWeight.bold,
                        color: ColorConst.textGreyColor,
                        letterSpacing: 1.0,
                      ),
                    ),
                  ),
                ),
              ],
            ),

            // Left Ticket Notch
            Positioned(
              left: -10.r,
              top: 76.h,
              child: Container(
                width: 20.r,
                height: 20.r,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.white,
                  border: Border.all(color: const Color(0xFFE5E7EB)),
                ),
              ),
            ),

            // Right Ticket Notch
            Positioned(
              right: -10.r,
              top: 76.h,
              child: Container(
                width: 20.r,
                height: 20.r,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.white,
                  border: Border.all(color: const Color(0xFFE5E7EB)),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
