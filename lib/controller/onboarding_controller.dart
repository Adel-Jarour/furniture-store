import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../const/color_const.dart';
import '../const/image_const.dart';
import '../routes/app_routes.dart';
import '../utils/my_shared_pref.dart';

class OnboardingItem {
  final String image;
  final TextSpan titleSpan;
  final String description;

  const OnboardingItem({
    required this.image,
    required this.titleSpan,
    required this.description,
  });
}

class OnboardingController extends GetxController {
  final PageController pageController = PageController();
  int currentPage = 0;

  final List<OnboardingItem> items = [
    // ── Screen 1 ─────────────────────────────────────────────
    const OnboardingItem(
      image: ImageConst.onboarding1,
      titleSpan: TextSpan(
        style: TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.bold,
          height: 1.25,
        ),
        children: [
          TextSpan(
            text: 'Seamless ',
            style: TextStyle(color: ColorConst.primaryColor),
          ),
          TextSpan(
            text: 'Shopping\nExperience',
            style: TextStyle(color: ColorConst.textBlackColor),
          ),
        ],
      ),
      description:
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt',
    ),

    // ── Screen 2 ─────────────────────────────────────────────
    const OnboardingItem(
      image: ImageConst.onboarding2,
      titleSpan: TextSpan(
        style: TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.bold,
          height: 1.25,
        ),
        children: [
          TextSpan(
            text: 'Wishlist: Where Your\n',
            style: TextStyle(color: ColorConst.textBlackColor),
          ),
          TextSpan(
            text: "Home's Dreams ",
            style: TextStyle(color: ColorConst.primaryColor),
          ),
          TextSpan(
            text: 'Begin',
            style: TextStyle(color: ColorConst.textBlackColor),
          ),
        ],
      ),
      description:
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt',
    ),

    // ── Screen 3 ─────────────────────────────────────────────
    const OnboardingItem(
      image: ImageConst.onboarding3,
      titleSpan: TextSpan(
        style: TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.bold,
          height: 1.25,
        ),
        children: [
          TextSpan(
            text: 'Swift ',
            style: TextStyle(color: ColorConst.primaryColor),
          ),
          TextSpan(
            text: 'and ',
            style: TextStyle(color: ColorConst.textBlackColor),
          ),
          TextSpan(
            text: 'Reliable\n',
            style: TextStyle(color: ColorConst.primaryColor),
          ),
          TextSpan(
            text: 'Delivery',
            style: TextStyle(color: ColorConst.textBlackColor),
          ),
        ],
      ),
      description:
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt',
    ),
  ];

  void onPageChanged(int index) {
    currentPage = index;
    update();
  }

  Future<void> completeOnboarding() async {
    await MySharedPref.setIsOnboarded(true);
    Get.offAllNamed(AppRoutes.location);
  }

  void next() {
    if (currentPage < items.length - 1) {
      pageController.nextPage(
        duration: const Duration(milliseconds: 350),
        curve: Curves.easeInOut,
      );
    } else {
      completeOnboarding();
    }
  }

  void previous() {
    if (currentPage > 0) {
      pageController.previousPage(
        duration: const Duration(milliseconds: 350),
        curve: Curves.easeInOut,
      );
    }
  }

  void skip() {
    completeOnboarding();
  }

  @override
  void onClose() {
    pageController.dispose();
    super.onClose();
  }
}
