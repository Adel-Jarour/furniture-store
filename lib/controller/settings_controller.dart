import 'package:get/get.dart';

class SettingsController extends GetxController {
  bool faceIdEnabled = true;
  bool darkModeEnabled = false;

  void toggleFaceId(bool value) {
    faceIdEnabled = value;
    update();
  }

  void toggleDarkMode(bool value) {
    darkModeEnabled = value;
    update();
  }
}
