import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../controller/review_controller.dart';
import 'widget/custom_review_product_card.dart';
import 'widget/custom_star_selector.dart';

class LeaveReviewScreen extends StatelessWidget {
  const LeaveReviewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ReviewController>(
      init: ReviewController(),
      builder: (controller) {
        return Scaffold(
          backgroundColor: Colors.white,
          body: SafeArea(
            child: Column(
              children: [
                // Top Header Bar
                Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: 20.w, vertical: 12.h),
                  child: Row(
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
                              size: 20.r, color: const Color(0xFF111827)),
                        ),
                      ),
                      Expanded(
                        child: Center(
                          child: Text(
                            'Leave Review',
                            style: TextStyle(
                              fontSize: 18.sp,
                              fontWeight: FontWeight.bold,
                              color: const Color(0xFF111827),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(width: 44.r),
                    ],
                  ),
                ),

                // Scrollable Body
                Expanded(
                  child: SingleChildScrollView(
                    padding:
                        EdgeInsets.symmetric(horizontal: 20.w, vertical: 8.h),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        // 1. Product Summary Card
                        const CustomReviewProductCard(),
                        SizedBox(height: 28.h),

                        // 2. Rating Prompt
                        Text(
                          'How is your order?',
                          style: TextStyle(
                            fontSize: 22.sp,
                            fontWeight: FontWeight.bold,
                            color: const Color(0xFF111827),
                          ),
                        ),
                        SizedBox(height: 6.h),
                        Text(
                          'Your overall rating',
                          style: TextStyle(
                              fontSize: 13.sp, color: const Color(0xFF6B7280)),
                        ),
                        SizedBox(height: 16.h),

                        // Star Selector
                        CustomStarSelector(
                          rating: controller.rating,
                          onRatingChanged: controller.setRating,
                        ),
                        SizedBox(height: 28.h),

                        const Divider(color: Color(0xFFF3F4F6)),
                        SizedBox(height: 16.h),

                        // 3. Detailed Review Field
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            'Add detailed review',
                            style: TextStyle(
                              fontSize: 14.sp,
                              fontWeight: FontWeight.bold,
                              color: const Color(0xFF111827),
                            ),
                          ),
                        ),
                        SizedBox(height: 8.h),
                        Container(
                          height: 120.h,
                          padding: EdgeInsets.all(14.r),
                          decoration: BoxDecoration(
                            color: const Color(0xFFF7F8F9),
                            borderRadius: BorderRadius.circular(14.r),
                          ),
                          child: TextField(
                            controller: controller.reviewTextController,
                            maxLines: 5,
                            style: TextStyle(
                                fontSize: 14.sp,
                                color: const Color(0xFF111827)),
                            decoration: const InputDecoration(
                              hintText: 'Enter here',
                              hintStyle: TextStyle(color: Color(0xFF9CA3AF)),
                              border: InputBorder.none,
                              isDense: true,
                              contentPadding: EdgeInsets.zero,
                            ),
                          ),
                        ),
                        SizedBox(height: 12.h),

                        // Add photo button
                        Align(
                          alignment: Alignment.centerLeft,
                          child: GestureDetector(
                            onTap: () {},
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Icon(Icons.camera_alt_outlined,
                                    size: 18.r, color: const Color(0xFF2E9B8B)),
                                SizedBox(width: 6.w),
                                Text(
                                  'add photo',
                                  style: TextStyle(
                                    fontSize: 13.sp,
                                    fontWeight: FontWeight.w500,
                                    color: const Color(0xFF2E9B8B),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

                // Sticky Bottom Action Bar
                Container(
                  padding:
                      EdgeInsets.symmetric(horizontal: 20.w, vertical: 14.h),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withValues(alpha: 0.05),
                        blurRadius: 10,
                        offset: const Offset(0, -4),
                      ),
                    ],
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        child: SizedBox(
                          height: 50.h,
                          child: ElevatedButton(
                            onPressed: () => Get.back(),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: const Color(0xFFF3F4F6),
                              foregroundColor: const Color(0xFF111827),
                              elevation: 0,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(25.r),
                              ),
                            ),
                            child: Text(
                              'Cancel',
                              style: TextStyle(
                                  fontSize: 15.sp, fontWeight: FontWeight.w600),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(width: 14.w),
                      Expanded(
                        child: SizedBox(
                          height: 50.h,
                          child: ElevatedButton(
                            onPressed: controller.isSubmitting
                                ? null
                                : controller.submitReview,
                            style: ElevatedButton.styleFrom(
                              backgroundColor: const Color(0xFF2E9B8B),
                              foregroundColor: Colors.white,
                              elevation: 0,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(25.r),
                              ),
                            ),
                            child: controller.isSubmitting
                                ? SizedBox(
                                    width: 22.r,
                                    height: 22.r,
                                    child: const CircularProgressIndicator(
                                        color: Colors.white, strokeWidth: 2),
                                  )
                                : Text(
                                    'Submit',
                                    style: TextStyle(
                                        fontSize: 15.sp,
                                        fontWeight: FontWeight.w600),
                                  ),
                          ),
                        ),
                      ),
                    ],
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
