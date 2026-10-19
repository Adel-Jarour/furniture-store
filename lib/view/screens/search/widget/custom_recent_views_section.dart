import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../../const/color_const.dart';
import '../../../../controller/product_search_controller.dart';
import '../../../../routes/app_routes.dart';

class CustomRecentViewsSection extends StatelessWidget {
  final ProductSearchController controller;

  const CustomRecentViewsSection({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    if (controller.recentViews.isEmpty) {
      return const SizedBox.shrink();
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Recent View',
          style: TextStyle(
            fontSize: 16.sp,
            fontWeight: FontWeight.bold,
            color: ColorConst.textBlackColor,
          ),
        ),
        SizedBox(height: 12.h),
        ListView.separated(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: controller.recentViews.length,
          separatorBuilder: (context, index) => SizedBox(height: 16.h),
          itemBuilder: (context, index) {
            final item = controller.recentViews[index];
            return InkWell(
              onTap: () =>
                  Get.toNamed(AppRoutes.productDetails, arguments: item),
              borderRadius: BorderRadius.circular(14.r),
              child: Row(
                children: [
                  Container(
                    width: 72.r,
                    height: 72.r,
                    padding: EdgeInsets.all(6.r),
                    decoration: BoxDecoration(
                      color: const Color(0xFFF9FAFB),
                      borderRadius: BorderRadius.circular(14.r),
                    ),
                    child: Image.asset(
                      item.image,
                      fit: BoxFit.contain,
                    ),
                  ),
                  SizedBox(width: 16.w),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          item.title,
                          style: TextStyle(
                            fontSize: 15.sp,
                            fontWeight: FontWeight.w600,
                            color: ColorConst.textBlackColor,
                          ),
                        ),
                        SizedBox(height: 4.h),
                        Text(
                          item.category,
                          style: TextStyle(
                            fontSize: 13.sp,
                            color: ColorConst.textGreyColor,
                          ),
                        ),
                        SizedBox(height: 6.h),
                        Text(
                          '\$${item.price.toStringAsFixed(2)}',
                          style: TextStyle(
                            fontSize: 15.sp,
                            fontWeight: FontWeight.bold,
                            color: ColorConst.textBlackColor,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ],
    );
  }
}
