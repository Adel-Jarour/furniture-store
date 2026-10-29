import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../routes/app_routes.dart';
import 'package:get/get.dart';
import '../../../controller/home_controller.dart';
import 'widget/custom_home_categories.dart';
import 'widget/custom_home_flash_sale.dart';
import 'widget/custom_home_header.dart';
import 'widget/custom_home_hero_banner.dart';
import 'widget/custom_home_search_bar.dart';
import 'widget/custom_product_card.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      init: HomeController(),
      builder: (controller) {
        return Scaffold(
          backgroundColor: Colors.white,
          body: SafeArea(
            bottom: false,
            child: SingleChildScrollView(
              padding: EdgeInsets.symmetric(horizontal: 20.w).copyWith(
                top: 10.h,
                bottom: 110.h, // Space for floating bottom nav pill
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // ── Top Location & Notification Header ─────────────
                  CustomHomeHeader(
                    location: controller.currentLocation,
                  ),
                  SizedBox(height: 16.h),

                  // ── Search & Filter Bar ────────────────────────────
                  CustomHomeSearchBar(
                    onSearchTap: () => Get.toNamed(AppRoutes.search),
                    onFilterTap: () => Get.toNamed(AppRoutes.filter),
                  ),
                  SizedBox(height: 18.h),

                  // ── Hero Banner with 5-dot Indicator ───────────────
                  CustomHomeHeroBanner(
                    banners: controller.banners,
                    activeIndex: controller.currentBannerIndex,
                    onShopNowTap: () => Get.toNamed(AppRoutes.productDetails),
                  ),
                  SizedBox(height: 20.h),

                  // ── Category Icons Row ─────────────────────────────
                  CustomHomeCategories(
                    categories: controller.categories,
                    onCategoryTap: (index) {
                      final category = controller.categories[index];
                      Get.toNamed(
                        AppRoutes.categoryProducts,
                        arguments: {
                          'categoryName': category.title,
                          'categoryId': category.id,
                        },
                      );
                    },
                    onSeeAllTap: () => Get.toNamed(AppRoutes.category),
                  ),
                  SizedBox(height: 22.h),

                  // ── Flash Sale Row with Live Countdown ─────────────
                  CustomHomeFlashSale(
                    hours: controller.hoursString,
                    minutes: controller.minutesString,
                    seconds: controller.secondsString,
                    filters: controller.flashSaleFilters,
                    selectedFilter: controller.selectedFilter,
                    onFilterSelected: controller.selectFilter,
                  ),
                  SizedBox(height: 16.h),

                  // ── Popular Products Grid (2 columns) ──────────────
                  GridView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: controller.products.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 14.w,
                      mainAxisSpacing: 16.h,
                      childAspectRatio: 0.90,
                    ),
                    itemBuilder: (context, index) {
                      final product = controller.products[index];
                      return CustomProductCard(
                        product: product,
                        onFavoriteTap: () =>
                            controller.toggleFavorite(product.id),
                        onTap: () => Get.toNamed(
                          AppRoutes.productDetails,
                          arguments: product,
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
