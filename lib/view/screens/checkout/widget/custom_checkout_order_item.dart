import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../const/color_const.dart';
import '../../../../models/cart_item_model.dart';

class CustomCheckoutOrderItem extends StatelessWidget {
  final CartItemModel item;

  const CustomCheckoutOrderItem({
    super.key,
    required this.item,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 74.r,
          height: 74.r,
          decoration: BoxDecoration(
            color: const Color(0xFFF3F4F6),
            borderRadius: BorderRadius.circular(14.r),
          ),
          padding: EdgeInsets.all(8.r),
          child: Image.asset(
            item.product.image,
            fit: BoxFit.contain,
          ),
        ),
        SizedBox(width: 14.w),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                item.product.title,
                style: TextStyle(
                  fontSize: 15.sp,
                  fontWeight: FontWeight.bold,
                  color: ColorConst.textBlackColor,
                ),
              ),
              SizedBox(height: 4.h),
              Text(
                item.product.category,
                style: TextStyle(
                  fontSize: 13.sp,
                  color: ColorConst.textGreyColor,
                ),
              ),
              SizedBox(height: 6.h),
              Text(
                '\$${item.product.price.toStringAsFixed(2)}',
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
