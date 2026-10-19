import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../../const/color_const.dart';
import '../../../../controller/chat_detail_controller.dart';

class CustomChatDetailHeader extends StatelessWidget {
  final ChatDetailController controller;
  const CustomChatDetailHeader({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: ColorConst.primaryColor,
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
      child: Row(
        children: [
          GestureDetector(
            onTap: () => Get.back(),
            child: Container(
              width: 40.r,
              height: 40.r,
              decoration: const BoxDecoration(
                  shape: BoxShape.circle, color: Colors.white),
              alignment: Alignment.center,
              child: Icon(Icons.arrow_back,
                  size: 20.r, color: ColorConst.textBlackColor),
            ),
          ),
          SizedBox(width: 12.w),
          CircleAvatar(
              radius: 20.r,
              backgroundColor: Colors.white,
              child: Icon(Icons.person, color: ColorConst.primaryColor)),
          SizedBox(width: 10.w),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(controller.senderName,
                    style: TextStyle(
                        fontSize: 15.sp,
                        fontWeight: FontWeight.bold,
                        color: Colors.white)),
                Text('Online',
                    style: TextStyle(
                        fontSize: 12.sp,
                        color: Colors.white.withValues(alpha: 0.8))),
              ],
            ),
          ),
          Icon(Icons.more_vert_rounded, size: 22.r, color: Colors.white),
        ],
      ),
    );
  }
}
