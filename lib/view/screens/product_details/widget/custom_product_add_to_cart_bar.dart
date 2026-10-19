import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../const/color_const.dart';
import '../../../../controller/product_details_controller.dart';

class CustomProductAddToCartBar extends StatelessWidget {
  final ProductDetailsController controller;

  const CustomProductAddToCartBar({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 14.h),
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
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'Total Price',
                style:
                    TextStyle(fontSize: 12.sp, color: ColorConst.textGreyColor),
              ),
              SizedBox(height: 2.h),
              Text(
                '\$${controller.product.price.toStringAsFixed(2)}',
                style: TextStyle(
                  fontSize: 18.sp,
                  fontWeight: FontWeight.bold,
                  color: ColorConst.textBlackColor,
                ),
              ),
            ],
          ),
          SizedBox(width: 24.w),
          Expanded(
            child: SizedBox(
              height: 52.h,
              child: ElevatedButton(
                onPressed: controller.addToCart,
                style: ElevatedButton.styleFrom(
                  backgroundColor: ColorConst.primaryColor,
                  foregroundColor: Colors.white,
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(28.r),
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.shopping_bag_outlined,
                        size: 20.r, color: Colors.white),
                    SizedBox(width: 10.w),
                    Text(
                      'Add to Cart',
                      style: TextStyle(
                          fontSize: 15.sp, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
