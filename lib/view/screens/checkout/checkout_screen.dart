import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../const/color_const.dart';
import '../../../controller/checkout_controller.dart';
import 'widget/custom_checkout_address_card.dart';
import 'widget/custom_checkout_bottom_bar.dart';
import 'widget/custom_checkout_order_item.dart';
import 'widget/custom_checkout_shipping_card.dart';

class CheckoutScreen extends StatelessWidget {
  const CheckoutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CheckoutController>(
      init: CheckoutController(),
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
                        'Checkout',
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

                // ── Scrollable Body ──────────────────────────────────
                Expanded(
                  child: SingleChildScrollView(
                    padding:
                        EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Shipping Address
                        CustomCheckoutAddressCard(
                          addressType: controller.addressType,
                          addressDetails: controller.addressDetails,
                          onChangeTap: controller.changeAddress,
                        ),
                        SizedBox(height: 16.h),
                        const Divider(color: Color(0xFFF3F4F6), height: 1),
                        SizedBox(height: 16.h),

                        // Shipping Type
                        CustomCheckoutShippingCard(
                          shipping: controller.selectedShipping,
                          onChangeTap: controller.changeShippingType,
                        ),
                        SizedBox(height: 16.h),
                        const Divider(color: Color(0xFFF3F4F6), height: 1),
                        SizedBox(height: 16.h),

                        // Order List
                        Text(
                          'Order List',
                          style: TextStyle(
                            fontSize: 17.sp,
                            fontWeight: FontWeight.bold,
                            color: ColorConst.textBlackColor,
                          ),
                        ),
                        SizedBox(height: 14.h),
                        ListView.separated(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: controller.orderItems.length,
                          separatorBuilder: (context, index) => Divider(
                              height: 24.h, color: const Color(0xFFF3F4F6)),
                          itemBuilder: (context, index) {
                            return CustomCheckoutOrderItem(
                              item: controller.orderItems[index],
                            );
                          },
                        ),
                        SizedBox(height: 20.h),
                      ],
                    ),
                  ),
                ),

                // ── Bottom Action Bar ────────────────────────────────
                CustomCheckoutBottomBar(
                  buttonText: 'Continue to Payment',
                  onPressed: controller.continueToPayment,
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
