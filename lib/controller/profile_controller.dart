import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../const/image_const.dart';
import '../routes/app_routes.dart';
import '../utils/my_shared_pref.dart';

import '../view/screens/profile/widget/custom_logout_bottom_sheet.dart';

class ProfileMenuItem {
  final String title;
  final IconData icon;
  final VoidCallback onTap;

  const ProfileMenuItem({
    required this.title,
    required this.icon,
    required this.onTap,
  });
}

class ProfileController extends GetxController {
  String userName = 'Esther Howard';
  String avatarImage = ImageConst.avatarProfile;

  late final List<ProfileMenuItem> menuItems = [
    ProfileMenuItem(
      title: 'Your profile',
      icon: Icons.person_outline_rounded,
      onTap: () => Get.toNamed(AppRoutes.completeProfile),
    ),
    ProfileMenuItem(
      title: 'Manage Address',
      icon: Icons.location_on_outlined,
      onTap: () => Get.toNamed(AppRoutes.manageAddress),
    ),
    ProfileMenuItem(
      title: 'Payment Methods',
      icon: Icons.credit_card_outlined,
      onTap: () => Get.toNamed(AppRoutes.paymentMethods),
    ),
    ProfileMenuItem(
      title: 'My Orders',
      icon: Icons.assignment_outlined,
      onTap: () => Get.toNamed(AppRoutes.orders),
    ),
    ProfileMenuItem(
      title: 'My Coupons',
      icon: Icons.confirmation_number_outlined,
      onTap: () => Get.toNamed(AppRoutes.coupons),
    ),
    ProfileMenuItem(
      title: 'Settings',
      icon: Icons.settings_outlined,
      onTap: () => Get.toNamed(AppRoutes.settings),
    ),
    ProfileMenuItem(
      title: 'Help Center',
      icon: Icons.info_outline_rounded,
      onTap: () => Get.toNamed(AppRoutes.helpCenter),
    ),
    ProfileMenuItem(
      title: 'Privacy Policy',
      icon: Icons.lock_outline_rounded,
      onTap: () => Get.toNamed(AppRoutes.privacyPolicy),
    ),
    ProfileMenuItem(
      title: 'Invites Friends',
      icon: Icons.group_add_outlined,
      onTap: () => Get.toNamed(AppRoutes.inviteFriends),
    ),
    ProfileMenuItem(
      title: 'Log out',
      icon: Icons.logout_rounded,
      onTap: confirmLogout,
    ),
  ];

  void confirmLogout() {
    if (Get.context != null) {
      CustomLogoutBottomSheet.show(
        Get.context!,
        onConfirmLogout: logout,
      );
    }
  }

  Future<void> logout() async {
    await MySharedPref.clearSession();
    Get.offAllNamed(AppRoutes.welcome);
  }
}
