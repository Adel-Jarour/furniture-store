import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../const/color_const.dart';
import '../../../controller/location_controller.dart';
import '../../../routes/app_routes.dart';
import '../../widgets/custom_button.dart';

class LocationScreen extends StatelessWidget {
  const LocationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<LocationController>(
      init: LocationController(),
      builder: (controller) {
        return Scaffold(
          backgroundColor: ColorConst.scaffoldBgColor,
          body: SafeArea(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 24.h),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Spacer(),
                  // Location Graphic with concentric rings
                  Container(
                    width: 140.r,
                    height: 140.r,
                    decoration: BoxDecoration(
                      color: ColorConst.primaryColor.withValues(alpha: 0.08),
                      shape: BoxShape.circle,
                    ),
                    alignment: Alignment.center,
                    child: Container(
                      width: 90.r,
                      height: 90.r,
                      decoration: const BoxDecoration(
                        color: ColorConst.primaryColor,
                        shape: BoxShape.circle,
                      ),
                      child: Icon(
                        Icons.location_on_rounded,
                        size: 48.r,
                        color: ColorConst.textWhiteColor,
                      ),
                    ),
                  ),
                  SizedBox(height: 36.h),
                  // Title
                  Text(
                    'What is Your Location?',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 24.sp,
                      fontWeight: FontWeight.bold,
                      color: ColorConst.textBlackColor,
                    ),
                  ),
                  SizedBox(height: 12.h),
                  // Subtitle
                  Text(
                    'We need your location to show available furniture showrooms, real-time inventory, and white-glove delivery options.',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 14.sp,
                      color: ColorConst.textGreyColor,
                      height: 1.5,
                    ),
                  ),
                  const Spacer(),
                  // Allow Location Access (Primary Teal)
                  CustomButton(
                    text: 'Allow Location Access',
                    isLoading: controller.isDetecting,
                    onPressed: controller.allowLocationAccess,
                    backgroundColor: ColorConst.primaryColor,
                  ),
                  SizedBox(height: 14.h),
                  // Enter Location Manually (Outlined)
                  CustomButton(
                    text: 'Enter Location Manually',
                    onPressed: () =>
                        Get.toNamed(AppRoutes.searchManualLocation),
                    backgroundColor: Colors.transparent,
                    textColor: ColorConst.textBlackColor,
                    border: BorderSide(
                      color: ColorConst.borderColor,
                      width: 1.2.w,
                    ),
                  ),
                  SizedBox(height: 12.h),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
