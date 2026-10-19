import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../const/color_const.dart';
import '../../../../controller/product_details_controller.dart';

class CustomProductImageCarousel extends StatelessWidget {
  final ProductDetailsController controller;

  const CustomProductImageCarousel({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.symmetric(horizontal: 20.w),
      padding: EdgeInsets.symmetric(vertical: 20.h),
      decoration: BoxDecoration(
        color: const Color(0xFFF9FAFB),
        borderRadius: BorderRadius.circular(20.r),
      ),
      child: Column(
        children: [
          SizedBox(
            height: 200.h,
            child: Stack(
              alignment: Alignment.center,
              children: [
                Positioned(
                  bottom: 12.h,
                  child: Container(
                    width: 240.w,
                    height: 36.h,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100),
                      border: Border.all(
                          color: const Color(0xFFD1D5DB), width: 1.w),
                    ),
                  ),
                ),
                Image.asset(
                  controller.thumbnails[controller.activeThumbnailIndex],
                  fit: BoxFit.contain,
                ),
                Positioned(
                  bottom: 4.h,
                  child: Container(
                    padding:
                        EdgeInsets.symmetric(horizontal: 8.w, vertical: 3.h),
                    decoration: BoxDecoration(
                      color: ColorConst.primaryColor,
                      borderRadius: BorderRadius.circular(12.r),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(Icons.arrow_left, size: 14.r, color: Colors.white),
                        Icon(Icons.arrow_right,
                            size: 14.r, color: Colors.white),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 16.h),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ...List.generate(controller.thumbnails.length, (index) {
                  final isSelected = controller.activeThumbnailIndex == index;
                  return GestureDetector(
                    onTap: () => controller.selectThumbnail(index),
                    child: Container(
                      width: 46.r,
                      height: 46.r,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.r),
                        border: Border.all(
                          color: isSelected
                              ? ColorConst.primaryColor
                              : const Color(0xFFE5E7EB),
                          width: isSelected ? 1.5.w : 1.w,
                        ),
                        color: Colors.white,
                      ),
                      child: Padding(
                        padding: EdgeInsets.all(4.r),
                        child: Image.asset(controller.thumbnails[index],
                            fit: BoxFit.contain),
                      ),
                    ),
                  );
                }),
                Container(
                  width: 46.r,
                  height: 46.r,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.r),
                    color: const Color(0xFF9CA3AF),
                  ),
                  alignment: Alignment.center,
                  child: Text(
                    '+10',
                    style: TextStyle(
                        fontSize: 13.sp,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
