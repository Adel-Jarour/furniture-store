import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../const/color_const.dart';

class CustomCallControlsBar extends StatelessWidget {
  final bool isSpeakerOn;
  final bool isMuted;
  final bool isVideoOff;
  final bool isVoiceMode;
  final VoidCallback onToggleSpeaker;
  final VoidCallback onToggleMute;
  final VoidCallback onToggleVideo;
  final VoidCallback onEndCall;
  final VoidCallback onOpenChat;

  const CustomCallControlsBar({
    super.key,
    required this.isSpeakerOn,
    required this.isMuted,
    this.isVideoOff = false,
    this.isVoiceMode = false,
    required this.onToggleSpeaker,
    required this.onToggleMute,
    required this.onToggleVideo,
    required this.onEndCall,
    required this.onOpenChat,
  });

  Widget _buildControlBtn({
    required IconData icon,
    required VoidCallback onTap,
    bool showBadge = false,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Container(
            width: 50.r,
            height: 50.r,
            decoration: BoxDecoration(
              color: Colors.white.withValues(alpha: 0.18),
              borderRadius: BorderRadius.circular(16.r),
            ),
            alignment: Alignment.center,
            child: Icon(
              icon,
              size: 24.r,
              color: Colors.white,
            ),
          ),
          if (showBadge)
            Positioned(
              top: -2.r,
              right: -2.r,
              child: Container(
                width: 10.r,
                height: 10.r,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Color(0xFFEF4444),
                ),
              ),
            ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.only(
        top: 24.h,
        bottom: 24.h,
        left: 20.w,
        right: 20.w,
      ),
      decoration: BoxDecoration(
        color: ColorConst.primaryColor.withValues(alpha: 0.92),
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(32.r),
          topRight: Radius.circular(32.r),
        ),
      ),
      child: SafeArea(
        top: false,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            // 1. Speaker
            _buildControlBtn(
              icon: isSpeakerOn
                  ? Icons.volume_up_rounded
                  : Icons.volume_off_rounded,
              onTap: onToggleSpeaker,
            ),

            // 2. Mic
            _buildControlBtn(
              icon: isMuted ? Icons.mic_off_rounded : Icons.mic_rounded,
              onTap: onToggleMute,
            ),

            // 3. End Call (Prominent Red Button)
            GestureDetector(
              onTap: onEndCall,
              child: Container(
                width: 62.r,
                height: 62.r,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Color(0xFFEF4444),
                  boxShadow: [
                    BoxShadow(
                      color: Color(0x55EF4444),
                      blurRadius: 12,
                      offset: Offset(0, 4),
                    ),
                  ],
                ),
                alignment: Alignment.center,
                child: Icon(
                  Icons.call_end_rounded,
                  size: 30.r,
                  color: Colors.white,
                ),
              ),
            ),

            // 4. Video Toggle / Switch
            _buildControlBtn(
              icon: isVoiceMode
                  ? Icons.videocam_rounded
                  : (isVideoOff
                      ? Icons.videocam_off_rounded
                      : Icons.videocam_rounded),
              onTap: onToggleVideo,
            ),

            // 5. Chat with unread badge
            _buildControlBtn(
              icon: Icons.chat_bubble_rounded,
              onTap: onOpenChat,
              showBadge: true,
            ),
          ],
        ),
      ),
    );
  }
}
