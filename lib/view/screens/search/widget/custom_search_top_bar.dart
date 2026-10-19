import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../../const/color_const.dart';
import '../../../../controller/product_search_controller.dart';

class CustomSearchTopBar extends StatelessWidget {
  final ProductSearchController controller;

  const CustomSearchTopBar({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
      child: Row(
        children: [
          // Circular Back Button
          GestureDetector(
            onTap: () => Get.back(),
            child: Container(
              width: 44.r,
              height: 44.r,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white,
                border: Border.all(color: const Color(0xFFE5E7EB), width: 1.w),
              ),
              alignment: Alignment.center,
              child: Icon(
                Icons.arrow_back,
                size: 20.r,
                color: ColorConst.textBlackColor,
              ),
            ),
          ),
          SizedBox(width: 12.w),

          // Search Input Field
          Expanded(
            child: Container(
              height: 48.h,
              padding: EdgeInsets.symmetric(horizontal: 14.w),
              decoration: BoxDecoration(
                color: const Color(0xFFF7F8F9),
                borderRadius: BorderRadius.circular(16.r),
              ),
              child: Row(
                children: [
                  Icon(
                    Icons.search_rounded,
                    size: 22.r,
                    color: ColorConst.textGreyColor,
                  ),
                  SizedBox(width: 10.w),
                  Expanded(
                    child: TextField(
                      controller: controller.searchController,
                      onChanged: controller.onSearchChanged,
                      onSubmitted: controller.executeSearch,
                      textInputAction: TextInputAction.search,
                      style: TextStyle(
                        fontSize: 14.sp,
                        color: ColorConst.textBlackColor,
                      ),
                      decoration: InputDecoration(
                        hintText: 'Search..',
                        hintStyle: TextStyle(
                          fontSize: 14.sp,
                          color: ColorConst.textGreyColor,
                        ),
                        border: InputBorder.none,
                        isDense: true,
                        contentPadding: EdgeInsets.zero,
                      ),
                    ),
                  ),
                  if (controller.searchController.text.isNotEmpty)
                    GestureDetector(
                      onTap: controller.clearSearch,
                      child: Container(
                        padding: EdgeInsets.all(2.r),
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: Color(0xFFD1D5DB),
                        ),
                        child: Icon(
                          Icons.close,
                          size: 14.r,
                          color: Colors.white,
                        ),
                      ),
                    ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
