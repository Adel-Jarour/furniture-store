import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../const/color_const.dart';
import '../../../controller/notification_controller.dart';
import 'widget/custom_notification_tile.dart';

class NotificationsScreen extends StatelessWidget {
  const NotificationsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<NotificationController>(
      init: NotificationController(),
      builder: (controller) {
        return Scaffold(
          backgroundColor: Colors.white,
          body: SafeArea(
            child: Column(
              children: [
                // Top Bar
                Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: 20.w, vertical: 12.h),
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
                              border: Border.all(
                                  color: const Color(0xFFE5E7EB), width: 1.w)),
                          alignment: Alignment.center,
                          child: Icon(Icons.arrow_back,
                              size: 20.r, color: ColorConst.textBlackColor),
                        ),
                      ),
                      Expanded(
                          child: Center(
                              child: Text('Notification',
                                  style: TextStyle(
                                      fontSize: 18.sp,
                                      fontWeight: FontWeight.bold,
                                      color: ColorConst.textBlackColor)))),
                      if (controller.newCount > 0)
                        Container(
                          padding: EdgeInsets.symmetric(
                              horizontal: 12.w, vertical: 6.h),
                          decoration: BoxDecoration(
                              color: ColorConst.primaryColor,
                              borderRadius: BorderRadius.circular(20.r)),
                          child: Text('${controller.newCount} NEW',
                              style: TextStyle(
                                  fontSize: 11.sp,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white)),
                        )
                      else
                        SizedBox(width: 44.r),
                    ],
                  ),
                ),

                // Body
                Expanded(
                  child: ListView(
                    padding: EdgeInsets.symmetric(horizontal: 20.w),
                    children: [
                      // TODAY group
                      _buildGroupHeader('TODAY', controller.markAllRead),
                      ...controller.todayNotifications
                          .map((n) => CustomNotificationTile(notification: n)),
                      SizedBox(height: 8.h),

                      // YESTERDAY group
                      _buildGroupHeader('YESTERDAY', () {}),
                      ...controller.yesterdayNotifications
                          .map((n) => CustomNotificationTile(notification: n)),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildGroupHeader(String label, VoidCallback onMarkAll) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 10.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label,
              style: TextStyle(
                  fontSize: 12.sp,
                  fontWeight: FontWeight.bold,
                  color: const Color(0xFF6B7280),
                  letterSpacing: 1)),
          GestureDetector(
            onTap: onMarkAll,
            child: Text('Mark all as read',
                style:
                    TextStyle(fontSize: 12.sp, color: const Color(0xFF6B7280))),
          ),
        ],
      ),
    );
  }
}
