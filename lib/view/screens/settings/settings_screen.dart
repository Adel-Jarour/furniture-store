import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../const/color_const.dart';
import '../../../routes/app_routes.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            // Top Bar
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 12.h),
              child: Row(
                children: [
                  GestureDetector(
                    onTap: () => Get.back(),
                    child: Container(
                      width: 44.r,
                      height: 44.r,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.white,
                          border: Border.all(
                              color: const Color(0xFFE5E7EB), width: 1.w)),
                      alignment: Alignment.center,
                      child: Icon(Icons.arrow_back,
                          size: 20.r, color: ColorConst.textBlackColor),
                    ),
                  ),
                  Expanded(
                      child: Center(
                          child: Text('Settings',
                              style: TextStyle(
                                  fontSize: 18.sp,
                                  fontWeight: FontWeight.bold,
                                  color: ColorConst.textBlackColor)))),
                  SizedBox(width: 44.r),
                ],
              ),
            ),

            // Menu
            Expanded(
              child: ListView(
                padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 8.h),
                children: [
                  _buildSettingsTile(
                    icon: Icons.person_outline_rounded,
                    label: 'Notification Settings',
                    onTap: () => Get.toNamed(AppRoutes.notifications),
                  ),
                  Divider(height: 1.h, color: const Color(0xFFF3F4F6)),
                  _buildSettingsTile(
                    icon: Icons.key_outlined,
                    label: 'Password Manager',
                    onTap: () {},
                  ),
                  Divider(height: 1.h, color: const Color(0xFFF3F4F6)),
                  _buildSettingsTile(
                    icon: Icons.credit_card_outlined,
                    label: 'Delete Account',
                    onTap: () {},
                    isDestructive: true,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSettingsTile(
      {required IconData icon,
      required String label,
      required VoidCallback onTap,
      bool isDestructive = false}) {
    return GestureDetector(
      onTap: onTap,
      behavior: HitTestBehavior.opaque,
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 18.h),
        child: Row(
          children: [
            Icon(icon,
                size: 22.r,
                color: isDestructive
                    ? const Color(0xFFE53935)
                    : ColorConst.textBlackColor),
            SizedBox(width: 16.w),
            Expanded(
              child: Text(label,
                  style: TextStyle(
                    fontSize: 15.sp,
                    fontWeight: FontWeight.w500,
                    color: isDestructive
                        ? const Color(0xFFE53935)
                        : ColorConst.textBlackColor,
                  )),
            ),
            Icon(Icons.chevron_right_rounded,
                size: 20.r, color: ColorConst.textGreyColor),
          ],
        ),
      ),
    );
  }
}
