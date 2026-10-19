import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../const/color_const.dart';
import '../../../../controller/cart_controller.dart';

class CustomCartSummarySheet extends StatelessWidget {
  final CartController controller;
  final double bottomPadding;

  const CustomCartSummarySheet({
    super.key,
    required this.controller,
    this.bottomPadding = 0,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(24.r)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.08),
            blurRadius: 16,
            offset: const Offset(0, -4),
          ),
        ],
      ),
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 16.h).copyWith(
        bottom: 16.h + bottomPadding,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Promo Code input
          Container(
            height: 48.h,
            decoration: BoxDecoration(
              color: const Color(0xFFF3F4F6),
              borderRadius: BorderRadius.circular(24.r),
            ),
            padding: EdgeInsets.only(left: 16.w, right: 4.w),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: controller.promoController,
                    decoration: InputDecoration(
                      hintText: 'Promo Code',
                      hintStyle: TextStyle(
                        color: ColorConst.textGreyColor,
                        fontSize: 14.sp,
                      ),
                      border: InputBorder.none,
                      isDense: true,
                    ),
                  ),
                ),
                SizedBox(
                  height: 40.h,
                  child: ElevatedButton(
                    onPressed: controller.applyPromoCode,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: ColorConst.primaryColor,
                      foregroundColor: Colors.white,
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.r),
                      ),
                      padding: EdgeInsets.symmetric(horizontal: 22.w),
                    ),
                    child: Text(
                      'Apply',
                      style: TextStyle(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 16.h),

          // Price breakdown
          _buildRow('Sub-Total', '\$${controller.subTotal.toStringAsFixed(2)}'),
          SizedBox(height: 8.h),
          _buildRow(
              'Delivery Fee', '\$${controller.deliveryFee.toStringAsFixed(2)}'),
          SizedBox(height: 8.h),
          _buildRow('Discount', '-\$${controller.discount.toStringAsFixed(2)}'),
          SizedBox(height: 12.h),

          // Dashed divider
          LayoutBuilder(
            builder: (context, constraints) {
              const dashWidth = 6.0;
              const dashSpace = 4.0;
              final dashCount =
                  (constraints.maxWidth / (dashWidth + dashSpace)).floor();
              return Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: List.generate(dashCount, (_) {
                  return SizedBox(
                    width: dashWidth,
                    height: 1,
                    child: const DecoratedBox(
                      decoration: BoxDecoration(color: Color(0xFFE5E7EB)),
                    ),
                  );
                }),
              );
            },
          ),
          SizedBox(height: 12.h),

          // Total Cost
          _buildRow(
            'Total Cost',
            '\$${controller.totalCost.toStringAsFixed(2)}',
            isBold: true,
          ),
          SizedBox(height: 18.h),

          // Proceed to Checkout button
          SizedBox(
            width: double.infinity,
            height: 52.h,
            child: ElevatedButton(
              onPressed: controller.proceedToCheckout,
              style: ElevatedButton.styleFrom(
                backgroundColor: ColorConst.primaryColor,
                foregroundColor: Colors.white,
                elevation: 0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(28.r),
                ),
              ),
              child: Text(
                'Proceed to Checkout',
                style: TextStyle(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildRow(String label, String value, {bool isBold = false}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: TextStyle(
            fontSize: isBold ? 15.sp : 14.sp,
            fontWeight: isBold ? FontWeight.bold : FontWeight.w400,
            color:
                isBold ? ColorConst.textBlackColor : ColorConst.textGreyColor,
          ),
        ),
        Text(
          value,
          style: TextStyle(
            fontSize: isBold ? 16.sp : 14.sp,
            fontWeight: isBold ? FontWeight.bold : FontWeight.w600,
            color: ColorConst.textBlackColor,
          ),
        ),
      ],
    );
  }
}
