import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../const/color_const.dart';
import '../../../controller/orders_controller.dart';
import 'widget/custom_order_card.dart';
import 'widget/custom_orders_tab_bar.dart';

class OrdersScreen extends StatelessWidget {
  const OrdersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<OrdersController>(
      init: OrdersController(),
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
                        'My Orders',
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

                // ── Tab Bar ──────────────────────────────────────────
                CustomOrdersTabBar(controller: controller),

                // ── Orders List ──────────────────────────────────────
                Expanded(
                  child: controller.isLoading
                      ? const Center(child: CircularProgressIndicator())
                      : controller.currentOrders.isEmpty
                          ? Center(
                              child: Text(
                                'No orders found',
                                style: TextStyle(
                                  fontSize: 15.sp,
                                  color: ColorConst.textGreyColor,
                                ),
                              ),
                            )
                          : ListView.separated(
                              padding: EdgeInsets.symmetric(
                                horizontal: 20.w,
                                vertical: 16.h,
                              ),
                              itemCount: controller.currentOrders.length,
                              separatorBuilder: (context, index) => Divider(
                                  height: 28.h, color: const Color(0xFFF3F4F6)),
                              itemBuilder: (context, index) {
                                return CustomOrderCard(
                                  order: controller.currentOrders[index],
                                  controller: controller,
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
