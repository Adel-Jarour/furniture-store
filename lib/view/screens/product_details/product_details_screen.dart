import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../controller/product_details_controller.dart';
import '../../../routes/app_routes.dart';
import 'widget/custom_product_details_top_bar.dart';
import 'widget/custom_product_image_carousel.dart';
import 'widget/custom_product_info_section.dart';
import 'widget/custom_product_add_to_cart_bar.dart';

class ProductDetailsScreen extends StatelessWidget {
  const ProductDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProductDetailsController>(
      init: ProductDetailsController(),
      builder: (controller) {
        return Scaffold(
          backgroundColor: Colors.white,
          body: SafeArea(
            child: Column(
              children: [
                // Top Bar
                CustomProductDetailsTopBar(controller: controller),

                // Scrollable Body
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Hero Image & Carousel
                        CustomProductImageCarousel(controller: controller),

                        const SizedBox(height: 20),

                        // Info & Titles Section
                        GestureDetector(
                          onTap: () => Get.toNamed(AppRoutes.productReviews),
                          child:
                              CustomProductInfoSection(controller: controller),
                        ),
                      ],
                    ),
                  ),
                ),

                // Sticky Bottom Action Bar
                CustomProductAddToCartBar(controller: controller),
              ],
            ),
          ),
        );
      },
    );
  }
}
