import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../controller/help_center_controller.dart';
import 'custom_faq_accordion_item.dart';
import 'custom_faq_categories_row.dart';

class CustomHelpFaqTab extends StatelessWidget {
  final HelpCenterController controller;

  const CustomHelpFaqTab({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
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
        if (controller.isLoading)
          const Center(child: CircularProgressIndicator())
        else if (faqs.isEmpty)
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
}
