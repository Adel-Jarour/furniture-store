import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../const/color_const.dart';

class CustomInputField extends StatelessWidget {
  final String? label;
  final String? hintText;
  final TextEditingController? controller;
  final bool obscureText;
  final TextInputType keyboardType;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final String? Function(String?)? validator;
  final ValueChanged<String>? onChanged;
  final bool readOnly;
  final VoidCallback? onTap;
  final int maxLines;
  final Color fillColor;

  const CustomInputField({
    super.key,
    this.label,
    this.hintText,
    this.controller,
    this.obscureText = false,
    this.keyboardType = TextInputType.text,
    this.prefixIcon,
    this.suffixIcon,
    this.validator,
    this.onChanged,
    this.readOnly = false,
    this.onTap,
    this.maxLines = 1,
    this.fillColor = ColorConst.cardBgColor,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (label != null) ...[
          Text(
            label!,
            style: TextStyle(
              fontSize: 14.sp,
              fontWeight: FontWeight.w600,
              color: ColorConst.textBlackColor,
            ),
          ),
          SizedBox(height: 8.h),
        ],
        TextFormField(
          controller: controller,
          obscureText: obscureText,
          keyboardType: keyboardType,
          validator: validator,
          onChanged: onChanged,
          readOnly: readOnly,
          onTap: onTap,
          maxLines: maxLines,
          style: TextStyle(
            fontSize: 14.sp,
            color: ColorConst.textBlackColor,
          ),
          decoration: InputDecoration(
            hintText: hintText,
            hintStyle: TextStyle(
              fontSize: 14.sp,
              color: ColorConst.textLightGreyColor,
            ),
            filled: true,
            fillColor: fillColor,
            prefixIcon: prefixIcon,
            suffixIcon: suffixIcon,
            contentPadding: EdgeInsets.symmetric(
              horizontal: 16.w,
              vertical: 14.h,
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(14.r),
              borderSide: BorderSide(color: ColorConst.borderColor, width: 1.w),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(14.r),
              borderSide: BorderSide(color: ColorConst.borderColor, width: 1.w),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(14.r),
              borderSide: BorderSide(
                color: ColorConst.primaryColor,
                width: 1.5.w,
              ),
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(14.r),
              borderSide: BorderSide(color: ColorConst.errorColor, width: 1.w),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(14.r),
              borderSide: BorderSide(
                color: ColorConst.errorColor,
                width: 1.5.w,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
