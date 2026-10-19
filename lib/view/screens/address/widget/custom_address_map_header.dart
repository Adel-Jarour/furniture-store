import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../const/image_const.dart';

class CustomAddressMapHeader extends StatelessWidget {
  const CustomAddressMapHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 180.h,
      width: double.infinity,
      margin: EdgeInsets.symmetric(horizontal: 20.w, vertical: 8.h),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16.r),
        color: const Color(0xFFF3F4F6),
        image: const DecorationImage(
          image: AssetImage(ImageConst.mapPlaceholder),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
