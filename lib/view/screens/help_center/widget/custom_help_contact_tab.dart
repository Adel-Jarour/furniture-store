import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../controller/help_center_controller.dart';
import 'custom_contact_accordion_item.dart';

class CustomHelpContactTab extends StatelessWidget {
  final HelpCenterController controller;

  const CustomHelpContactTab({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    if (controller.isLoading) {
      return const Center(child: CircularProgressIndicator());
    }
    final channels = controller.contactChannels;
    return ListView.separated(
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 16.h),
      itemCount: channels.length,
      separatorBuilder: (context, index) => SizedBox(height: 12.h),
      itemBuilder: (context, index) {
        final channel = channels[index];
        return CustomContactAccordionItem(
          channel: channel,
          onTap: () => controller.toggleContact(channel.id),
        );
      },
    );
  }
}
