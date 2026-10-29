import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../controller/review_summary_controller.dart';
import 'widget/custom_review_summary_bottom_bar.dart';
import 'widget/custom_review_summary_items_list.dart';
import 'widget/custom_review_summary_order_details.dart';
import 'widget/custom_review_summary_payment_method.dart';
import 'widget/custom_review_summary_top_bar.dart';

class ReviewSummaryScreen extends StatelessWidget {
  const ReviewSummaryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ReviewSummaryController>(
      init: ReviewSummaryController(),
      builder: (controller) {
        return Scaffold(
          backgroundColor: Colors.white,
          body: SafeArea(
            child: Column(
              children: [
                const CustomReviewSummaryTopBar(),
                Expanded(
                  child: controller.isLoading || controller.summary == null
                      ? const Center(child: CircularProgressIndicator())
                      : SingleChildScrollView(
                          padding: EdgeInsets.symmetric(
                            horizontal: 20.w,
                            vertical: 8.h,
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              CustomReviewSummaryItemsList(
                                items: controller.summary!.items,
                              ),
                              SizedBox(height: 16.h),
                              CustomReviewSummaryOrderDetails(
                                summary: controller.summary!,
                              ),
                              CustomReviewSummaryPaymentMethod(
                                paymentMethod: controller.paymentMethod,
                                onChange: controller.onChangePaymentMethod,
                              ),
                            ],
                          ),
                        ),
                ),
                CustomReviewSummaryBottomBar(
                  onContinue: controller.onContinue,
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
