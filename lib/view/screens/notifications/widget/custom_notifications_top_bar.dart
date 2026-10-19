import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../../const/color_const.dart';
import '../../../../controller/notification_controller.dart';

class CustomNotificationsTopBar extends StatelessWidget {
  final NotificationController controller;

  const CustomNotificationsTopBar({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 12.h),
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
                'Notification',
                style: TextStyle(
                  fontSize: 18.sp,
                  fontWeight: FontWeight.bold,
                  color: ColorConst.textBlackColor,
                ),
              ),
            ),
          ),
          if (controller.newCount > 0)
            GestureDetector(
              onTap: controller.markAllRead,
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 6.h),
                decoration: BoxDecoration(
                  color: ColorConst.primaryColor,
                  borderRadius: BorderRadius.circular(20.r),
                ),
                child: Text(
                  '${controller.newCount} NEW',
                  style: TextStyle(
                    fontSize: 11.sp,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            )
          else
            SizedBox(width: 44.r),
        ],
      ),
    );
  }
}
