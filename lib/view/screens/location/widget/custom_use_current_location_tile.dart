import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../const/color_const.dart';

class CustomUseCurrentLocationTile extends StatelessWidget {
  final VoidCallback onTap;

  const CustomUseCurrentLocationTile({super.key, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(10.r),
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 14.h),
            child: Row(
              children: [
                Icon(
                  Icons.near_me_rounded,
                  size: 22.r,
                  color: ColorConst.primaryColor,
                ),
                SizedBox(width: 14.w),
                Expanded(
                  child: Text(
                    'Use my current location',
                    style: TextStyle(
                      fontSize: 15.sp,
                      fontWeight: FontWeight.w600,
                      color: ColorConst.textBlackColor,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        const Divider(height: 1, color: Color(0xFFE5E7EB)),
      ],
    );
  }
}
