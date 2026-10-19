import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../const/color_const.dart';
import '../../../../controller/payment_controller.dart';
import 'custom_payment_option_tile.dart';

class CustomPaymentCashSection extends StatelessWidget {
  final PaymentController controller;

  const CustomPaymentCashSection({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Cash',
          style: TextStyle(
            fontSize: 15.sp,
            fontWeight: FontWeight.bold,
            color: ColorConst.textBlackColor,
          ),
        ),
        SizedBox(height: 10.h),
        CustomPaymentOptionTile(
          icon: Icons.money_outlined,
          label: 'Cash',
          isSelected: controller.selectedOption == PaymentOption.cash,
          onTap: () => controller.selectOption(PaymentOption.cash),
          trailing: null,
        ),
      ],
    );
  }
}
