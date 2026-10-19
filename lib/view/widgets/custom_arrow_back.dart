import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../const/color_const.dart';

class CustomArrowBack extends StatelessWidget {
  final VoidCallback? onTap;
  final Color? iconColor;
  final Color? backgroundColor;

  const CustomArrowBack({
    super.key,
    this.onTap,
    this.iconColor,
    this.backgroundColor,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap ?? () => Get.back(),
      child: Container(
        width: 42.r,
        height: 42.r,
        decoration: BoxDecoration(
          color: backgroundColor ?? ColorConst.cardBgColor,
          shape: BoxShape.circle,
          border: Border.all(
            color: ColorConst.borderColor,
            width: 1.w,
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.04),
              blurRadius: 8,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        alignment: Alignment.center,
        child: Icon(
          Icons.arrow_back_ios_new_rounded,
          size: 18.r,
          color: iconColor ?? ColorConst.textBlackColor,
        ),
      ),
    );
  }
}
