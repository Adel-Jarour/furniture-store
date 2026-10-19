import 'package:get/get.dart';

class BottomNavController extends GetxController {
  int currentIndex = 0;

  void changeTab(int index) {
    if (currentIndex == index) return;
    currentIndex = index;
    update();
  }
}
