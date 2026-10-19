import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../const/color_const.dart';
import '../../../controller/wishlist_controller.dart';
import '../../../routes/app_routes.dart';
import '../home/widget/custom_product_card.dart';
import 'widget/custom_wishlist_filter_pills.dart';

class WishlistScreen extends StatelessWidget {
  final bool showBackButton;

  const WishlistScreen({super.key, this.showBackButton = false});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<WishlistController>(
      init: WishlistController(),
      builder: (controller) {
        return Scaffold(
          backgroundColor: Colors.white,
          body: SafeArea(
            bottom: false,
            child: SingleChildScrollView(
              padding: EdgeInsets.symmetric(horizontal: 20.w).copyWith(
                top: 10.h,
                bottom: 110.h,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Top Bar
                  if (showBackButton)
                    Row(
                      children: [
                        GestureDetector(
                          onTap: () => Get.back(),
                          child: Container(
                            width: 44.r,
                            height: 44.r,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.white,
                              border: Border.all(
                                  color: const Color(0xFFE5E7EB), width: 1.w),
                            ),
                            alignment: Alignment.center,
                            child: Icon(Icons.arrow_back,
                                size: 20.r, color: ColorConst.textBlackColor),
                          ),
                        ),
                        Expanded(
                          child: Center(
                            child: Text(
                              'My Wishlist',
                              style: TextStyle(
                                fontSize: 18.sp,
                                fontWeight: FontWeight.bold,
                                color: ColorConst.textBlackColor,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(width: 44.r),
                      ],
                    )
                  else
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 8.h),
                      child: Center(
                        child: Text(
                          'My Wishlist',
                          style: TextStyle(
                            fontSize: 18.sp,
                            fontWeight: FontWeight.bold,
                            color: ColorConst.textBlackColor,
                          ),
                        ),
                      ),
                    ),
                  SizedBox(height: 16.h),

                  // Filter Pills
                  CustomWishlistFilterPills(
                    categories: controller.categories,
                    selectedCategory: controller.selectedCategory,
                    onSelected: controller.selectCategory,
                  ),
                  SizedBox(height: 20.h),

                  // 2-Column Product Grid
                  GridView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: controller.wishlistItems.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 14.w,
                      mainAxisSpacing: 16.h,
                      childAspectRatio: 0.90,
                    ),
                    itemBuilder: (context, index) {
                      final product = controller.wishlistItems[index];
                      return CustomProductCard(
                        product: product,
                        onFavoriteTap: () =>
                            controller.toggleFavorite(product.id),
                        onTap: () => Get.toNamed(AppRoutes.productDetails,
                            arguments: product),
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
