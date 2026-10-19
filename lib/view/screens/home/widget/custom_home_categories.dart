import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../const/color_const.dart';
import '../../../../models/category_model.dart';

class CustomHomeCategories extends StatelessWidget {
  final List<CategoryModel> categories;
  final int selectedIndex;
  final ValueChanged<int>? onCategoryTap;
  final VoidCallback? onSeeAllTap;

  const CustomHomeCategories({
    super.key,
    required this.categories,
    this.selectedIndex = -1,
    this.onCategoryTap,
    this.onSeeAllTap,
  });

  IconData _getCategoryIcon(String id) {
    switch (id) {
      case 'cat_sofa':
        return Icons.weekend_rounded;
      case 'cat_chair':
        return Icons.chair_rounded;
      case 'cat_lamp':
        return Icons.light_rounded;
      case 'cat_cupboard':
        return Icons.kitchen_rounded;
      default:
        return Icons.chair_outlined;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Category Header Row
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Category',
              style: TextStyle(
                fontSize: 18.sp,
                fontWeight: FontWeight.bold,
                color: ColorConst.textBlackColor,
              ),
            ),
            GestureDetector(
              onTap: onSeeAllTap,
              child: Text(
                'See All',
                style: TextStyle(
                  fontSize: 13.sp,
                  fontWeight: FontWeight.w500,
                  color: ColorConst.textGreyColor,
                ),
              ),
            ),
          ],
        ),
        SizedBox(height: 14.h),

        // 4 Circular Categories in a Row
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: List.generate(categories.length, (index) {
            final cat = categories[index];
            final isSelected = selectedIndex == index;

            return GestureDetector(
              onTap: () => onCategoryTap?.call(index),
              child: Column(
                children: [
                  Container(
                    width: 58.r,
                    height: 58.r,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: isSelected
                          ? ColorConst.primaryColor
                          : const Color(0xFFEFF4F3),
                    ),
                    alignment: Alignment.center,
                    child: Icon(
                      _getCategoryIcon(cat.id),
                      color:
                          isSelected ? Colors.white : ColorConst.primaryColor,
                      size: 26.r,
                    ),
                  ),
                  SizedBox(height: 8.h),
                  Text(
                    cat.title,
                    style: TextStyle(
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w500,
                      color: ColorConst.textBlackColor,
                    ),
                  ),
                ],
              ),
            );
          }),
        ),
      ],
    );
  }
}
