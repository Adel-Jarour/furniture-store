import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../const/color_const.dart';
import '../../../controller/cart_controller.dart';
import 'widget/custom_cart_item_card.dart';
import 'widget/custom_cart_summary_sheet.dart';

class CartScreen extends StatelessWidget {
  final bool showBackButton;

  const CartScreen({
    super.key,
    this.showBackButton = true,
  });

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CartController>(
      init: CartController(),
      builder: (controller) {
        return Scaffold(
          backgroundColor: Colors.white,
          body: SafeArea(
            child: Column(
              children: [
                // ── Top Bar ──────────────────────────────────────────
                Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      if (showBackButton)
                        GestureDetector(
                          onTap: () => Get.back(),
                          child: Container(
                            width: 44.r,
                            height: 44.r,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.white,
                              border: Border.all(
                                color: const Color(0xFFE5E7EB),
                                width: 1.w,
                              ),
                            ),
                            alignment: Alignment.center,
                            child: Icon(
                              Icons.arrow_back,
                              size: 20.r,
                              color: ColorConst.textBlackColor,
                            ),
                          ),
                        )
                      else
                        SizedBox(width: 44.r),
                      Text(
                        'My Cart',
                        style: TextStyle(
                          fontSize: 18.sp,
                          fontWeight: FontWeight.bold,
                          color: ColorConst.textBlackColor,
                        ),
                      ),
                      SizedBox(width: 44.r),
                    ],
                  ),
                ),

                // ── Cart Items List ──────────────────────────────────
                Expanded(
                  child: controller.isLoading
                      ? const Center(child: CircularProgressIndicator())
                      : controller.items.isEmpty
                          ? Center(
                              child: Text(
                                'Your cart is empty',
                                style: TextStyle(
                                  fontSize: 16.sp,
                                  color: ColorConst.textGreyColor,
                                ),
                              ),
                            )
                          : ListView.builder(
                              padding: EdgeInsets.symmetric(
                                horizontal: 20.w,
                                vertical: 10.h,
                              ),
                              itemCount: controller.items.length,
                              itemBuilder: (context, index) {
                                return CustomCartItemCard(
                                  item: controller.items[index],
                                  controller: controller,
                                );
                              },
                            ),
                ),

                // ── Sticky Checkout Summary Card ─────────────────────
                CustomCartSummarySheet(controller: controller),
              ],
            ),
          ),
        );
      },
    );
  }
}
