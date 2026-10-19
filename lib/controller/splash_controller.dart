import 'package:get/get.dart';
import '../routes/app_routes.dart';
import '../utils/my_shared_pref.dart';

class SplashController extends GetxController {
  @override
  void onInit() {
    super.onInit();
    _handleRouting();
  }

  Future<void> _handleRouting() async {
    await Future.delayed(const Duration(milliseconds: 2200));

    final isLoggedIn = MySharedPref.isLoggedIn();

    if (!isLoggedIn) {
      // If user is not logged in, always start at Welcome Screen
      Get.offAllNamed(AppRoutes.welcome);
    } else {
      Get.offAllNamed(AppRoutes.bottomNav);
    }
  }
}
