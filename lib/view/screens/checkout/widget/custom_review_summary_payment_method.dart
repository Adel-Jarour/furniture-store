import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../const/color_const.dart';

class CustomReviewSummaryPaymentMethod extends StatelessWidget {
  final String paymentMethod;
  final VoidCallback onChange;

  const CustomReviewSummaryPaymentMethod({
    super.key,
    required this.paymentMethod,
    required this.onChange,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Divider(
          height: 1.h,
          thickness: 0.8.h,
          color: const Color(0xFFF0F0F0),
        ),
        Padding(
          padding: EdgeInsets.symmetric(vertical: 16.h),
          child: Row(
            children: [
              Container(
                width: 36.r,
                height: 36.r,
                decoration: BoxDecoration(
                  color: const Color(0xFFF3F4F6),
                  borderRadius: BorderRadius.circular(8.r),
                ),
                alignment: Alignment.center,
                child: Icon(
                  Icons.account_balance_wallet_rounded,
                  size: 20.r,
                  color: ColorConst.primaryColor,
                ),
              ),
              SizedBox(width: 12.w),
              Expanded(
                child: Text(
                  paymentMethod,
                  style: TextStyle(
                    fontSize: 15.sp,
                    fontWeight: FontWeight.w600,
                    color: ColorConst.textBlackColor,
                  ),
                ),
              ),
              GestureDetector(
                onTap: onChange,
                child: Text(
                  'Change',
                  style: TextStyle(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w600,
                    color: ColorConst.primaryColor,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
