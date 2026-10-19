import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../const/color_const.dart';
import '../../../../controller/manual_location_controller.dart';

class CustomLocationResultsList extends StatelessWidget {
  final ManualLocationController controller;

  const CustomLocationResultsList({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    if (controller.isLoading) {
      return const Center(child: CircularProgressIndicator());
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'SEARCH RESULT',
          style: TextStyle(
            fontSize: 12.sp,
            fontWeight: FontWeight.bold,
            color: ColorConst.textGreyColor,
            letterSpacing: 1.0,
          ),
        ),
        SizedBox(height: 12.h),
        if (controller.results.isEmpty)
          Padding(
            padding: EdgeInsets.symmetric(vertical: 40.h),
            child: Center(
              child: Text(
                'No locations found',
                style: TextStyle(
                  fontSize: 14.sp,
                  color: ColorConst.textGreyColor,
                ),
              ),
            ),
          )
        else
          ListView.separated(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: controller.results.length,
            separatorBuilder: (context, index) => SizedBox(height: 16.h),
            itemBuilder: (context, index) {
              final loc = controller.results[index];
              return InkWell(
                onTap: () => controller.selectLocation(loc),
                borderRadius: BorderRadius.circular(10.r),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(top: 2.h),
                      child: Icon(
                        Icons.near_me_rounded,
                        size: 20.r,
                        color: ColorConst.primaryColor,
                      ),
                    ),
                    SizedBox(width: 14.w),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            loc.title,
                            style: TextStyle(
                              fontSize: 15.sp,
                              fontWeight: FontWeight.w600,
                              color: ColorConst.textBlackColor,
                            ),
                          ),
                          SizedBox(height: 4.h),
                          Text(
                            loc.address,
                            style: TextStyle(
                              fontSize: 13.sp,
                              color: ColorConst.textGreyColor,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
      ],
    );
  }
}
