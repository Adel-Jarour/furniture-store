import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../const/color_const.dart';
import '../../../../controller/product_search_controller.dart';

class CustomRecentSearchesSection extends StatelessWidget {
  final ProductSearchController controller;

  const CustomRecentSearchesSection({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    if (controller.recentSearches.isEmpty) {
      return const SizedBox.shrink();
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Recent Search',
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
          itemCount: controller.recentSearches.length,
          separatorBuilder: (context, index) => SizedBox(height: 8.h),
          itemBuilder: (context, index) {
            final keyword = controller.recentSearches[index];
            return InkWell(
              onTap: () => controller.executeSearch(keyword),
              borderRadius: BorderRadius.circular(8.r),
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 6.h),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      keyword,
                      style: TextStyle(
                        fontSize: 14.5.sp,
                        color: ColorConst.textGreyColor,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    GestureDetector(
                      onTap: () => controller.removeRecentSearch(keyword),
                      child: Icon(
                        Icons.close,
                        size: 18.r,
                        color: ColorConst.textGreyColor,
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ],
    );
  }
}
