import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../controller/help_center_controller.dart';
import 'widget/custom_contact_accordion_item.dart';
import 'widget/custom_faq_accordion_item.dart';
import 'widget/custom_faq_categories_row.dart';
import 'widget/custom_help_center_top_bar.dart';
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
                // Top Bar
                const CustomHelpCenterTopBar(),

                // Search Bar
                Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: 20.w, vertical: 8.h),
                  child: CustomHelpSearchBar(
                    controller: controller.searchController,
                    onChanged: controller.onSearchChanged,
                  ),
                ),

                // Tabs
                CustomHelpTabBar(
                  selectedIndex: controller.selectedTabIndex,
                  onTabSelected: controller.setTab,
                ),

                // Body based on active tab
                Expanded(
                  child: controller.selectedTabIndex == 0
                      ? _buildFaqTab(controller)
                      : _buildContactTab(controller),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildFaqTab(HelpCenterController controller) {
    final faqs = controller.filteredFaqs;
    return ListView(
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 16.h),
      children: [
        CustomFaqCategoriesRow(
          categories: controller.categories,
          selectedCategory: controller.selectedCategory,
          onSelected: controller.setCategory,
        ),
        SizedBox(height: 18.h),
        if (faqs.isEmpty)
          Padding(
            padding: EdgeInsets.symmetric(vertical: 40.h),
            child: const Center(
              child: Text(
                'No questions found',
                style: TextStyle(color: Colors.grey),
              ),
            ),
          )
        else
          ListView.separated(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: faqs.length,
            separatorBuilder: (context, index) => SizedBox(height: 12.h),
            itemBuilder: (context, index) {
              final faq = faqs[index];
              return CustomFaqAccordionItem(
                faq: faq,
                onTap: () => controller.toggleFaq(faq.id),
              );
            },
          ),
      ],
    );
  }

  Widget _buildContactTab(HelpCenterController controller) {
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
