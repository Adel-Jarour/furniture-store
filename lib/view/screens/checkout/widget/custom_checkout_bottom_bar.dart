import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../const/color_const.dart';

class CustomCheckoutBottomBar extends StatelessWidget {
  final String buttonText;
  final VoidCallback onPressed;

  const CustomCheckoutBottomBar({
    super.key,
    required this.buttonText,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 16.h),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.05),
            blurRadius: 10,
            offset: const Offset(0, -4),
          ),
        ],
      ),
      child: SizedBox(
        width: double.infinity,
        height: 52.h,
        child: ElevatedButton(
          onPressed: onPressed,
          style: ElevatedButton.styleFrom(
            backgroundColor: ColorConst.primaryColor,
            foregroundColor: Colors.white,
            elevation: 0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(28.r),
            ),
          ),
          child: Text(
            buttonText,
            style: TextStyle(
              fontSize: 16.sp,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
