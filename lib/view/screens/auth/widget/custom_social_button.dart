import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../const/color_const.dart';

class CustomSocialButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback onTap;
  final Color? iconColor;

  const CustomSocialButton({
    super.key,
    required this.icon,
    required this.onTap,
    this.iconColor,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(16.r),
      child: Container(
        width: 60.r,
        height: 52.h,
        decoration: BoxDecoration(
          color: ColorConst.cardBgColor,
          borderRadius: BorderRadius.circular(16.r),
          border: Border.all(color: ColorConst.borderColor, width: 1.w),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.03),
              blurRadius: 8,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        alignment: Alignment.center,
        child: Icon(
          icon,
          size: 26.r,
          color: iconColor ?? ColorConst.textBlackColor,
        ),
      ),
    );
  }
}
