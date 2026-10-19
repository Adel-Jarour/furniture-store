import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../const/color_const.dart';
import '../../../controller/bottom_nav_controller.dart';
import '../cart/cart_screen.dart';
import '../chat/chat_screen.dart';
import '../home/home_screen.dart';
import '../profile/profile_screen.dart';
import '../wishlist/wishlist_screen.dart';

class BottomNavScreen extends StatelessWidget {
  const BottomNavScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<BottomNavController>(
      init: BottomNavController(),
      builder: (controller) {
        final List<Widget> pages = [
          const HomeScreen(),
          const CartScreen(showBackButton: false),
          const WishlistScreen(),
          const ChatScreen(),
          const ProfileScreen(),
        ];

        return Scaffold(
          backgroundColor: Colors.white,
          body: Stack(
            children: [
              // Current active page indexed stack
              IndexedStack(
                index: controller.currentIndex,
                children: pages,
              ),

              // ── Floating Dark Pill Navigation Bar ───────────────────
              Positioned(
                left: 16.w,
                right: 16.w,
                bottom: 16.h,
                child: Container(
                  height: 64.h,
                  padding: EdgeInsets.symmetric(horizontal: 8.w),
                  decoration: BoxDecoration(
                    color: const Color(0xFF0F201C), // Deep dark teal pill
                    borderRadius: BorderRadius.circular(36.r),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withValues(alpha: 0.25),
                        blurRadius: 18,
                        offset: const Offset(0, 8),
                      ),
                    ],
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      // 1. Home
                      _buildNavItem(
                        index: 0,
                        currentIndex: controller.currentIndex,
                        activeIcon: Icons.home_rounded,
                        inactiveIcon: Icons.home_outlined,
                        onTap: () => controller.changeTab(0),
                      ),

                      // 2. Cart / Shop
                      _buildNavItem(
                        index: 1,
                        currentIndex: controller.currentIndex,
                        activeIcon: Icons.shopping_bag_rounded,
                        inactiveIcon: Icons.shopping_bag_outlined,
                        onTap: () => controller.changeTab(1),
                      ),

                      // 3. Wishlist
                      _buildNavItem(
                        index: 2,
                        currentIndex: controller.currentIndex,
                        activeIcon: Icons.favorite_rounded,
                        inactiveIcon: Icons.favorite_border_rounded,
                        onTap: () => controller.changeTab(2),
                      ),

                      // 4. Chat
                      _buildNavItem(
                        index: 3,
                        currentIndex: controller.currentIndex,
                        activeIcon: Icons.chat_bubble_rounded,
                        inactiveIcon: Icons.chat_bubble_outline_rounded,
                        onTap: () => controller.changeTab(3),
                      ),

                      // 5. Profile
                      _buildNavItem(
                        index: 4,
                        currentIndex: controller.currentIndex,
                        activeIcon: Icons.person_rounded,
                        inactiveIcon: Icons.person_outline_rounded,
                        onTap: () => controller.changeTab(4),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildNavItem({
    required int index,
    required int currentIndex,
    required IconData activeIcon,
    required IconData inactiveIcon,
    required VoidCallback onTap,
  }) {
    final isActive = currentIndex == index;

    return GestureDetector(
      onTap: onTap,
      behavior: HitTestBehavior.opaque,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        width: 48.r,
        height: 48.r,
        decoration: BoxDecoration(
          color: isActive ? Colors.white : Colors.transparent,
          shape: BoxShape.circle,
        ),
        alignment: Alignment.center,
        child: Icon(
          isActive ? activeIcon : inactiveIcon,
          size: 24.r,
          color: isActive ? ColorConst.primaryColor : Colors.white70,
        ),
      ),
    );
  }
}
