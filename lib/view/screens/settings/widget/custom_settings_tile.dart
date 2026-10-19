import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../const/color_const.dart';

class CustomSettingsTile extends StatelessWidget {
  final IconData icon;
  final String label;
  final VoidCallback onTap;
  final String? value;

  const CustomSettingsTile({
    super.key,
    required this.icon,
    required this.label,
    required this.onTap,
    this.value,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(10.r),
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 14.h),
        child: Row(
          children: [
            Icon(icon, size: 22.r, color: ColorConst.primaryColor),
            SizedBox(width: 16.w),
            Expanded(
              child: Text(
                label,
                style: TextStyle(
                  fontSize: 15.sp,
                  fontWeight: FontWeight.w500,
                  color: ColorConst.textBlackColor,
                ),
              ),
            ),
            if (value != null) ...[
              Text(
                value!,
                style: TextStyle(
                  fontSize: 14.sp,
                  color: ColorConst.textGreyColor,
                  fontWeight: FontWeight.w500,
                ),
              ),
              SizedBox(width: 8.w),
            ],
            Icon(
              Icons.chevron_right_rounded,
              size: 20.r,
              color: ColorConst.textGreyColor,
            ),
          ],
        ),
      ),
    );
  }
}
