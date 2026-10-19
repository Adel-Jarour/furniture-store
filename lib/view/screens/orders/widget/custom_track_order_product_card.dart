import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../const/color_const.dart';
import '../../../../models/order_model.dart';

class CustomTrackOrderProductCard extends StatelessWidget {
  final OrderModel order;

  const CustomTrackOrderProductCard({
    super.key,
    required this.order,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
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
      ],
    );
  }
}
