import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../controller/notification_controller.dart';
import 'widget/custom_notifications_list.dart';
import 'widget/custom_notifications_top_bar.dart';

class NotificationsScreen extends StatelessWidget {
  const NotificationsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<NotificationController>(
      init: NotificationController(),
      builder: (controller) {
        return Scaffold(
          backgroundColor: Colors.white,
          body: SafeArea(
            child: Column(
              children: [
                CustomNotificationsTopBar(controller: controller),
                Expanded(
                    child: CustomNotificationsList(controller: controller)),
              ],
            ),
          ),
        );
      },
    );
  }
}
