import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../const/color_const.dart';

class CustomReviewsSearchFilterBar extends StatelessWidget {
  final TextEditingController searchController;
  final ValueChanged<String> onSearchChanged;
  final Set<String> activeFilters;
  final ValueChanged<String> onToggleFilter;

  const CustomReviewsSearchFilterBar({
    super.key,
    required this.searchController,
    required this.onSearchChanged,
    required this.activeFilters,
    required this.onToggleFilter,
  });

  Widget _buildFilterChip(String label, {bool isDropdown = false}) {
    final isSelected = activeFilters.contains(label);
    return GestureDetector(
      onTap: () => onToggleFilter(label),
      child: Container(
        margin: EdgeInsets.only(right: 8.w),
        padding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 8.h),
        decoration: BoxDecoration(
          color: isSelected ? ColorConst.primaryColor : const Color(0xFFF3F4F6),
          borderRadius: BorderRadius.circular(20.r),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (label == 'Filter') ...[
              Icon(
                Icons.tune_rounded,
                size: 15.r,
                color: isSelected ? Colors.white : ColorConst.textBlackColor,
              ),
              SizedBox(width: 4.w),
            ],
            Text(
              isDropdown ? '$label ▾' : label,
              style: TextStyle(
                fontSize: 13.sp,
                fontWeight: FontWeight.w600,
                color: isSelected ? Colors.white : ColorConst.textBlackColor,
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 8.h),
      child: Column(
        children: [
          // Search input field
          Container(
            height: 48.h,
            decoration: BoxDecoration(
              color: const Color(0xFFF7F8F9),
              borderRadius: BorderRadius.circular(12.r),
            ),
            padding: EdgeInsets.symmetric(horizontal: 14.w),
            child: Row(
              children: [
                Icon(
                  Icons.search_rounded,
                  size: 22.r,
                  color: const Color(0xFF9CA3AF),
                ),
                SizedBox(width: 10.w),
                Expanded(
                  child: TextField(
                    controller: searchController,
                    onChanged: onSearchChanged,
                    style: TextStyle(
                      fontSize: 14.sp,
                      color: ColorConst.textBlackColor,
                    ),
                    decoration: InputDecoration(
                      hintText: 'Search in reviews',
                      hintStyle: TextStyle(
                        fontSize: 14.sp,
                        color: const Color(0xFF9CA3AF),
                      ),
                      border: InputBorder.none,
                      isDense: true,
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 12.h),

          // Horizontal Filter Chips
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                _buildFilterChip('Filter', isDropdown: true),
                _buildFilterChip('Verified'),
                _buildFilterChip('Latest'),
                _buildFilterChip('Detailed Reviews'),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
