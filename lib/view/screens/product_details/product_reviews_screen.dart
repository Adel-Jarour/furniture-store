import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../controller/product_reviews_controller.dart';
import 'widget/custom_rating_summary_card.dart';
import 'widget/custom_review_tile.dart';
import 'widget/custom_reviews_search_filter_bar.dart';
import 'widget/custom_reviews_top_bar.dart';
import 'widget/custom_write_review_bottom_bar.dart';

class ProductReviewsScreen extends StatelessWidget {
  const ProductReviewsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProductReviewsController>(
      init: ProductReviewsController(),
      builder: (controller) {
        return Scaffold(
          backgroundColor: Colors.white,
          body: SafeArea(
            child: Column(
              children: [
                const CustomReviewsTopBar(),
                Expanded(
                  child: controller.isLoading || controller.stats == null
                      ? const Center(child: CircularProgressIndicator())
                      : ListView(
                          children: [
                            CustomRatingSummaryCard(stats: controller.stats!),
                            CustomReviewsSearchFilterBar(
                              searchController: controller.searchController,
                              onSearchChanged: controller.onSearchChanged,
                              activeFilters: controller.activeFilters,
                              onToggleFilter: controller.toggleFilter,
                            ),
                            ...controller.displayedReviews.map(
                              (rev) => CustomReviewTile(review: rev),
                            ),
                          ],
                        ),
                ),
                CustomWriteReviewBottomBar(
                  onWriteReview: controller.onWriteReview,
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
