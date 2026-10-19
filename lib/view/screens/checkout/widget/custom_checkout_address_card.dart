import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../const/color_const.dart';

class CustomCheckoutAddressCard extends StatelessWidget {
  final String addressType;
  final String addressDetails;
  final VoidCallback onChangeTap;

  const CustomCheckoutAddressCard({
    super.key,
    required this.addressType,
    required this.addressDetails,
    required this.onChangeTap,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Shipping Address',
          style: TextStyle(
            fontSize: 17.sp,
            fontWeight: FontWeight.bold,
            color: ColorConst.textBlackColor,
          ),
        ),
        SizedBox(height: 14.h),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(top: 2.h),
              child: Icon(
                Icons.location_on_outlined,
                size: 24.r,
                color: ColorConst.textBlackColor,
              ),
            ),
            SizedBox(width: 12.w),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    addressType,
                    style: TextStyle(
                      fontSize: 15.sp,
                      fontWeight: FontWeight.bold,
                      color: ColorConst.textBlackColor,
                    ),
                  ),
                  SizedBox(height: 4.h),
                  Text(
                    addressDetails,
                    style: TextStyle(
                      fontSize: 13.sp,
                      color: ColorConst.textGreyColor,
                      height: 1.35,
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
