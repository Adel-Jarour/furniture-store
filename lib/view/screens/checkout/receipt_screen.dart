import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../const/color_const.dart';
import '../../../controller/receipt_controller.dart';
import 'widget/custom_checkout_bottom_bar.dart';
import 'widget/custom_receipt_barcode.dart';
import 'widget/custom_receipt_info_row.dart';
import 'widget/custom_receipt_item_tile.dart';

class ReceiptScreen extends StatelessWidget {
  const ReceiptScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ReceiptController>(
      init: ReceiptController(),
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
                        'E-Receipt',
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

                // ── Scrollable Receipt Content ───────────────────────
                Expanded(
                  child: SingleChildScrollView(
                    padding:
                        EdgeInsets.symmetric(horizontal: 20.w, vertical: 8.h),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Barcode
                        const CustomReceiptBarcode(),
                        SizedBox(height: 20.h),

                        // Products List
                        ListView.separated(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: controller.items.length,
                          separatorBuilder: (context, index) => Divider(
                              height: 24.h, color: const Color(0xFFF3F4F6)),
                          itemBuilder: (context, index) {
                            return CustomReceiptItemTile(
                              item: controller.items[index],
                            );
                          },
                        ),
                        SizedBox(height: 20.h),
                        const Divider(color: Color(0xFFF3F4F6), height: 1),
                        SizedBox(height: 16.h),

                        // Order Meta Info
                        CustomReceiptInfoRow(
                          label: 'Order Date',
                          value: controller.orderDate,
                        ),
                        SizedBox(height: 10.h),
                        CustomReceiptInfoRow(
                          label: 'Promo code',
                          value: controller.promoCode,
                        ),
                        SizedBox(height: 10.h),
                        CustomReceiptInfoRow(
                          label: 'Delivery Type',
                          value: controller.deliveryType,
                        ),
                        SizedBox(height: 16.h),
                        const Divider(color: Color(0xFFF3F4F6), height: 1),
                        SizedBox(height: 16.h),

                        // Amounts Breakdown
                        CustomReceiptInfoRow(
                          label: 'Amount',
                          value: '\$${controller.amount.toStringAsFixed(2)}',
                        ),
                        SizedBox(height: 10.h),
                        CustomReceiptInfoRow(
                          label: 'Delivery Charge',
                          value:
                              '\$${controller.deliveryCharge.toStringAsFixed(2)}',
                        ),
                        SizedBox(height: 10.h),
                        CustomReceiptInfoRow(
                          label: 'Tax',
                          value: '\$${controller.tax.toStringAsFixed(2)}',
                        ),
                        SizedBox(height: 10.h),
                        CustomReceiptInfoRow(
                          label: 'Discount',
                          value: '-\$${controller.discount.toStringAsFixed(2)}',
                        ),
                        SizedBox(height: 14.h),

                        // Dashed divider
                        _buildDashedDivider(),
                        SizedBox(height: 14.h),

                        // Total
                        CustomReceiptInfoRow(
                          label: 'Total',
                          value: '\$${controller.total.toStringAsFixed(0)}',
                          isBold: true,
                        ),
                        SizedBox(height: 16.h),
                        const Divider(color: Color(0xFFF3F4F6), height: 1),
                        SizedBox(height: 16.h),

                        // Payment Details
                        CustomReceiptInfoRow(
                          label: 'Payment Methods',
                          value: controller.paymentMethod,
                        ),
                        SizedBox(height: 10.h),
                        CustomReceiptInfoRow(
                          label: 'Date',
                          value: controller.date,
                        ),
                        SizedBox(height: 10.h),
                        CustomReceiptInfoRow(
                          label: 'Transaction ID',
                          value: controller.transactionId,
                          trailing: GestureDetector(
                            onTap: controller.copyTransactionId,
                            child: Row(
                              children: [
                                Text(
                                  controller.transactionId,
                                  style: TextStyle(
                                    fontSize: 14.sp,
                                    fontWeight: FontWeight.bold,
                                    color: ColorConst.textBlackColor,
                                  ),
                                ),
                                SizedBox(width: 6.w),
                                Icon(
                                  Icons.copy_rounded,
                                  size: 16.r,
                                  color: ColorConst.primaryColor,
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(height: 24.h),
                      ],
                    ),
                  ),
                ),

                // ── Sticky Bottom Button ─────────────────────────────
                CustomCheckoutBottomBar(
                  buttonText: 'Download E-Receipt',
                  onPressed: controller.downloadReceipt,
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildDashedDivider() {
    return LayoutBuilder(
      builder: (context, constraints) {
        const dashWidth = 6.0;
        const dashSpace = 4.0;
        final dashCount =
            (constraints.maxWidth / (dashWidth + dashSpace)).floor();
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: List.generate(dashCount, (_) {
            return SizedBox(
              width: dashWidth,
              height: 1,
              child: const DecoratedBox(
                decoration: BoxDecoration(color: Color(0xFFE5E7EB)),
              ),
            );
          }),
        );
      },
    );
  }
}
