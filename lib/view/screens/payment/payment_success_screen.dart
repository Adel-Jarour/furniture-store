import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../const/color_const.dart';
import '../../../routes/app_routes.dart';

class PaymentSuccessScreen extends StatelessWidget {
  const PaymentSuccessScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            // Top Bar
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 12.h),
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
                            color: const Color(0xFFE5E7EB), width: 1.w),
                      ),
                      alignment: Alignment.center,
                      child: Icon(Icons.arrow_back,
                          size: 20.r, color: ColorConst.textBlackColor),
                    ),
                  ),
                  Expanded(
                    child: Center(
                      child: Text('Payment',
                          style: TextStyle(
                              fontSize: 18.sp,
                              fontWeight: FontWeight.bold,
                              color: ColorConst.textBlackColor)),
                    ),
                  ),
                  SizedBox(width: 44.r),
                ],
              ),
            ),

            // Success Content
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 100.r,
                    height: 100.r,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle, color: ColorConst.primaryColor),
                    child: Icon(Icons.check_rounded,
                        size: 52.r, color: Colors.white),
                  ),
                  SizedBox(height: 28.h),
                  Text(
                    'Payment Successful!',
                    style: TextStyle(
                        fontSize: 22.sp,
                        fontWeight: FontWeight.bold,
                        color: ColorConst.textBlackColor),
                  ),
                  SizedBox(height: 10.h),
                  Text(
                    'Thank you for your purchase.',
                    style: TextStyle(
                        fontSize: 14.sp, color: ColorConst.textGreyColor),
                  ),
                ],
              ),
            ),

            // Bottom Buttons
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 24.h),
              child: Column(
                children: [
                  SizedBox(
                    width: double.infinity,
                    height: 52.h,
                    child: ElevatedButton(
                      onPressed: () => Get.toNamed(AppRoutes.orders),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: ColorConst.primaryColor,
                        foregroundColor: Colors.white,
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(28.r)),
                      ),
                      child: Text('View Order',
                          style: TextStyle(
                              fontSize: 15.sp, fontWeight: FontWeight.bold)),
                    ),
                  ),
                  SizedBox(height: 14.h),
                  GestureDetector(
                    onTap: () => Get.toNamed(AppRoutes.eReceipt),
                    child: Text(
                      'View E-Receipt',
                      style: TextStyle(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w600,
                          color: ColorConst.primaryColor),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
