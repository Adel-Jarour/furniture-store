import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../const/color_const.dart';

class CustomFilterReviewRow extends StatelessWidget {
  final String reviewText;
  final bool isSelected;
  final VoidCallback onTap;

  const CustomFilterReviewRow({
    super.key,
    required this.reviewText,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      behavior: HitTestBehavior.opaque,
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 6.h),
        child: Row(
          children: [
            Row(
              children: List.generate(
                5,
                (i) => Padding(
                  padding: EdgeInsets.only(right: 2.w),
                  child: Icon(Icons.star_rounded,
                      size: 18.r, color: const Color(0xFFF59E0B)),
                ),
              ),
            ),
            SizedBox(width: 8.w),
            Expanded(
              child: Text(
                reviewText,
                style: TextStyle(
                    fontSize: 14.sp, color: ColorConst.textBlackColor),
              ),
            ),
            Container(
              width: 20.r,
              height: 20.r,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: isSelected
                      ? ColorConst.primaryColor
                      : const Color(0xFF9CA3AF),
                  width: isSelected ? 5.r : 1.5.r,
                ),
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
