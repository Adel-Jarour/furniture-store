import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../controller/help_center_controller.dart';
import 'widget/custom_help_center_top_bar.dart';
import 'widget/custom_help_contact_tab.dart';
import 'widget/custom_help_faq_tab.dart';
import 'widget/custom_help_search_bar.dart';
import 'widget/custom_help_tab_bar.dart';

class HelpCenterScreen extends StatelessWidget {
  const HelpCenterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HelpCenterController>(
      init: HelpCenterController(),
      builder: (controller) {
        return Scaffold(
          backgroundColor: Colors.white,
          body: SafeArea(
            child: Column(
              children: [
                const CustomHelpCenterTopBar(),
                Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: 20.w, vertical: 8.h),
                  child: CustomHelpSearchBar(
                    controller: controller.searchController,
                    onChanged: controller.onSearchChanged,
                  ),
                ),
                CustomHelpTabBar(
                  selectedIndex: controller.selectedTabIndex,
                  onTabSelected: controller.setTab,
                ),
                Expanded(
                  child: controller.selectedTabIndex == 0
                      ? CustomHelpFaqTab(controller: controller)
                      : CustomHelpContactTab(controller: controller),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
