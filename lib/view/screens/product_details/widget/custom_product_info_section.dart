import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../const/color_const.dart';
import '../../../../controller/product_details_controller.dart';

class CustomProductInfoSection extends StatelessWidget {
  final ProductDetailsController controller;

  const CustomProductInfoSection({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Category and Star Rating Row
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                controller.product.category,
                style: TextStyle(
                  fontSize: 13.sp,
                  color: ColorConst.textGreyColor,
                  fontWeight: FontWeight.w500,
                ),
              ),
              Row(
                children: [
                  Icon(Icons.star_rounded,
                      size: 18.r, color: const Color(0xFFF59E0B)),
                  SizedBox(width: 4.w),
                  Text(
                    controller.product.rating.toStringAsFixed(1),
                    style: TextStyle(
                      fontSize: 13.sp,
                      fontWeight: FontWeight.bold,
                      color: ColorConst.textBlackColor,
                    ),
                  ),
                ],
              ),
            ],
          ),
          SizedBox(height: 6.h),

          // Product Title
          Text(
            controller.product.title,
            style: TextStyle(
              fontSize: 22.sp,
              fontWeight: FontWeight.bold,
              color: ColorConst.textBlackColor,
            ),
          ),
          SizedBox(height: 16.h),

          // Details Header
          Text(
            'Product Details',
            style: TextStyle(
              fontSize: 15.sp,
              fontWeight: FontWeight.bold,
              color: ColorConst.textBlackColor,
            ),
          ),
          SizedBox(height: 6.h),

          // Description
          RichText(
            text: TextSpan(
              style: TextStyle(
                fontSize: 13.sp,
                color: ColorConst.textGreyColor,
                height: 1.45,
                fontFamily: Theme.of(context).textTheme.bodyMedium?.fontFamily,
              ),
              children: const [
                TextSpan(
                  text:
                      'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua ',
                ),
                TextSpan(
                  text: 'Read more',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: ColorConst.primaryColor,
                    decoration: TextDecoration.underline,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 16.h),

          const Divider(color: Color(0xFFF3F4F6)),
          SizedBox(height: 12.h),

          // Select Color Row
          Row(
            children: [
              Text(
                'Select Color : ',
                style: TextStyle(
                  fontSize: 15.sp,
                  fontWeight: FontWeight.bold,
                  color: ColorConst.textBlackColor,
                ),
              ),
              Text(
                controller.selectedColorName,
                style: TextStyle(
                  fontSize: 15.sp,
                  fontWeight: FontWeight.w500,
                  color: ColorConst.textGreyColor,
                ),
              ),
            ],
          ),
          SizedBox(height: 12.h),

          // Color Swatches
          Row(
            children: List.generate(controller.colorOptions.length, (index) {
              final swatch = controller.colorOptions[index];
              final isSelected = controller.selectedColorIndex == index;
              return GestureDetector(
                onTap: () => controller.selectColor(index),
                child: Container(
                  margin: EdgeInsets.only(right: 14.w),
                  padding: EdgeInsets.all(2.r),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: isSelected
                        ? Border.all(color: ColorConst.primaryColor, width: 2.w)
                        : null,
                  ),
                  child: Container(
                    width: 28.r,
                    height: 28.r,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle, color: swatch.color),
                  ),
                ),
              );
            }),
          ),
          SizedBox(height: 24.h),
        ],
      ),
    );
  }
}
