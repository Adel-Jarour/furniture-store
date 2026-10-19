import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../const/color_const.dart';
import '../../../../controller/profile_controller.dart';

class CustomProfileMenuItem extends StatelessWidget {
  final ProfileMenuItem item;

  const CustomProfileMenuItem({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: item.onTap,
      behavior: HitTestBehavior.opaque,
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 2.h),
        child: Row(
          children: [
            Icon(item.icon, size: 22.r, color: ColorConst.primaryColor),
            SizedBox(width: 16.w),
            Expanded(
              child: Text(
                item.title,
                style: TextStyle(
                  fontSize: 15.sp,
                  fontWeight: FontWeight.w500,
                  color: ColorConst.textBlackColor,
                ),
              ),
            ),
            Icon(Icons.chevron_right_rounded,
                size: 20.r, color: ColorConst.textGreyColor),
          ],
        ),
      ),
    );
  }
}
