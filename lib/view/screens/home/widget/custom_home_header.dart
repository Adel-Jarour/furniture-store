import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../../const/color_const.dart';
import '../../../../routes/app_routes.dart';

class CustomHomeHeader extends StatelessWidget {
  final String location;

  const CustomHomeHeader({
    super.key,
    required this.location,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        // Location Info
        GestureDetector(
          onTap: () => Get.toNamed(AppRoutes.location),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Location',
                style: TextStyle(
                  fontSize: 12.sp,
                  color: ColorConst.textGreyColor,
                  fontWeight: FontWeight.w400,
                ),
              ),
              SizedBox(height: 2.h),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
                    Icons.location_on,
                    size: 16.r,
                    color: ColorConst.primaryColor,
                  ),
                  SizedBox(width: 4.w),
                  Text(
                    location,
                    style: TextStyle(
                      fontSize: 15.sp,
                      fontWeight: FontWeight.bold,
                      color: ColorConst.textBlackColor,
                    ),
                  ),
                  SizedBox(width: 4.w),
                  Icon(
                    Icons.keyboard_arrow_down_rounded,
                    size: 18.r,
                    color: ColorConst.textBlackColor,
                  ),
                ],
              ),
            ],
          ),
        ),

        // Notification Bell with Badge
        GestureDetector(
          onTap: () {},
          child: Container(
            width: 44.r,
            height: 44.r,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: const Color(0xFFF3F4F6),
            ),
            child: Stack(
              alignment: Alignment.center,
              children: [
                Icon(
                  Icons.notifications_none_rounded,
                  size: 22.r,
                  color: ColorConst.textBlackColor,
                ),
                Positioned(
                  top: 10.r,
                  right: 12.r,
                  child: Container(
                    width: 7.r,
                    height: 7.r,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Color(0xFFEF4444),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
