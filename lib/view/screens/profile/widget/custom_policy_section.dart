import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../const/color_const.dart';

class CustomPolicySection extends StatelessWidget {
  final String title;
  final List<String> paragraphs;

  const CustomPolicySection({
    super.key,
    required this.title,
    required this.paragraphs,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(
            fontSize: 16.sp,
            fontWeight: FontWeight.bold,
            color: ColorConst.primaryColor,
          ),
        ),
        SizedBox(height: 12.h),
        ...paragraphs.map(
          (text) => Padding(
            padding: EdgeInsets.only(bottom: 12.h),
            child: Text(
              text,
              style: TextStyle(
                fontSize: 13.5.sp,
                height: 1.6,
                color: ColorConst.textGreyColor,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
