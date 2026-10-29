import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../controller/category_products_controller.dart';
import 'widget/custom_category_product_card.dart';
import 'widget/custom_category_products_top_bar.dart';

class CategoryProductsScreen extends StatelessWidget {
  const CategoryProductsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CategoryProductsController>(
      init: CategoryProductsController(),
      builder: (controller) {
        return Scaffold(
          backgroundColor: Colors.white,
          body: SafeArea(
            child: Column(
              children: [
                CustomCategoryProductsTopBar(title: controller.categoryName),
                Expanded(
                  child: controller.isLoading
                      ? const Center(child: CircularProgressIndicator())
                      : GridView.builder(
                          padding: EdgeInsets.symmetric(
                            horizontal: 20.w,
                            vertical: 12.h,
                          ),
                          itemCount: controller.products.length,
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            crossAxisSpacing: 16.w,
                            mainAxisSpacing: 20.h,
                            childAspectRatio: 0.72,
                          ),
                          itemBuilder: (context, index) {
                            final product = controller.products[index];
                            return CustomCategoryProductCard(
                              product: product,
                              onToggleFavorite: () =>
                                  controller.toggleFavorite(index),
                              onTap: () =>
                                  controller.openProductDetails(product),
                            );
                          },
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
