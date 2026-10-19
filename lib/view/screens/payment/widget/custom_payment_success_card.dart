import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../const/color_const.dart';

class CustomPaymentSuccessCard extends StatelessWidget {
  const CustomPaymentSuccessCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          width: 100.r,
          height: 100.r,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: ColorConst.primaryColor.withValues(alpha: 0.12),
          ),
          alignment: Alignment.center,
          child: Container(
            width: 72.r,
            height: 72.r,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: ColorConst.primaryColor,
            ),
            alignment: Alignment.center,
            child: Icon(
              Icons.check_rounded,
              color: Colors.white,
              size: 42.r,
            ),
          ),
        ),
        SizedBox(height: 24.h),
        Text(
          'Payment Successful!',
          style: TextStyle(
            fontSize: 20.sp,
            fontWeight: FontWeight.bold,
            color: ColorConst.textBlackColor,
          ),
        ),
        SizedBox(height: 10.h),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 40.w),
          child: Text(
            'Your payment of \$185.00 has been received successfully.',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 14.sp,
              color: ColorConst.textGreyColor,
              height: 1.4,
            ),
          ),
        ),
      ],
    );
  }
}
