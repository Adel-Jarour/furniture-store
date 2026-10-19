import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../../const/color_const.dart';

class CustomHelpCenterTopBar extends StatelessWidget {
  final String title;

  const CustomHelpCenterTopBar({
    super.key,
    this.title = 'Help Center',
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
      child: Row(
        children: [
          GestureDetector(
            onTap: () => Get.back(),
            child: Container(
              width: 44.r,
              height: 44.r,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white,
                border: Border.all(color: const Color(0xFFE5E7EB), width: 1.w),
              ),
              alignment: Alignment.center,
              child: Icon(
                Icons.arrow_back,
                size: 20.r,
                color: ColorConst.textBlackColor,
              ),
            ),
          ),
          Expanded(
            child: Center(
              child: Text(
                title,
                style: TextStyle(
                  fontSize: 18.sp,
                  fontWeight: FontWeight.bold,
                  color: ColorConst.textBlackColor,
                ),
              ),
            ),
          ),
          SizedBox(width: 44.r),
        ],
      ),
    );
  }
}
