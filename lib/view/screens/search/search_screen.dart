import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../controller/product_search_controller.dart';
import 'widget/custom_recent_searches_section.dart';
import 'widget/custom_recent_views_section.dart';
import 'widget/custom_search_results_grid.dart';
import 'widget/custom_search_top_bar.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProductSearchController>(
      init: ProductSearchController(),
      builder: (controller) {
        return Scaffold(
          backgroundColor: Colors.white,
          body: SafeArea(
            child: Column(
              children: [
                CustomSearchTopBar(controller: controller),
                Expanded(
                  child: SingleChildScrollView(
                    padding:
                        EdgeInsets.symmetric(horizontal: 20.w, vertical: 8.h),
                    child: controller.isShowingResults
                        ? CustomSearchResultsGrid(controller: controller)
                        : Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              CustomRecentSearchesSection(
                                  controller: controller),
                              SizedBox(height: 24.h),
                              CustomRecentViewsSection(controller: controller),
                              SizedBox(height: 16.h),
                            ],
                          ),
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
