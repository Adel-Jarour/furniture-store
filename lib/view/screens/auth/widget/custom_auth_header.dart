import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../const/color_const.dart';
import '../../../widgets/custom_arrow_back.dart';

class CustomAuthHeader extends StatelessWidget {
  final String title;
  final String subtitle;
  final bool showBack;

  const CustomAuthHeader({
    super.key,
    required this.title,
    required this.subtitle,
    this.showBack = true,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (showBack) ...[
          const CustomArrowBack(),
          SizedBox(height: 24.h),
        ],
        Text(
          title,
          style: TextStyle(
            fontSize: 26.sp,
            fontWeight: FontWeight.bold,
            color: ColorConst.textBlackColor,
            height: 1.2,
          ),
        ),
        SizedBox(height: 8.h),
        Text(
          subtitle,
          style: TextStyle(
            fontSize: 14.sp,
            color: ColorConst.textGreyColor,
            height: 1.4,
          ),
        ),
      ],
    );
  }
}
