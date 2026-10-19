import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../const/color_const.dart';

class CustomCardFormField extends StatelessWidget {
  final String label;
  final TextEditingController controller;
  final String hint;
  final TextInputType? keyboardType;
  final bool obscure;
  final ValueChanged<String>? onChanged;

  const CustomCardFormField({
    super.key,
    required this.label,
    required this.controller,
    required this.hint,
    this.keyboardType,
    this.obscure = false,
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label,
            style: TextStyle(
                fontSize: 13.sp,
                fontWeight: FontWeight.w500,
                color: ColorConst.textBlackColor)),
        SizedBox(height: 8.h),
        Container(
          height: 52.h,
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          decoration: BoxDecoration(
            color: const Color(0xFFF7F8F9),
            borderRadius: BorderRadius.circular(12.r),
          ),
          child: TextField(
            controller: controller,
            keyboardType: keyboardType,
            obscureText: obscure,
            onChanged: onChanged,
            style: TextStyle(fontSize: 14.sp, color: ColorConst.textBlackColor),
            decoration: InputDecoration(
              hintText: hint,
              hintStyle:
                  TextStyle(fontSize: 14.sp, color: const Color(0xFF9CA3AF)),
              border: InputBorder.none,
              isDense: true,
              contentPadding: EdgeInsets.symmetric(vertical: 14.h),
            ),
          ),
        ),
      ],
    );
  }
}
