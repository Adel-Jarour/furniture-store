import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../const/color_const.dart';
import '../../../../models/shipping_option_model.dart';

class CustomShippingOptionTile extends StatelessWidget {
  final ShippingOptionModel option;
  final bool isSelected;
  final VoidCallback onTap;

  const CustomShippingOptionTile({
    super.key,
    required this.option,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      behavior: HitTestBehavior.opaque,
      child: Row(
        children: [
          Icon(
            option.icon,
            size: 26.r,
            color: ColorConst.textBlackColor,
          ),
          SizedBox(width: 16.w),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  option.title,
                  style: TextStyle(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.bold,
                    color: ColorConst.textBlackColor,
                  ),
                ),
                SizedBox(height: 4.h),
                Text(
                  option.estimatedArrival,
                  style: TextStyle(
                    fontSize: 13.sp,
                    color: ColorConst.textGreyColor,
                  ),
                ),
              ],
            ),
          ),
          Text(
            '\$${option.price.toStringAsFixed(0)}',
            style: TextStyle(
              fontSize: 16.sp,
              fontWeight: FontWeight.bold,
              color: ColorConst.textBlackColor,
            ),
          ),
          SizedBox(width: 16.w),
          Container(
            width: 22.r,
            height: 22.r,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(
                color: isSelected
                    ? ColorConst.primaryColor
                    : const Color(0xFFD1D5DB),
                width: isSelected ? 6.r : 1.5.r,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
