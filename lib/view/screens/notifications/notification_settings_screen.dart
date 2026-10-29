import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../const/color_const.dart';
import '../../../controller/notification_settings_controller.dart';
import '../../screens/settings/widget/custom_settings_switch_tile.dart';

class NotificationSettingsScreen extends StatelessWidget {
  const NotificationSettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<NotificationSettingsController>(
      init: NotificationSettingsController(),
      builder: (controller) {
        return Scaffold(
          backgroundColor: Colors.white,
          body: SafeArea(
            child: Column(
              children: [
                // ── Top Bar ─────────────────────────────────
                Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
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
                              color: const Color(0xFFE5E7EB),
                              width: 1.w,
                            ),
                          ),
                          alignment: Alignment.center,
                          child: Icon(
                            Icons.arrow_back,
                            size: 20.r,
                            color: ColorConst.textBlackColor,
                          ),
                        ),
                      ),
                      Expanded(
                        child: Center(
                          child: Text(
                            'Notification Settings',
                            style: TextStyle(
                              fontSize: 18.sp,
                              fontWeight: FontWeight.bold,
                              color: ColorConst.textBlackColor,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(width: 44.r),
                    ],
                  ),
                ),

                // ── Toggle List ─────────────────────────────
                Expanded(
                  child: ListView(
                    padding:
                        EdgeInsets.symmetric(horizontal: 20.w, vertical: 8.h),
                    children: [
                      CustomSettingsSwitchTile(
                        icon: Icons.notifications_active_outlined,
                        label: 'General Notification',
                        value: controller.generalNotification,
                        onChanged: controller.toggleGeneral,
                      ),
                      const Divider(height: 1, color: Color(0xFFF3F4F6)),
                      CustomSettingsSwitchTile(
                        icon: Icons.volume_up_outlined,
                        label: 'Sound',
                        value: controller.sound,
                        onChanged: controller.toggleSound,
                      ),
                      const Divider(height: 1, color: Color(0xFFF3F4F6)),
                      CustomSettingsSwitchTile(
                        icon: Icons.vibration_outlined,
                        label: 'Vibrate',
                        value: controller.vibrate,
                        onChanged: controller.toggleVibrate,
                      ),
                      const Divider(height: 1, color: Color(0xFFF3F4F6)),
                      CustomSettingsSwitchTile(
                        icon: Icons.local_offer_outlined,
                        label: 'Special Offers',
                        value: controller.specialOffers,
                        onChanged: controller.toggleSpecialOffers,
                      ),
                      const Divider(height: 1, color: Color(0xFFF3F4F6)),
                      CustomSettingsSwitchTile(
                        icon: Icons.discount_outlined,
                        label: 'Promo & Discount',
                        value: controller.promoDiscount,
                        onChanged: controller.togglePromoDiscount,
                      ),
                      const Divider(height: 1, color: Color(0xFFF3F4F6)),
                      CustomSettingsSwitchTile(
                        icon: Icons.payment_outlined,
                        label: 'Payments',
                        value: controller.payments,
                        onChanged: controller.togglePayments,
                      ),
                      const Divider(height: 1, color: Color(0xFFF3F4F6)),
                      CustomSettingsSwitchTile(
                        icon: Icons.account_balance_wallet_outlined,
                        label: 'Cashback',
                        value: controller.cashback,
                        onChanged: controller.toggleCashback,
                      ),
                      const Divider(height: 1, color: Color(0xFFF3F4F6)),
                      CustomSettingsSwitchTile(
                        icon: Icons.system_update_outlined,
                        label: 'App Updates',
                        value: controller.appUpdates,
                        onChanged: controller.toggleAppUpdates,
                      ),
                      const Divider(height: 1, color: Color(0xFFF3F4F6)),
                      CustomSettingsSwitchTile(
                        icon: Icons.new_releases_outlined,
                        label: 'New Service Available',
                        value: controller.newServiceAvailable,
                        onChanged: controller.toggleNewService,
                      ),
                      const Divider(height: 1, color: Color(0xFFF3F4F6)),
                      CustomSettingsSwitchTile(
                        icon: Icons.tips_and_updates_outlined,
                        label: 'New Tips Available',
                        value: controller.newTipsAvailable,
                        onChanged: controller.toggleNewTips,
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
