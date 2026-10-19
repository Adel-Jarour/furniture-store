import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../const/color_const.dart';
import '../../../../controller/orders_controller.dart';
import '../../../../models/order_model.dart';

class CustomOrderCard extends StatelessWidget {
  final OrderModel order;
  final OrdersController controller;

  const CustomOrderCard({
    super.key,
    required this.order,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    String buttonText = 'Track Order';
    VoidCallback onButtonTap = () => controller.trackOrder(order);

    if (controller.selectedTabIndex == 1) {
      buttonText = 'Leave Review';
      onButtonTap = () => controller.leaveReview(order);
    } else if (controller.selectedTabIndex == 2) {
      buttonText = 'Re-Order';
      onButtonTap = () => controller.reOrder(order);
    }

    return Row(
      children: [
        // Thumbnail
        Container(
          width: 76.r,
          height: 76.r,
          decoration: BoxDecoration(
            color: const Color(0xFFF3F4F6),
            borderRadius: BorderRadius.circular(14.r),
          ),
          padding: EdgeInsets.all(8.r),
          child: Image.asset(
            order.product.image,
            fit: BoxFit.contain,
          ),
        ),
        SizedBox(width: 14.w),

        // Info
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                order.product.title,
                style: TextStyle(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.bold,
                  color: ColorConst.textBlackColor,
                ),
              ),
              SizedBox(height: 4.h),
              Text(
                '${order.product.category} | Qty. : ${order.quantity.toString().padLeft(2, '0')} pcs',
                style: TextStyle(
                  fontSize: 13.sp,
                  color: ColorConst.textGreyColor,
                ),
              ),
              SizedBox(height: 6.h),
              Text(
                '\$${order.price.toStringAsFixed(2)}',
                style: TextStyle(
                  fontSize: 15.sp,
                  fontWeight: FontWeight.bold,
                  color: ColorConst.textBlackColor,
                ),
              ),
            ],
          ),
        ),

        // Action Pill Button
        SizedBox(
          height: 38.h,
          child: ElevatedButton(
            onPressed: onButtonTap,
            style: ElevatedButton.styleFrom(
              backgroundColor: ColorConst.primaryColor,
              foregroundColor: Colors.white,
              elevation: 0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.r),
              ),
              padding: EdgeInsets.symmetric(horizontal: 16.w),
            ),
            child: Text(
              buttonText,
              style: TextStyle(
                fontSize: 13.sp,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
