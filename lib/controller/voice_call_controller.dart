import 'dart:async';
import 'package:get/get.dart';
import '../routes/app_routes.dart';

class VoiceCallController extends GetxController {
  final String repName = 'Sheila Lemke';
  int secondsElapsed = 1500; // starts at 25:00 for design match
  Timer? _timer;

  bool isMuted = false;
  bool isSpeakerOn = true;

  @override
  void onInit() {
    super.onInit();
    _startTimer();
  }

  void _startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 1), (_) {
      secondsElapsed++;
      update();
    });
  }

  String get formattedDuration {
    final minutes = (secondsElapsed ~/ 60).toString().padLeft(2, '0');
    final seconds = (secondsElapsed % 60).toString().padLeft(2, '0');
    return '$minutes:$seconds';
  }

  void toggleMute() {
    isMuted = !isMuted;
    update();
  }

  void toggleSpeaker() {
    isSpeakerOn = !isSpeakerOn;
    update();
  }

  void switchToVideoCall() {
    _timer?.cancel();
    Get.offNamed(AppRoutes.videoCall);
  }

  void endCall() {
    _timer?.cancel();
    Get.back();
  }

  void openChat() {
    Get.toNamed(AppRoutes.chatDetail);
  }

  @override
  void onClose() {
    _timer?.cancel();
    super.onClose();
  }
}
