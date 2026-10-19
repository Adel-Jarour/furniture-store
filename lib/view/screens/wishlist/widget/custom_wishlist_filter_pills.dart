import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../const/color_const.dart';

class CustomWishlistFilterPills extends StatelessWidget {
  final List<String> categories;
  final String selectedCategory;
  final ValueChanged<String> onSelected;

  const CustomWishlistFilterPills({
    super.key,
    required this.categories,
    required this.selectedCategory,
    required this.onSelected,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: categories.map((cat) {
          final isSelected = selectedCategory == cat;
          return GestureDetector(
            onTap: () => onSelected(cat),
            child: Container(
              margin: EdgeInsets.only(right: 10.w),
              padding: EdgeInsets.symmetric(horizontal: 18.w, vertical: 8.h),
              decoration: BoxDecoration(
                color: isSelected
                    ? ColorConst.primaryColor
                    : const Color(0xFFF3F4F6),
                borderRadius: BorderRadius.circular(20.r),
              ),
              child: Text(
                cat,
                style: TextStyle(
                  fontSize: 13.sp,
                  fontWeight: isSelected ? FontWeight.w600 : FontWeight.w400,
                  color: isSelected ? Colors.white : ColorConst.textBlackColor,
                ),
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}
