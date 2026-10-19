import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../const/color_const.dart';
import '../../../controller/filter_controller.dart';
import 'widget/custom_filter_chip_row.dart';
import 'widget/custom_filter_review_row.dart';

class FilterScreen extends StatelessWidget {
  const FilterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<FilterController>(
      init: FilterController(),
      builder: (controller) {
        return Scaffold(
          backgroundColor: Colors.white,
          body: SafeArea(
            child: Column(
              children: [
                // Top Header
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
                              size: 20.r, color: ColorConst.textBlackColor),
                        ),
                      ),
                      Expanded(
                        child: Center(
                          child: Text(
                            'Filter',
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
                  ),
                ),

                // Filter Options Body
                Expanded(
                  child: SingleChildScrollView(
                    padding:
                        EdgeInsets.symmetric(horizontal: 20.w, vertical: 8.h),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // 1. Category
                        Text('Category',
                            style: TextStyle(
                                fontSize: 16.sp,
                                fontWeight: FontWeight.bold,
                                color: ColorConst.textBlackColor)),
                        SizedBox(height: 12.h),
                        CustomFilterChipRow(
                          options: controller.categories,
                          selectedValue: controller.selectedCategory,
                          onSelected: controller.setCategory,
                        ),
                        SizedBox(height: 24.h),

                        // 2. Price Range
                        Text('Price Range',
                            style: TextStyle(
                                fontSize: 16.sp,
                                fontWeight: FontWeight.bold,
                                color: ColorConst.textBlackColor)),
                        SizedBox(height: 8.h),
                        RangeSlider(
                          values: controller.priceRange,
                          min: controller.minPrice,
                          max: controller.maxPrice,
                          divisions: 7,
                          activeColor: ColorConst.primaryColor,
                          inactiveColor: const Color(0xFFE5E7EB),
                          onChanged: controller.setPriceRange,
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 8.w),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: const [
                              Text('\$50',
                                  style: TextStyle(
                                      fontSize: 11,
                                      color: ColorConst.textBlackColor)),
                              Text('\$100',
                                  style: TextStyle(
                                      fontSize: 11,
                                      color: ColorConst.textBlackColor)),
                              Text('\$150',
                                  style: TextStyle(
                                      fontSize: 11,
                                      color: ColorConst.textBlackColor)),
                              Text('\$200',
                                  style: TextStyle(
                                      fontSize: 11,
                                      color: ColorConst.textBlackColor)),
                              Text('\$300',
                                  style: TextStyle(
                                      fontSize: 11,
                                      color: ColorConst.textBlackColor)),
                              Text('\$350',
                                  style: TextStyle(
                                      fontSize: 11,
                                      color: ColorConst.textBlackColor)),
                              Text('\$400',
                                  style: TextStyle(
                                      fontSize: 11,
                                      color: ColorConst.textBlackColor)),
                            ],
                          ),
                        ),
                        SizedBox(height: 24.h),

                        // 3. Reviews
                        Text('Reviews',
                            style: TextStyle(
                                fontSize: 16.sp,
                                fontWeight: FontWeight.bold,
                                color: ColorConst.textBlackColor)),
                        SizedBox(height: 12.h),
                        Column(
                          children: controller.reviewOptions.map((reviewText) {
                            return CustomFilterReviewRow(
                              reviewText: reviewText,
                              isSelected:
                                  controller.selectedReview == reviewText,
                              onTap: () => controller.setReview(reviewText),
                            );
                          }).toList(),
                        ),
                        SizedBox(height: 24.h),

                        // 4. Sort by
                        Text('Sort by',
                            style: TextStyle(
                                fontSize: 16.sp,
                                fontWeight: FontWeight.bold,
                                color: ColorConst.textBlackColor)),
                        SizedBox(height: 12.h),
                        CustomFilterChipRow(
                          options: controller.sortOptions,
                          selectedValue: controller.selectedSortBy,
                          onSelected: controller.setSortBy,
                        ),
                        SizedBox(height: 24.h),

                        // 5. For (Room)
                        Text('For',
                            style: TextStyle(
                                fontSize: 16.sp,
                                fontWeight: FontWeight.bold,
                                color: ColorConst.textBlackColor)),
                        SizedBox(height: 12.h),
                        CustomFilterChipRow(
                          options: controller.roomOptions,
                          selectedValue: controller.selectedRoom,
                          onSelected: controller.setRoom,
                        ),
                        SizedBox(height: 20.h),
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
                            onPressed: controller.resetFilters,
                            style: ElevatedButton.styleFrom(
                              backgroundColor: const Color(0xFFF3F4F6),
                              foregroundColor: ColorConst.textBlackColor,
                              elevation: 0,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(25.r)),
                            ),
                            child: Text('Reset Filter',
                                style: TextStyle(
                                    fontSize: 15.sp,
                                    fontWeight: FontWeight.w600)),
                          ),
                        ),
                      ),
                      SizedBox(width: 14.w),
                      Expanded(
                        child: SizedBox(
                          height: 50.h,
                          child: ElevatedButton(
                            onPressed: controller.applyFilters,
                            style: ElevatedButton.styleFrom(
                              backgroundColor: ColorConst.primaryColor,
                              foregroundColor: Colors.white,
                              elevation: 0,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(25.r)),
                            ),
                            child: Text('Apply',
                                style: TextStyle(
                                    fontSize: 15.sp,
                                    fontWeight: FontWeight.w600)),
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
