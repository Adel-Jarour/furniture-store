import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../const/color_const.dart';
import '../../../controller/address_controller.dart';
import '../../../routes/app_routes.dart';
import 'widget/custom_address_tile.dart';

class ManageAddressScreen extends StatelessWidget {
  const ManageAddressScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AddressController>(
      init: AddressController(),
      builder: (controller) {
        return Scaffold(
          backgroundColor: Colors.white,
          body: SafeArea(
            child: Column(
              children: [
                // Top Bar
                Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: 20.w, vertical: 12.h),
                  child: Row(
                    children: [
                      GestureDetector(
                        onTap: () => Get.back(),
                        child: Container(
                          width: 44.r,
                          height: 44.r,
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.white,
                              border: Border.all(
                                  color: const Color(0xFFE5E7EB), width: 1.w)),
                          alignment: Alignment.center,
                          child: Icon(Icons.arrow_back,
                              size: 20.r, color: ColorConst.textBlackColor),
                        ),
                      ),
                      Expanded(
                          child: Center(
                              child: Text('Manage Address',
                                  style: TextStyle(
                                      fontSize: 18.sp,
                                      fontWeight: FontWeight.bold,
                                      color: ColorConst.textBlackColor)))),
                      SizedBox(width: 44.r),
                    ],
                  ),
                ),

                Expanded(
                  child: SingleChildScrollView(
                    padding:
                        EdgeInsets.symmetric(horizontal: 20.w, vertical: 8.h),
                    child: Column(
                      children: [
                        // Address list
                        ...controller.addresses.map((addr) => Column(
                              children: [
                                CustomAddressTile(
                                  address: addr,
                                  isSelected:
                                      controller.selectedAddressId == addr.id,
                                  onTap: () =>
                                      controller.selectAddress(addr.id),
                                ),
                                Divider(
                                    height: 1.h,
                                    color: const Color(0xFFF3F4F6)),
                              ],
                            )),
                        SizedBox(height: 16.h),

                        // Add new address dashed button
                        GestureDetector(
                          onTap: () => Get.toNamed(AppRoutes.addAddress),
                          child: Container(
                            width: double.infinity,
                            padding: EdgeInsets.symmetric(vertical: 16.h),
                            decoration: BoxDecoration(
                              border: Border.all(
                                  color: const Color(0xFFD1D5DB),
                                  width: 1.5.w,
                                  style: BorderStyle.solid),
                              borderRadius: BorderRadius.circular(14.r),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(Icons.add,
                                    size: 18.r,
                                    color: ColorConst.textBlackColor),
                                SizedBox(width: 8.w),
                                Text('Add New Shipping Address',
                                    style: TextStyle(
                                        fontSize: 14.sp,
                                        color: ColorConst.textBlackColor)),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

                // Apply Button
                Container(
                  padding:
                      EdgeInsets.symmetric(horizontal: 20.w, vertical: 16.h),
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
                      onPressed: () => Get.back(),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: ColorConst.primaryColor,
                        foregroundColor: Colors.white,
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(28.r)),
                      ),
                      child: Text('Apply',
                          style: TextStyle(
                              fontSize: 15.sp, fontWeight: FontWeight.bold)),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
