import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../const/color_const.dart';
import '../../../../models/order_model.dart';

class CustomTrackOrderTimeline extends StatelessWidget {
  final List<TrackingStep> steps;

  const CustomTrackOrderTimeline({
    super.key,
    required this.steps,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: steps.length,
      itemBuilder: (context, index) {
        final step = steps[index];
        final isLast = index == steps.length - 1;

        return IntrinsicHeight(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Stepper indicator column
              Column(
                children: [
                  Container(
                    width: 26.r,
                    height: 26.r,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: step.isCompleted
                          ? ColorConst.primaryColor
                          : const Color(0xFFE5E7EB),
                    ),
                    alignment: Alignment.center,
                    child: Icon(
                      Icons.check,
                      size: 16.r,
                      color: Colors.white,
                    ),
                  ),
                  if (!isLast)
                    Expanded(
                      child: Container(
                        width: 2.5.w,
                        color: step.isCompleted
                            ? ColorConst.primaryColor
                            : const Color(0xFFE5E7EB),
                        margin: EdgeInsets.symmetric(
                          vertical: 4.h,
                        ),
                      ),
                    ),
                ],
              ),
              SizedBox(width: 14.w),

              // Step title & timestamp
              Expanded(
                child: Padding(
                  padding: EdgeInsets.only(bottom: 24.h),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        step.title,
                        style: TextStyle(
                          fontSize: 15.sp,
                          fontWeight: FontWeight.bold,
                          color: ColorConst.textBlackColor,
                        ),
                      ),
                      SizedBox(height: 4.h),
                      Text(
                        step.timestamp,
                        style: TextStyle(
                          fontSize: 13.sp,
                          color: ColorConst.textGreyColor,
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              // Trailing icon
              Padding(
                padding: EdgeInsets.only(top: 2.h),
                child: Icon(
                  step.icon,
                  size: 24.r,
                  color: ColorConst.primaryColor,
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
