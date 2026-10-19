import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../const/color_const.dart';
import '../../../routes/app_routes.dart';

class ManagePaymentMethodsScreen extends StatelessWidget {
  const ManagePaymentMethodsScreen({super.key});

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
                      child: Text('Payment Methods',
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

            Expanded(
              child: SingleChildScrollView(
                padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 8.h),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Credit & Debit Card',
                        style: TextStyle(
                            fontSize: 15.sp,
                            fontWeight: FontWeight.bold,
                            color: ColorConst.textBlackColor)),
                    SizedBox(height: 10.h),
                    _buildLinkTile(Icons.credit_card_rounded, 'Add New Card',
                        () => Get.toNamed(AppRoutes.addCard)),
                    SizedBox(height: 24.h),
                    Text('More Payment Options',
                        style: TextStyle(
                            fontSize: 15.sp,
                            fontWeight: FontWeight.bold,
                            color: ColorConst.textBlackColor)),
                    SizedBox(height: 10.h),
                    Container(
                      decoration: BoxDecoration(
                        border: Border.all(
                            color: const Color(0xFFE5E7EB), width: 1.w),
                        borderRadius: BorderRadius.circular(14.r),
                      ),
                      child: Column(
                        children: [
                          _buildLinkRow(Icons.paypal, 'Paypal', () {}),
                          Divider(height: 1.h, color: const Color(0xFFE5E7EB)),
                          _buildLinkRow(Icons.apple, 'Apple Pay', () {}),
                          Divider(height: 1.h, color: const Color(0xFFE5E7EB)),
                          _buildLinkRow(
                              Icons.g_mobiledata_rounded, 'Google Pay', () {}),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildLinkTile(IconData icon, String label, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(14.r),
          border: Border.all(color: const Color(0xFFE5E7EB), width: 1.w),
        ),
        child: Row(
          children: [
            Icon(icon, size: 22.r, color: ColorConst.textBlackColor),
            SizedBox(width: 14.w),
            Expanded(
                child: Text(label,
                    style: TextStyle(
                        fontSize: 14.sp, color: ColorConst.textBlackColor))),
            Text('Link',
                style: TextStyle(
                    fontSize: 13.sp,
                    fontWeight: FontWeight.w600,
                    color: ColorConst.primaryColor)),
          ],
        ),
      ),
    );
  }

  Widget _buildLinkRow(IconData icon, String label, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      behavior: HitTestBehavior.opaque,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
        child: Row(
          children: [
            Icon(icon, size: 26.r, color: ColorConst.textBlackColor),
            SizedBox(width: 14.w),
            Expanded(
                child: Text(label,
                    style: TextStyle(
                        fontSize: 14.sp, color: ColorConst.textBlackColor))),
            Text('Link',
                style: TextStyle(
                    fontSize: 13.sp,
                    fontWeight: FontWeight.w600,
                    color: ColorConst.primaryColor)),
          ],
        ),
      ),
    );
  }
}
