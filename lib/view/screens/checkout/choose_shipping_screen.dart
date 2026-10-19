import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../const/color_const.dart';
import '../../../controller/shipping_controller.dart';
import 'widget/custom_checkout_bottom_bar.dart';
import 'widget/custom_shipping_option_tile.dart';

class ChooseShippingScreen extends StatelessWidget {
  const ChooseShippingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ShippingController>(
      init: ShippingController(),
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
                      ),
                      Text(
                        'Choose Shipping',
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
                SizedBox(height: 10.h),

                // ── Shipping Options List ────────────────────────────
                Expanded(
                  child: controller.isLoading
                      ? const Center(child: CircularProgressIndicator())
                      : ListView.separated(
                          padding: EdgeInsets.symmetric(horizontal: 20.w),
                          itemCount: controller.options.length,
                          separatorBuilder: (context, index) => Divider(
                              height: 32.h, color: const Color(0xFFF3F4F6)),
                          itemBuilder: (context, index) {
                            final option = controller.options[index];
                            return CustomShippingOptionTile(
                              option: option,
                              isSelected: controller.selectedIndex == index,
                              onTap: () => controller.selectOption(index),
                            );
                          },
                        ),
                ),

                // ── Apply Button ─────────────────────────────────────
                CustomCheckoutBottomBar(
                  buttonText: 'Apply',
                  onPressed: controller.applySelection,
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
