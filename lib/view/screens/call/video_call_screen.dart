import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../const/image_const.dart';
import '../../../controller/video_call_controller.dart';
import 'widget/custom_call_controls_bar.dart';
import 'widget/custom_call_info_overlay.dart';
import 'widget/custom_call_live_badge.dart';
import 'widget/custom_pip_camera_view.dart';

class VideoCallScreen extends StatelessWidget {
  const VideoCallScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<VideoCallController>(
      init: VideoCallController(),
      builder: (controller) {
        return Scaffold(
          backgroundColor: Colors.black,
          body: Stack(
            children: [
              // Fullscreen representative video feed
              Positioned.fill(
                child: Image.asset(
                  ImageConst.callRepAgent,
                  fit: BoxFit.cover,
                  errorBuilder: (_, __, ___) => Container(
                    color: const Color(0xFF1F2937),
                    child: const Icon(Icons.person,
                        size: 100, color: Colors.white),
                  ),
                ),
              ),

              // Gradient vignette at bottom
              Positioned.fill(
                child: Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Colors.black.withValues(alpha: 0.3),
                        Colors.transparent,
                        Colors.black.withValues(alpha: 0.6),
                      ],
                    ),
                  ),
                ),
              ),

              // Top Live badge and user PIP
              SafeArea(
                child: Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: 20.w, vertical: 12.h),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      CustomCallLiveBadge(),
                      CustomPipCameraView(),
                    ],
                  ),
                ),
              ),

              // Bottom Section: Info + Controls
              Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: 24.w, vertical: 16.h),
                      child: CustomCallInfoOverlay(
                        name: controller.repName,
                        duration: controller.formattedDuration,
                      ),
                    ),
                    CustomCallControlsBar(
                      isSpeakerOn: controller.isSpeakerOn,
                      isMuted: controller.isMuted,
                      isVideoOff: controller.isVideoOff,
                      onToggleSpeaker: controller.toggleSpeaker,
                      onToggleMute: controller.toggleMute,
                      onToggleVideo: controller.toggleVideo,
                      onEndCall: controller.endCall,
                      onOpenChat: controller.openChat,
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
