import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../const/color_const.dart';
import '../../../../controller/payment_controller.dart';

class CustomPaymentConfirmBar extends StatelessWidget {
  final PaymentController controller;

  const CustomPaymentConfirmBar({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 16.h),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
              color: Colors.black.withValues(alpha: 0.05),
              blurRadius: 10,
              offset: const Offset(0, -4)),
        ],
      ),
      child: SizedBox(
        width: double.infinity,
        height: 52.h,
        child: ElevatedButton(
          onPressed: controller.isLoading ? null : controller.confirmPayment,
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
              : Text('Confirm Payment',
                  style:
                      TextStyle(fontSize: 15.sp, fontWeight: FontWeight.bold)),
        ),
      ),
    );
  }
}
