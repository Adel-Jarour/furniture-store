import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../const/color_const.dart';
import '../../../../models/chat_message_model.dart';

class CustomChatMessageBubble extends StatelessWidget {
  final ChatMessageModel message;
  final String senderAvatar;

  const CustomChatMessageBubble(
      {super.key, required this.message, required this.senderAvatar});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 12.h),
      child: Column(
        crossAxisAlignment:
            message.isMe ? CrossAxisAlignment.end : CrossAxisAlignment.start,
        children: [
          // Image message
          if (message.imageUrl != null)
            ClipRRect(
              borderRadius: BorderRadius.circular(14.r),
              child: Container(
                width: 200.w,
                height: 140.h,
                color: const Color(0xFFD1D5DB),
                child: Icon(Icons.image, size: 40.r, color: Colors.white),
              ),
            )
          // Voice message
          else if (message.isVoice)
            Container(
              padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
              decoration: BoxDecoration(
                color: ColorConst.primaryColor,
                borderRadius: BorderRadius.circular(20.r),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(Icons.play_arrow_rounded,
                      size: 24.r, color: Colors.white),
                  SizedBox(width: 8.w),
                  // Waveform
                  Row(
                    children: List.generate(
                        18,
                        (i) => Container(
                              width: 3.w,
                              height: (8 + (i % 4) * 6).h,
                              margin: EdgeInsets.only(right: 2.w),
                              decoration: BoxDecoration(
                                color: i < 10
                                    ? Colors.white
                                    : Colors.white.withValues(alpha: 0.4),
                                borderRadius: BorderRadius.circular(2.r),
                              ),
                            )),
                  ),
                  SizedBox(width: 8.w),
                  Text(message.voiceDuration,
                      style: TextStyle(fontSize: 12.sp, color: Colors.white)),
                ],
              ),
            )
          // Text message
          else
            Container(
              padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
              constraints: BoxConstraints(maxWidth: 260.w),
              decoration: BoxDecoration(
                color: message.isMe ? ColorConst.primaryColor : Colors.white,
                borderRadius: BorderRadius.circular(16.r).copyWith(
                  bottomLeft: message.isMe ? null : const Radius.circular(4),
                  bottomRight: message.isMe ? const Radius.circular(4) : null,
                ),
                boxShadow: [
                  BoxShadow(
                      color: Colors.black.withValues(alpha: 0.05),
                      blurRadius: 4)
                ],
              ),
              child: Text(
                message.text,
                style: TextStyle(
                  fontSize: 13.sp,
                  color:
                      message.isMe ? Colors.white : ColorConst.textBlackColor,
                  height: 1.4,
                ),
              ),
            ),

          SizedBox(height: 6.h),
          // Sender info row
          Row(
            mainAxisAlignment:
                message.isMe ? MainAxisAlignment.end : MainAxisAlignment.start,
            children: [
              if (!message.isMe) ...[
                CircleAvatar(
                    radius: 12.r,
                    backgroundColor: ColorConst.primaryColor,
                    child: Icon(Icons.person, size: 14.r, color: Colors.white)),
                SizedBox(width: 6.w),
              ],
              Text('08:04 pm',
                  style: TextStyle(
                      fontSize: 11.sp, color: ColorConst.textGreyColor)),
              if (message.isMe) ...[
                SizedBox(width: 6.w),
                CircleAvatar(
                    radius: 12.r,
                    backgroundColor: const Color(0xFFD1D5DB),
                    child: Icon(Icons.person, size: 14.r, color: Colors.white)),
              ],
            ],
          ),
        ],
      ),
    );
  }
}
