import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../../const/color_const.dart';
import '../../../../controller/chat_detail_controller.dart';

class CustomChatInputBar extends StatelessWidget {
  final ChatDetailController controller;
  const CustomChatInputBar({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
              color: Colors.black.withValues(alpha: 0.05),
              blurRadius: 8,
              offset: const Offset(0, -2))
        ],
      ),
      child: Row(
        children: [
          GestureDetector(
            onTap: () => Get.snackbar(
              'Attachment',
              'Image picker will be available with camera integration.',
              snackPosition: SnackPosition.BOTTOM,
            ),
            child: Container(
              width: 40.r,
              height: 40.r,
              decoration: BoxDecoration(
                  shape: BoxShape.circle, color: const Color(0xFFF3F4F6)),
              alignment: Alignment.center,
              child:
                  Icon(Icons.add, size: 20.r, color: ColorConst.textGreyColor),
            ),
          ),
          SizedBox(width: 10.w),
          Expanded(
            child: Container(
              height: 44.h,
              padding: EdgeInsets.symmetric(horizontal: 14.w),
              decoration: BoxDecoration(
                color: const Color(0xFFF7F8F9),
                borderRadius: BorderRadius.circular(22.r),
              ),
              child: TextField(
                controller: controller.messageController,
                style:
                    TextStyle(fontSize: 14.sp, color: const Color(0xFF111827)),
                decoration: InputDecoration(
                  hintText: 'Type a message here...',
                  hintStyle: TextStyle(
                      fontSize: 14.sp, color: const Color(0xFF9CA3AF)),
                  border: InputBorder.none,
                  isDense: true,
                  contentPadding: EdgeInsets.symmetric(vertical: 10.h),
                ),
              ),
            ),
          ),
          SizedBox(width: 10.w),
          GestureDetector(
            onTap: controller.sendMessage,
            child: Container(
              width: 44.r,
              height: 44.r,
              decoration: BoxDecoration(
                  shape: BoxShape.circle, color: ColorConst.primaryColor),
              alignment: Alignment.center,
              child: Icon(Icons.mic_rounded, size: 20.r, color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }
}
