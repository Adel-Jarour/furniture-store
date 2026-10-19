import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../const/color_const.dart';
import '../../../controller/track_order_controller.dart';
import 'widget/custom_track_order_product_card.dart';
import 'widget/custom_track_order_timeline.dart';

class TrackOrderScreen extends StatelessWidget {
  const TrackOrderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<TrackOrderController>(
      init: TrackOrderController(),
      builder: (controller) {
        final order = controller.order;

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
                        'Track Order',
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

                // ── Content ──────────────────────────────────────────
                Expanded(
                  child: SingleChildScrollView(
                    padding:
                        EdgeInsets.symmetric(horizontal: 20.w, vertical: 8.h),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Product Summary Card
                        CustomTrackOrderProductCard(order: order),
                        SizedBox(height: 18.h),
                        const Divider(color: Color(0xFFF3F4F6), height: 1),
                        SizedBox(height: 16.h),

                        // Order Details Section
                        Text(
                          'Order Details',
                          style: TextStyle(
                            fontSize: 17.sp,
                            fontWeight: FontWeight.bold,
                            color: ColorConst.textBlackColor,
                          ),
                        ),
                        SizedBox(height: 14.h),

                        _buildRow('Expected Delivery Date',
                            order.expectedDeliveryDate),
                        SizedBox(height: 10.h),
                        _buildRow('Tracking ID', order.trackingId),
                        SizedBox(height: 18.h),
                        const Divider(color: Color(0xFFF3F4F6), height: 1),
                        SizedBox(height: 16.h),

                        // Order Status Timeline
                        Text(
                          'Order Status',
                          style: TextStyle(
                            fontSize: 17.sp,
                            fontWeight: FontWeight.bold,
                            color: ColorConst.textBlackColor,
                          ),
                        ),
                        SizedBox(height: 16.h),

                        CustomTrackOrderTimeline(steps: order.steps),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildRow(String label, String value) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: TextStyle(
            fontSize: 14.sp,
            color: ColorConst.textGreyColor,
          ),
        ),
        Text(
          value,
          style: TextStyle(
            fontSize: 15.sp,
            fontWeight: FontWeight.bold,
            color: ColorConst.textBlackColor,
          ),
        ),
      ],
    );
  }
}
