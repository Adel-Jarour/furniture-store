import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../const/color_const.dart';
import '../../../../controller/manual_location_controller.dart';

class CustomManualLocationSearchInput extends StatelessWidget {
  final ManualLocationController controller;

  const CustomManualLocationSearchInput({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 52.h,
      padding: EdgeInsets.symmetric(horizontal: 14.w),
      decoration: BoxDecoration(
        color: const Color(0xFFF7F8F9),
        borderRadius: BorderRadius.circular(14.r),
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
              onChanged: controller.searchLocations,
              style: TextStyle(
                fontSize: 15.sp,
                color: ColorConst.textBlackColor,
              ),
              decoration: InputDecoration(
                hintText: 'Search location...',
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
    );
  }
}
