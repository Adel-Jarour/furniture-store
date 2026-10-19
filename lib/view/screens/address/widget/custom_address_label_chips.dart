import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../const/color_const.dart';

class CustomAddressLabelChips extends StatelessWidget {
  final List<String> labels;
  final String selectedLabel;
  final ValueChanged<String> onSelected;

  const CustomAddressLabelChips(
      {super.key,
      required this.labels,
      required this.selectedLabel,
      required this.onSelected});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: labels.map((label) {
        final isSelected = selectedLabel == label;
        return GestureDetector(
          onTap: () => onSelected(label),
          child: Container(
            margin: EdgeInsets.only(right: 10.w),
            padding: EdgeInsets.symmetric(horizontal: 18.w, vertical: 8.h),
            decoration: BoxDecoration(
              color: isSelected ? ColorConst.primaryColor : Colors.transparent,
              borderRadius: BorderRadius.circular(20.r),
              border: Border.all(
                  color: isSelected
                      ? ColorConst.primaryColor
                      : const Color(0xFFD1D5DB),
                  width: 1.w),
            ),
            child: Text(label,
                style: TextStyle(
                    fontSize: 13.sp,
                    fontWeight: isSelected ? FontWeight.w600 : FontWeight.w400,
                    color:
                        isSelected ? Colors.white : ColorConst.textBlackColor)),
          ),
        );
      }).toList(),
    );
  }
}
