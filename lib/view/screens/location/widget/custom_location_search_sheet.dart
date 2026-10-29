import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../../const/color_const.dart';
import '../../../../controller/location_controller.dart';
import '../../../widgets/custom_input_field.dart';

class CustomLocationSearchSheet extends StatelessWidget {
  const CustomLocationSearchSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<LocationController>(
      init: LocationController(),
      builder: (controller) {
        return Container(
          padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
          decoration: BoxDecoration(
            color: ColorConst.cardBgColor,
            borderRadius: BorderRadius.vertical(top: Radius.circular(24.r)),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Sheet Grab Handle
              Center(
                child: Container(
                  width: 44.w,
                  height: 4.h,
                  decoration: BoxDecoration(
                    color: ColorConst.borderColor,
                    borderRadius: BorderRadius.circular(2.r),
                  ),
                ),
              ),
              SizedBox(height: 16.h),
              Text(
                'Enter Your Location',
                style: TextStyle(
                  fontSize: 18.sp,
                  fontWeight: FontWeight.bold,
                  color: ColorConst.textBlackColor,
                ),
              ),
              SizedBox(height: 14.h),
              CustomInputField(
                controller: controller.searchController,
                hintText: 'Search city, state or zip...',
                prefixIcon: Icon(
                  Icons.search_rounded,
                  color: ColorConst.textGreyColor,
                  size: 22.r,
                ),
              ),
              SizedBox(height: 16.h),
              // Use Current Location Button
              InkWell(
                onTap: () {
                  Get.back();
                  controller.allowLocationAccess();
                },
                borderRadius: BorderRadius.circular(12.r),
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 8.h),
                  child: Row(
                    children: [
                      Container(
                        padding: EdgeInsets.all(8.r),
                        decoration: BoxDecoration(
                          color: ColorConst.primaryColor.withValues(alpha: 0.1),
                          shape: BoxShape.circle,
                        ),
                        child: Icon(
                          Icons.my_location_rounded,
                          color: ColorConst.primaryColor,
                          size: 20.r,
                        ),
                      ),
                      SizedBox(width: 12.w),
                      Text(
                        'Use Current Location',
                        style: TextStyle(
                          fontSize: 15.sp,
                          fontWeight: FontWeight.w600,
                          color: ColorConst.primaryColor,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const Divider(color: ColorConst.borderColor),
              SizedBox(height: 8.h),
              // Filtered Results List
              Flexible(
                child: ListView.separated(
                  shrinkWrap: true,
                  itemCount: controller.filteredLocations.length,
                  separatorBuilder: (_, __) => const Divider(
                      color: ColorConst.borderLightColor, height: 1),
                  itemBuilder: (context, index) {
                    final loc = controller.filteredLocations[index];
                    return ListTile(
                      contentPadding: EdgeInsets.zero,
                      leading: Icon(
                        Icons.location_on_outlined,
                        color: ColorConst.textGreyColor,
                        size: 22.r,
                      ),
                      title: Text(
                        loc,
                        style: TextStyle(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w500,
                          color: ColorConst.textBlackColor,
                        ),
                      ),
                      onTap: () {
                        Get.back();
                        controller.selectLocation(loc);
                      },
                    );
                  },
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
