import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../const/color_const.dart';
import '../../../controller/chat_detail_controller.dart';
import 'widget/custom_chat_message_bubble.dart';
import 'widget/custom_chat_input_bar.dart';
import 'widget/custom_chat_detail_header.dart';

class ChatDetailScreen extends StatelessWidget {
  const ChatDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ChatDetailController>(
      init: ChatDetailController(),
      builder: (controller) {
        return Scaffold(
          backgroundColor: Colors.white,
          body: SafeArea(
            child: Column(
              children: [
                // Header
                CustomChatDetailHeader(controller: controller),

                // Messages list
                Expanded(
                  child: Container(
                    decoration: const BoxDecoration(color: Color(0xFFF7F8F9)),
                    child: ListView.builder(
                      padding: EdgeInsets.symmetric(
                          horizontal: 16.w, vertical: 16.h),
                      itemCount:
                          controller.messages.length + 1, // +1 for date label
                      itemBuilder: (context, index) {
                        if (index == 0) {
                          return Padding(
                            padding: EdgeInsets.only(bottom: 16.h),
                            child: Center(
                                child: Text('TODAY',
                                    style: TextStyle(
                                        fontSize: 11.sp,
                                        fontWeight: FontWeight.w600,
                                        color: ColorConst.textGreyColor,
                                        letterSpacing: 1))),
                          );
                        }
                        final msg = controller.messages[index - 1];
                        return CustomChatMessageBubble(
                            message: msg,
                            senderAvatar: controller.senderAvatar);
                      },
                    ),
                  ),
                ),

                // Input Bar
                CustomChatInputBar(controller: controller),
              ],
            ),
          ),
        );
      },
    );
  }
}
