import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../const/color_const.dart';
import '../../../../controller/product_details_controller.dart';

class CustomProductDetailsTopBar extends StatelessWidget {
  final ProductDetailsController controller;

  const CustomProductDetailsTopBar({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GestureDetector(
            onTap: () => Navigator.of(context).pop(),
            child: Container(
              width: 44.r,
              height: 44.r,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white,
                border: Border.all(color: const Color(0xFFE5E7EB), width: 1.w),
              ),
              alignment: Alignment.center,
              child: Icon(Icons.arrow_back,
                  size: 20.r, color: ColorConst.textBlackColor),
            ),
          ),
          Text(
            'Product Details',
            style: TextStyle(
              fontSize: 18.sp,
              fontWeight: FontWeight.bold,
              color: ColorConst.textBlackColor,
            ),
          ),
          GestureDetector(
            onTap: controller.toggleFavorite,
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
                controller.isFavorite
                    ? Icons.favorite_rounded
                    : Icons.favorite_border_rounded,
                size: 20.r,
                color: ColorConst.primaryColor,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
