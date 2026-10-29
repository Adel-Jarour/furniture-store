import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../const/color_const.dart';
import '../../../../models/review_model.dart';

class CustomReviewTile extends StatelessWidget {
  final ReviewModel review;

  const CustomReviewTile({super.key, required this.review});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 12.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Avatar, Name, Verified Badge, Date
              Row(
                children: [
                  Stack(
                    children: [
                      CircleAvatar(
                        radius: 22.r,
                        backgroundColor: const Color(0xFFF3F4F6),
                        backgroundImage: review.reviewerAvatar.isNotEmpty
                            ? AssetImage(review.reviewerAvatar) as ImageProvider
                            : null,
                        child: review.reviewerAvatar.isEmpty
                            ? Icon(Icons.person,
                                size: 22.r, color: ColorConst.primaryColor)
                            : null,
                      ),
                      if (review.isVerified)
                        Positioned(
                          bottom: 0,
                          right: 0,
                          child: Container(
                            padding: EdgeInsets.all(2.r),
                            decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              color: Color(0xFF10B981),
                            ),
                            child: Icon(
                              Icons.check,
                              size: 10.r,
                              color: Colors.white,
                            ),
                          ),
                        ),
                    ],
                  ),
                  SizedBox(width: 12.w),
                  Expanded(
                    child: Text(
                      review.reviewerName,
                      style: TextStyle(
                        fontSize: 15.sp,
                        fontWeight: FontWeight.bold,
                        color: ColorConst.textBlackColor,
                      ),
                    ),
                  ),
                  Text(
                    review.date,
                    style: TextStyle(
                      fontSize: 12.sp,
                      color: ColorConst.textGreyColor,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 8.h),

              // Comment text
              Text(
                review.comment,
                style: TextStyle(
                  fontSize: 13.sp,
                  color: ColorConst.textGreyColor,
                  height: 1.4,
                ),
              ),
              SizedBox(height: 8.h),

              // Rating stars & score
              Row(
                children: [
                  ...List.generate(review.rating.floor(), (_) {
                    return Icon(
                      Icons.star_rounded,
                      size: 18.r,
                      color: const Color(0xFFFFA41C),
                    );
                  }),
                  SizedBox(width: 6.w),
                  Text(
                    review.rating.toStringAsFixed(1),
                    style: TextStyle(
                      fontSize: 13.sp,
                      fontWeight: FontWeight.bold,
                      color: ColorConst.textBlackColor,
                    ),
                  ),
                ],
              ),

              // Photos attached to review (if any)
              if (review.photos.isNotEmpty) ...[
                SizedBox(height: 10.h),
                SizedBox(
                  height: 70.h,
                  child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    itemCount: review.photos.length,
                    separatorBuilder: (_, __) => SizedBox(width: 8.w),
                    itemBuilder: (context, photoIndex) {
                      return ClipRRect(
                        borderRadius: BorderRadius.circular(10.r),
                        child: Image.asset(
                          review.photos[photoIndex],
                          width: 80.w,
                          height: 70.h,
                          fit: BoxFit.cover,
                          errorBuilder: (_, __, ___) => Container(
                            width: 80.w,
                            height: 70.h,
                            color: const Color(0xFFF3F4F6),
                            child: const Icon(Icons.image_outlined),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
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
  }
}
