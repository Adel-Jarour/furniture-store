import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../const/color_const.dart';
import '../../../../models/category_model.dart';

class CustomCategoryGridItem extends StatelessWidget {
  final CategoryModel item;
  final IconData icon;
  final VoidCallback onTap;

  const CustomCategoryGridItem({
    super.key,
    required this.item,
    required this.icon,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          Container(
            width: 62.r,
            height: 62.r,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: Color(0xFFEFF4F3),
            ),
            alignment: Alignment.center,
            child: Icon(icon, size: 28.r, color: ColorConst.primaryColor),
          ),
          SizedBox(height: 8.h),
          Text(
            item.title,
            textAlign: TextAlign.center,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              fontSize: 12.sp,
              fontWeight: FontWeight.w500,
              color: ColorConst.textBlackColor,
              height: 1.2,
            ),
          ),
        ],
      ),
    );
  }
}
