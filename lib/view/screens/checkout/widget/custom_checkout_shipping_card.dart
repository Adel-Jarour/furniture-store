import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../const/color_const.dart';
import '../../../../models/shipping_option_model.dart';

class CustomCheckoutShippingCard extends StatelessWidget {
  final ShippingOptionModel shipping;
  final VoidCallback onChangeTap;

  const CustomCheckoutShippingCard({
    super.key,
    required this.shipping,
    required this.onChangeTap,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Choose Shipping Type',
          style: TextStyle(
            fontSize: 17.sp,
            fontWeight: FontWeight.bold,
            color: ColorConst.textBlackColor,
          ),
        ),
        SizedBox(height: 14.h),
        Row(
          children: [
            Icon(
              Icons.inventory_2_outlined,
              size: 24.r,
              color: ColorConst.textBlackColor,
            ),
            SizedBox(width: 12.w),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    shipping.title,
                    style: TextStyle(
                      fontSize: 15.sp,
                      fontWeight: FontWeight.bold,
                      color: ColorConst.textBlackColor,
                    ),
                  ),
                  SizedBox(height: 4.h),
                  Text(
                    shipping.estimatedArrival,
                    style: TextStyle(
                      fontSize: 13.sp,
                      color: ColorConst.textGreyColor,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(width: 8.w),
            GestureDetector(
              onTap: onChangeTap,
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 6.h),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16.r),
                  border: Border.all(color: const Color(0xFFE5E7EB)),
                ),
                child: Text(
                  'CHANGE',
                  style: TextStyle(
                    fontSize: 11.sp,
                    fontWeight: FontWeight.bold,
                    color: ColorConst.primaryColor,
                    letterSpacing: 0.5,
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
