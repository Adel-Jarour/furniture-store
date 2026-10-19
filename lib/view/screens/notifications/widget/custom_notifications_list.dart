import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../const/color_const.dart';
import '../../../../controller/notification_controller.dart';
import 'custom_notification_tile.dart';

class CustomNotificationsList extends StatelessWidget {
  final NotificationController controller;

  const CustomNotificationsList({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    if (controller.isLoading) {
      return const Center(child: CircularProgressIndicator());
    }

    return ListView(
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 8.h),
      children: [
        if (controller.todayNotifications.isNotEmpty) ...[
          Text(
            'TODAY',
            style: TextStyle(
              fontSize: 12.sp,
              fontWeight: FontWeight.bold,
              color: ColorConst.textGreyColor,
              letterSpacing: 1.0,
            ),
          ),
          SizedBox(height: 10.h),
          ListView.separated(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: controller.todayNotifications.length,
            separatorBuilder: (context, index) => SizedBox(height: 12.h),
            itemBuilder: (context, index) => CustomNotificationTile(
              notification: controller.todayNotifications[index],
            ),
          ),
          SizedBox(height: 24.h),
        ],
        if (controller.yesterdayNotifications.isNotEmpty) ...[
          Text(
            'YESTERDAY',
            style: TextStyle(
              fontSize: 12.sp,
              fontWeight: FontWeight.bold,
              color: ColorConst.textGreyColor,
              letterSpacing: 1.0,
            ),
          ),
          SizedBox(height: 10.h),
          ListView.separated(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: controller.yesterdayNotifications.length,
            separatorBuilder: (context, index) => SizedBox(height: 12.h),
            itemBuilder: (context, index) => CustomNotificationTile(
              notification: controller.yesterdayNotifications[index],
            ),
          ),
        ],
      ],
    );
  }
}
