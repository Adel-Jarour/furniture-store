import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../const/color_const.dart';

class CustomAddressFormField extends StatelessWidget {
  final String? label;
  final TextEditingController controller;
  final String hint;
  final int maxLines;

  const CustomAddressFormField({
    super.key,
    this.label,
    required this.controller,
    required this.hint,
    this.maxLines = 1,
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
              fontSize: 13.sp,
              fontWeight: FontWeight.w500,
              color: ColorConst.textBlackColor,
            ),
          ),
          SizedBox(height: 8.h),
        ],
        Container(
          padding: EdgeInsets.symmetric(
            horizontal: 16.w,
            vertical: maxLines > 1 ? 12.h : 0,
          ),
          decoration: BoxDecoration(
            color: const Color(0xFFF7F8F9),
            borderRadius: BorderRadius.circular(12.r),
          ),
          child: TextField(
            controller: controller,
            maxLines: maxLines,
            style: TextStyle(
              fontSize: 14.sp,
              color: const Color(0xFF111827),
            ),
            decoration: InputDecoration(
              hintText: hint,
              hintStyle: TextStyle(
                fontSize: 14.sp,
                color: const Color(0xFF9CA3AF),
              ),
              border: InputBorder.none,
              isDense: true,
              contentPadding: EdgeInsets.symmetric(
                vertical: maxLines > 1 ? 0 : 16.h,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
