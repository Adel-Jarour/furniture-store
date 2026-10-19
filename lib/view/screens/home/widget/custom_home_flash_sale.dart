import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../const/color_const.dart';

class CustomHomeFlashSale extends StatelessWidget {
  final String hours;
  final String minutes;
  final String seconds;
  final List<String> filters;
  final String selectedFilter;
  final ValueChanged<String>? onFilterSelected;

  const CustomHomeFlashSale({
    super.key,
    required this.hours,
    required this.minutes,
    required this.seconds,
    required this.filters,
    required this.selectedFilter,
    this.onFilterSelected,
  });

  Widget _buildTimeBox(String value) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 3.h),
      decoration: BoxDecoration(
        color: const Color(0xFFEFF4F3),
        borderRadius: BorderRadius.circular(4.r),
      ),
      child: Text(
        value,
        style: TextStyle(
          fontSize: 11.sp,
          fontWeight: FontWeight.bold,
          color: ColorConst.primaryColor,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Title & Closing in Timer Row
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Flash Sale',
              style: TextStyle(
                fontSize: 18.sp,
                fontWeight: FontWeight.bold,
                color: ColorConst.textBlackColor,
              ),
            ),
            Row(
              children: [
                Text(
                  'Closing in : ',
                  style: TextStyle(
                    fontSize: 11.sp,
                    color: ColorConst.textGreyColor,
                  ),
                ),
                _buildTimeBox(hours),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 2.w),
                  child: Text(':',
                      style: TextStyle(
                          fontSize: 11.sp, color: ColorConst.textGreyColor)),
                ),
                _buildTimeBox(minutes),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 2.w),
                  child: Text(':',
                      style: TextStyle(
                          fontSize: 11.sp, color: ColorConst.textGreyColor)),
                ),
                _buildTimeBox(seconds),
              ],
            ),
          ],
        ),
        SizedBox(height: 12.h),

        // Filter Pills Row
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: filters.map((filter) {
              final isSelected = selectedFilter == filter;
              return GestureDetector(
                onTap: () => onFilterSelected?.call(filter),
                child: Container(
                  margin: EdgeInsets.only(right: 10.w),
                  padding: EdgeInsets.symmetric(
                    horizontal: 18.w,
                    vertical: 8.h,
                  ),
                  decoration: BoxDecoration(
                    color: isSelected ? ColorConst.primaryColor : Colors.white,
                    borderRadius: BorderRadius.circular(20.r),
                    border: Border.all(
                      color: isSelected
                          ? ColorConst.primaryColor
                          : const Color(0xFFE5E7EB),
                      width: 1.w,
                    ),
                  ),
                  child: Text(
                    filter,
                    style: TextStyle(
                      fontSize: 13.sp,
                      fontWeight:
                          isSelected ? FontWeight.w600 : FontWeight.w400,
                      color:
                          isSelected ? Colors.white : ColorConst.textBlackColor,
                    ),
                  ),
                ),
              );
            }).toList(),
          ),
        ),
      ],
    );
  }
}
