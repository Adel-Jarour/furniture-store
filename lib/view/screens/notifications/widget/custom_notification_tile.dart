import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../const/color_const.dart';
import '../../../../models/notification_model.dart';

class CustomNotificationTile extends StatelessWidget {
  final NotificationModel notification;
  const CustomNotificationTile({super.key, required this.notification});

  IconData _getIcon() {
    switch (notification.type) {
      case 'order':
        return Icons.local_shipping_outlined;
      case 'promo':
        return Icons.local_offer_outlined;
      case 'review':
        return Icons.star_outline_rounded;
      case 'payment':
        return Icons.account_balance_wallet_outlined;
      default:
        return Icons.notifications_outlined;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 14.h),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 46.r,
            height: 46.r,
            decoration: BoxDecoration(
                shape: BoxShape.circle, color: const Color(0xFFF3F4F6)),
            alignment: Alignment.center,
            child:
                Icon(_getIcon(), size: 22.r, color: ColorConst.textBlackColor),
          ),
          SizedBox(width: 14.w),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Text(notification.title,
                          style: TextStyle(
                              fontSize: 14.sp,
                              fontWeight: FontWeight.bold,
                              color: ColorConst.textBlackColor)),
                    ),
                    Text(notification.time,
                        style: TextStyle(
                            fontSize: 11.sp, color: ColorConst.textGreyColor)),
                  ],
                ),
                SizedBox(height: 4.h),
                Text(notification.body,
                    style: TextStyle(
                        fontSize: 12.sp,
                        color: ColorConst.textGreyColor,
                        height: 1.4)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
