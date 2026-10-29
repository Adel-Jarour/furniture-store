import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../const/color_const.dart';
import '../../../../models/review_summary_model.dart';

class CustomReviewSummaryItemsList extends StatelessWidget {
  final List<ReviewSummaryItemModel> items;

  const CustomReviewSummaryItemsList({super.key, required this.items});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: items.map((item) {
        return Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(vertical: 12.h),
              child: Row(
                children: [
                  Container(
                    width: 80.r,
                    height: 80.r,
                    decoration: BoxDecoration(
                      color: const Color(0xFFF7F8F9),
                      borderRadius: BorderRadius.circular(16.r),
                    ),
                    padding: EdgeInsets.all(8.r),
                    child: Image.asset(
                      item.image,
                      fit: BoxFit.contain,
                      errorBuilder: (_, __, ___) => Icon(
                        Icons.chair_rounded,
                        size: 40.r,
                        color: Colors.grey.shade400,
                      ),
                    ),
                  ),
                  SizedBox(width: 16.w),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              item.title,
                              style: TextStyle(
                                fontSize: 16.sp,
                                fontWeight: FontWeight.bold,
                                color: ColorConst.textBlackColor,
                              ),
                            ),
                            Row(
                              children: [
                                Icon(
                                  Icons.star_rounded,
                                  size: 18.r,
                                  color: const Color(0xFFFFA41C),
                                ),
                                SizedBox(width: 4.w),
                                Text(
                                  item.rating.toStringAsFixed(1),
                                  style: TextStyle(
                                    fontSize: 13.sp,
                                    color: ColorConst.textGreyColor,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        SizedBox(height: 4.h),
                        Text(
                          item.category,
                          style: TextStyle(
                            fontSize: 13.sp,
                            color: ColorConst.textGreyColor,
                          ),
                        ),
                        SizedBox(height: 6.h),
                        Text(
                          '\$${item.price.toStringAsFixed(2)} | Qty. ${item.quantity}',
                          style: TextStyle(
                            fontSize: 15.sp,
                            fontWeight: FontWeight.bold,
                            color: ColorConst.textBlackColor,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Divider(
              height: 1.h,
              thickness: 0.8.h,
              color: const Color(0xFFF0F0F0),
            ),
          ],
        );
      }).toList(),
    );
  }
}
