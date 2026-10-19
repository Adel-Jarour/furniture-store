import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../const/color_const.dart';
import '../../../controller/address_controller.dart';
import 'widget/custom_address_label_chips.dart';
import 'widget/custom_address_form_field.dart';

class AddAddressScreen extends StatelessWidget {
  const AddAddressScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AddressController>(
      init: AddressController(),
      builder: (controller) {
        return Scaffold(
          backgroundColor: Colors.white,
          body: Column(
            children: [
              // Map placeholder header
              Stack(
                children: [
                  Container(
                    height: 220.h,
                    width: double.infinity,
                    color: const Color(0xFFE2EAE9),
                    child: Center(
                      child: Icon(Icons.map_outlined,
                          size: 80.r, color: const Color(0xFF9CA3AF)),
                    ),
                  ),
                  SafeArea(
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: 20.w, vertical: 12.h),
                      child: Row(
                        children: [
                          GestureDetector(
                            onTap: () => Get.back(),
                            child: Container(
                              width: 44.r,
                              height: 44.r,
                              decoration: const BoxDecoration(
                                  shape: BoxShape.circle, color: Colors.white),
                              alignment: Alignment.center,
                              child: Icon(Icons.arrow_back,
                                  size: 20.r, color: ColorConst.textBlackColor),
                            ),
                          ),
                          Expanded(
                              child: Center(
                                  child: Text('Add Address',
                                      style: TextStyle(
                                          fontSize: 18.sp,
                                          fontWeight: FontWeight.bold,
                                          color: ColorConst.textBlackColor)))),
                          SizedBox(width: 44.r),
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    left: 0,
                    right: 0,
                    child: Center(
                      child: Container(
                        width: 48.r,
                        height: 48.r,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: ColorConst.primaryColor,
                          border: Border.all(color: Colors.white, width: 3),
                        ),
                        child: Icon(Icons.location_on_rounded,
                            size: 26.r, color: Colors.white),
                      ),
                    ),
                  ),
                ],
              ),

              // Form
              Expanded(
                child: SingleChildScrollView(
                  padding:
                      EdgeInsets.symmetric(horizontal: 20.w, vertical: 16.h),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Save address as *',
                          style: TextStyle(
                              fontSize: 13.sp,
                              fontWeight: FontWeight.w500,
                              color: ColorConst.textBlackColor)),
                      SizedBox(height: 10.h),
                      CustomAddressLabelChips(
                        labels: controller.labels,
                        selectedLabel: controller.selectedLabel,
                        onSelected: controller.selectLabel,
                      ),
                      SizedBox(height: 20.h),
                      Text('Complete address',
                          style: TextStyle(
                              fontSize: 13.sp,
                              fontWeight: FontWeight.w500,
                              color: ColorConst.textBlackColor)),
                      SizedBox(height: 8.h),
                      CustomAddressFormField(
                          controller: controller.addressController,
                          hint: 'Enter address *',
                          maxLines: 3),
                      SizedBox(height: 16.h),
                      Text('Floor',
                          style: TextStyle(
                              fontSize: 13.sp,
                              fontWeight: FontWeight.w500,
                              color: ColorConst.textBlackColor)),
                      SizedBox(height: 8.h),
                      CustomAddressFormField(
                          controller: controller.floorController,
                          hint: 'Enter Floor'),
                      SizedBox(height: 16.h),
                      Text('Landmark',
                          style: TextStyle(
                              fontSize: 13.sp,
                              fontWeight: FontWeight.w500,
                              color: ColorConst.textBlackColor)),
                      SizedBox(height: 8.h),
                      CustomAddressFormField(
                          controller: controller.landmarkController,
                          hint: 'Enter Landmark'),
                      SizedBox(height: 24.h),
                    ],
                  ),
                ),
              ),

              // Save Button
              Container(
                padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 16.h),
                decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                        color: Colors.black.withValues(alpha: 0.05),
                        blurRadius: 10,
                        offset: const Offset(0, -4))
                  ],
                ),
                child: SizedBox(
                  width: double.infinity,
                  height: 52.h,
                  child: ElevatedButton(
                    onPressed:
                        controller.isLoading ? null : controller.saveAddress,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: ColorConst.primaryColor,
                      foregroundColor: Colors.white,
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(28.r)),
                    ),
                    child: controller.isLoading
                        ? SizedBox(
                            width: 22.r,
                            height: 22.r,
                            child: const CircularProgressIndicator(
                                color: Colors.white, strokeWidth: 2))
                        : Text('Save address',
                            style: TextStyle(
                                fontSize: 15.sp, fontWeight: FontWeight.bold)),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
