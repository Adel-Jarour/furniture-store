import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomAddressFormField extends StatelessWidget {
  final TextEditingController controller;
  final String hint;
  final int maxLines;

  const CustomAddressFormField(
      {super.key,
      required this.controller,
      required this.hint,
      this.maxLines = 1});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
          horizontal: 16.w, vertical: maxLines > 1 ? 12.h : 0),
      decoration: BoxDecoration(
        color: const Color(0xFFF7F8F9),
        borderRadius: BorderRadius.circular(12.r),
      ),
      child: TextField(
        controller: controller,
        maxLines: maxLines,
        style: TextStyle(fontSize: 14, color: const Color(0xFF111827)),
        decoration: InputDecoration(
          hintText: hint,
          hintStyle: const TextStyle(fontSize: 14, color: Color(0xFF9CA3AF)),
          border: InputBorder.none,
          isDense: true,
          contentPadding:
              EdgeInsets.symmetric(vertical: maxLines > 1 ? 0 : 16.h),
        ),
      ),
    );
  }
}
