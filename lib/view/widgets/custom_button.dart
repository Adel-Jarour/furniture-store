import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../const/color_const.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback? onPressed;
  final bool isLoading;
  final Color backgroundColor;
  final Color textColor;
  final double? width;
  final double? height;
  final double? fontSize;
  final double? borderRadius;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final BorderSide? border;

  const CustomButton({
    super.key,
    required this.text,
    this.onPressed,
    this.isLoading = false,
    this.backgroundColor = ColorConst.primaryColor,
    this.textColor = ColorConst.textWhiteColor,
    this.width,
    this.height,
    this.fontSize,
    this.borderRadius,
    this.prefixIcon,
    this.suffixIcon,
    this.border,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width ?? double.infinity,
      height: height ?? 52.h,
      child: ElevatedButton(
        onPressed: isLoading ? null : onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: backgroundColor,
          disabledBackgroundColor: backgroundColor.withValues(alpha: 0.6),
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(borderRadius ?? 26.r),
            side: border ?? BorderSide.none,
          ),
          padding: EdgeInsets.symmetric(horizontal: 16.w),
        ),
        child: isLoading
            ? SizedBox(
                width: 22.r,
                height: 22.r,
                child: CircularProgressIndicator(
                  strokeWidth: 2.2.w,
                  valueColor: AlwaysStoppedAnimation<Color>(textColor),
                ),
              )
            : Row(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  if (prefixIcon != null) ...[
                    prefixIcon!,
                    SizedBox(width: 8.w),
                  ],
                  Text(
                    text,
                    style: TextStyle(
                      fontSize: fontSize ?? 16.sp,
                      fontWeight: FontWeight.w600,
                      color: textColor,
                    ),
                  ),
                  if (suffixIcon != null) ...[
                    SizedBox(width: 8.w),
                    suffixIcon!,
                  ],
                ],
              ),
      ),
    );
  }
}
