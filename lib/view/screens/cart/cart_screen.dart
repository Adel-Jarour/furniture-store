import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../const/color_const.dart';
import '../../../controller/cart_controller.dart';
import 'widget/custom_cart_item_card.dart';
import 'widget/custom_cart_summary_sheet.dart';
import 'widget/custom_cart_top_bar.dart';

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
            bottom: showBackButton,
            child: Column(
              children: [
                CustomCartTopBar(showBackButton: showBackButton),
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
                CustomCartSummarySheet(
                  controller: controller,
                  bottomPadding: showBackButton ? 0 : 92.h,
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
