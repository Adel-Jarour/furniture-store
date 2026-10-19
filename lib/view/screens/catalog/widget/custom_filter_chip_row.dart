import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../const/color_const.dart';

/// Reusable horizontal scrollable chip row used in FilterScreen.
class CustomFilterChipRow extends StatelessWidget {
  final List<String> options;
  final String selectedValue;
  final ValueChanged<String> onSelected;

  const CustomFilterChipRow({
    super.key,
    required this.options,
    required this.selectedValue,
    required this.onSelected,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: options.map((option) {
          final isSelected = selectedValue == option;
          return GestureDetector(
            onTap: () => onSelected(option),
            child: Container(
              margin: EdgeInsets.only(right: 10.w),
              padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 8.h),
              decoration: BoxDecoration(
                color: isSelected
                    ? ColorConst.primaryColor
                    : const Color(0xFFF3F4F6),
                borderRadius: BorderRadius.circular(20.r),
              ),
              child: Text(
                option,
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
