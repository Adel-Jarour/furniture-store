import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../const/color_const.dart';
import '../../../../data/repository/review_repository.dart';

class CustomRatingSummaryCard extends StatelessWidget {
  final ReviewStatsModel stats;

  const CustomRatingSummaryCard({super.key, required this.stats});

  Widget _buildProgressBar(int star, double percent) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 2.5.h),
      child: Row(
        children: [
          Text(
            '$star',
            style: TextStyle(
              fontSize: 13.sp,
              fontWeight: FontWeight.w600,
              color: ColorConst.textBlackColor,
            ),
          ),
          SizedBox(width: 8.w),
          Expanded(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(4.r),
              child: LinearProgressIndicator(
                value: percent,
                minHeight: 6.h,
                backgroundColor: const Color(0xFFE5E7EB),
                valueColor: const AlwaysStoppedAnimation<Color>(
                    ColorConst.primaryColor),
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 8.h),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // Left side: Rating score & stars
          Expanded(
            flex: 5,
            child: Column(
              children: [
                Text(
                  stats.averageRating.toStringAsFixed(1),
                  style: TextStyle(
                    fontSize: 42.sp,
                    fontWeight: FontWeight.bold,
                    color: ColorConst.textBlackColor,
                  ),
                ),
                SizedBox(height: 4.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(5, (index) {
                    return Icon(
                      Icons.star_rounded,
                      size: 20.r,
                      color: const Color(0xFFFFA41C),
                    );
                  }),
                ),
                SizedBox(height: 6.h),
                Text(
                  '(${stats.totalReviews} Reviews)',
                  style: TextStyle(
                    fontSize: 13.sp,
                    color: ColorConst.textGreyColor,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),

          // Vertical divider
          Container(
            height: 90.h,
            width: 1.w,
            color: const Color(0xFFF0F0F0),
            margin: EdgeInsets.symmetric(horizontal: 16.w),
          ),

          // Right side: Bars breakdown
          Expanded(
            flex: 6,
            child: Column(
              children: [5, 4, 3, 2, 1].map((star) {
                final percent = stats.starPercentages[star] ?? 0.0;
                return _buildProgressBar(star, percent);
              }).toList(),
            ),
          ),
        ],
      ),
    );
  }
}
