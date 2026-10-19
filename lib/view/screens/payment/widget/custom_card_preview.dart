import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../const/color_const.dart';
import '../../../../controller/add_card_controller.dart';

class CustomCardPreview extends StatelessWidget {
  final AddCardController controller;
  const CustomCardPreview({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 190.h,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [ColorConst.primaryColor, const Color(0xFF1E5C4D)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(20.r),
      ),
      padding: EdgeInsets.all(24.r),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                  width: 36.w,
                  height: 28.h,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.white.withValues(alpha: 0.2))),
              Text('VISA',
                  style: TextStyle(
                      fontSize: 22.sp,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      letterSpacing: 2)),
            ],
          ),
          const Spacer(),
          Text(
            controller.maskedNumber.isEmpty
                ? '•••• •••• •••• ••••'
                : controller.maskedNumber,
            style: TextStyle(
                fontSize: 18.sp,
                color: Colors.white,
                letterSpacing: 3,
                fontWeight: FontWeight.w600),
          ),
          SizedBox(height: 12.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                Text('Card holder name',
                    style: TextStyle(
                        fontSize: 10.sp,
                        color: Colors.white.withValues(alpha: 0.6))),
                Text(
                  controller.holderNameController.text.isEmpty
                      ? 'Your Name'
                      : controller.holderNameController.text,
                  style: TextStyle(
                      fontSize: 13.sp,
                      color: Colors.white,
                      fontWeight: FontWeight.w600),
                ),
              ]),
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                Text('Expiry date',
                    style: TextStyle(
                        fontSize: 10.sp,
                        color: Colors.white.withValues(alpha: 0.6))),
                Text(
                  controller.expiryController.text.isEmpty
                      ? 'MM/YY'
                      : controller.expiryController.text,
                  style: TextStyle(
                      fontSize: 13.sp,
                      color: Colors.white,
                      fontWeight: FontWeight.w600),
                ),
              ]),
              Icon(Icons.credit_card_rounded,
                  size: 30.r, color: Colors.white.withValues(alpha: 0.6)),
            ],
          ),
        ],
      ),
    );
  }
}
