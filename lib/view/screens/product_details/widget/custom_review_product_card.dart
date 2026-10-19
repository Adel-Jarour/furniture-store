import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../const/color_const.dart';
import '../../../../const/image_const.dart';

class CustomReviewProductCard extends StatelessWidget {
  const CustomReviewProductCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(12.r),
      decoration: BoxDecoration(
        color: const Color(0xFFF9FAFB),
        borderRadius: BorderRadius.circular(16.r),
      ),
      child: Row(
        children: [
          // Image Thumbnail
          Container(
            width: 68.r,
            height: 68.r,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12.r),
            ),
            padding: EdgeInsets.all(4.r),
            child: Image.asset(ImageConst.productArmChair, fit: BoxFit.contain),
          ),
          SizedBox(width: 14.w),

          // Product Info
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Arm Chair',
                  style: TextStyle(
                    fontSize: 15.sp,
                    fontWeight: FontWeight.bold,
                    color: ColorConst.textBlackColor,
                  ),
                ),
                SizedBox(height: 2.h),
                Text(
                  'Chair | Qty. : 02 pcs',
                  style: TextStyle(
                      fontSize: 12.sp, color: ColorConst.textGreyColor),
                ),
                SizedBox(height: 4.h),
                Text(
                  '\$180.00',
                  style: TextStyle(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.bold,
                    color: ColorConst.textBlackColor,
                  ),
                ),
              ],
            ),
          ),

          // Re-Order Pill
          Container(
            padding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 6.h),
            decoration: BoxDecoration(
              color: ColorConst.primaryColor,
              borderRadius: BorderRadius.circular(16.r),
            ),
            child: Text(
              'Re-Order',
              style: TextStyle(
                fontSize: 12.sp,
                fontWeight: FontWeight.w600,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
