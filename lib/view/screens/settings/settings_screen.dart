import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../controller/settings_controller.dart';
import '../../../routes/app_routes.dart';
import 'widget/custom_settings_switch_tile.dart';
import 'widget/custom_settings_tile.dart';
import 'widget/custom_settings_top_bar.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SettingsController>(
      init: SettingsController(),
      builder: (controller) {
        return Scaffold(
          backgroundColor: Colors.white,
          body: SafeArea(
            child: Column(
              children: [
                const CustomSettingsTopBar(),
                Expanded(
                  child: ListView(
                    padding:
                        EdgeInsets.symmetric(horizontal: 20.w, vertical: 8.h),
                    children: [
                      CustomSettingsTile(
                        icon: Icons.notifications_outlined,
                        label: 'Notification Settings',
                        onTap: () =>
                            Get.toNamed(AppRoutes.notificationSettings),
                      ),
                      const Divider(height: 1, color: Color(0xFFF3F4F6)),
                      CustomSettingsTile(
                        icon: Icons.key_outlined,
                        label: 'Password Manager',
                        onTap: () => Get.toNamed(AppRoutes.passwordManager),
                      ),
                      const Divider(height: 1, color: Color(0xFFF3F4F6)),
                      CustomSettingsTile(
                        icon: Icons.delete_outline_rounded,
                        label: 'Delete Account',
                        onTap: () => Get.dialog(
                          AlertDialog(
                            title: const Text('Delete Account'),
                            content: const Text(
                                'Are you sure you want to delete your account? This action cannot be undone.'),
                            actions: [
                              TextButton(
                                onPressed: () => Get.back(),
                                child: const Text('Cancel'),
                              ),
                              TextButton(
                                onPressed: () {
                                  Get.back();
                                  Get.snackbar(
                                    'Account Deleted',
                                    'Your account has been successfully deleted.',
                                    snackPosition: SnackPosition.BOTTOM,
                                  );
                                },
                                child: const Text(
                                  'Delete',
                                  style: TextStyle(color: Colors.red),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      const Divider(height: 1, color: Color(0xFFF3F4F6)),
                      CustomSettingsSwitchTile(
                        icon: Icons.fingerprint_rounded,
                        label: 'Face ID / Biometric',
                        value: controller.faceIdEnabled,
                        onChanged: controller.toggleFaceId,
                      ),
                      const Divider(height: 1, color: Color(0xFFF3F4F6)),
                      CustomSettingsSwitchTile(
                        icon: Icons.dark_mode_outlined,
                        label: 'Dark Mode',
                        value: controller.darkModeEnabled,
                        onChanged: controller.toggleDarkMode,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
