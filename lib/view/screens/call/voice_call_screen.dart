import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../const/image_const.dart';
import '../../../controller/voice_call_controller.dart';
import 'widget/custom_call_controls_bar.dart';
import 'widget/custom_call_info_overlay.dart';
import 'widget/custom_voice_call_rep_card.dart';

class VoiceCallScreen extends StatelessWidget {
  const VoiceCallScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<VoiceCallController>(
      init: VoiceCallController(),
      builder: (controller) {
        return Scaffold(
          backgroundColor: Colors.black,
          body: Stack(
            children: [
              // Fullscreen blurred background
              Positioned.fill(
                child: ImageFiltered(
                  imageFilter: ImageFilter.blur(sigmaX: 22, sigmaY: 22),
                  child: Image.asset(
                    ImageConst.callRepAgent,
                    fit: BoxFit.cover,
                    errorBuilder: (_, __, ___) => Container(
                      color: const Color(0xFF1F2937),
                    ),
                  ),
                ),
              ),

              // Soft dark overlay
              Positioned.fill(
                child: Container(
                  color: Colors.black.withValues(alpha: 0.25),
                ),
              ),

              // Centered crisp Representative card
              const Center(
                child: CustomVoiceCallRepCard(),
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
                      isVoiceMode: true,
                      onToggleSpeaker: controller.toggleSpeaker,
                      onToggleMute: controller.toggleMute,
                      onToggleVideo: controller.switchToVideoCall,
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
