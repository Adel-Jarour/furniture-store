import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomStarSelector extends StatelessWidget {
  final int rating;
  final ValueChanged<int> onRatingChanged;

  const CustomStarSelector({
    super.key,
    required this.rating,
    required this.onRatingChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(5, (index) {
        final isFilled = index < rating;
        return GestureDetector(
          onTap: () => onRatingChanged(index + 1),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 4.w),
            child: Icon(
              Icons.star_rounded,
              size: 38.r,
              color:
                  isFilled ? const Color(0xFFF59E0B) : const Color(0xFFE5E7EB),
            ),
          ),
        );
      }),
    );
  }
}
