import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../const/color_const.dart';
import '../../../../controller/payment_controller.dart';

class CustomPaymentMoreOptions extends StatelessWidget {
  final PaymentController controller;

  const CustomPaymentMoreOptions({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'More Payment Options',
          style: TextStyle(
            fontSize: 15.sp,
            fontWeight: FontWeight.bold,
            color: ColorConst.textBlackColor,
          ),
        ),
        SizedBox(height: 10.h),
        Container(
          decoration: BoxDecoration(
            border: Border.all(color: const Color(0xFFE5E7EB), width: 1.w),
            borderRadius: BorderRadius.circular(14.r),
          ),
          child: Column(
            children: [
              _buildOption(
                label: 'Paypal',
                icon: Icons.paypal,
                option: PaymentOption.paypal,
              ),
              Divider(height: 1.h, color: const Color(0xFFE5E7EB)),
              _buildOption(
                label: 'Apple Pay',
                icon: Icons.apple,
                option: PaymentOption.applePay,
              ),
              Divider(height: 1.h, color: const Color(0xFFE5E7EB)),
              _buildOption(
                label: 'Google Pay',
                icon: Icons.g_mobiledata_rounded,
                option: PaymentOption.googlePay,
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildOption({
    required String label,
    required IconData icon,
    required PaymentOption option,
  }) {
    final isSelected = controller.selectedOption == option;
    return InkWell(
      onTap: () => controller.selectOption(option),
      borderRadius: BorderRadius.circular(14.r),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 14.h),
        child: Row(
          children: [
            Icon(icon, size: 26.r, color: ColorConst.primaryColor),
            SizedBox(width: 14.w),
            Expanded(
              child: Text(
                label,
                style: TextStyle(
                  fontSize: 15.sp,
                  fontWeight: FontWeight.w600,
                  color: ColorConst.textBlackColor,
                ),
              ),
            ),
            Container(
              width: 20.r,
              height: 20.r,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: isSelected
                      ? ColorConst.primaryColor
                      : const Color(0xFFD1D5DB),
                  width: 2.w,
                ),
              ),
              alignment: Alignment.center,
              child: isSelected
                  ? Container(
                      width: 10.r,
                      height: 10.r,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: ColorConst.primaryColor,
                      ),
                    )
                  : null,
            ),
          ],
        ),
      ),
    );
  }
}
