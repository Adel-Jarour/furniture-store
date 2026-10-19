import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../../const/color_const.dart';
import '../../../../controller/payment_controller.dart';
import '../../../../routes/app_routes.dart';
import 'custom_payment_option_tile.dart';

class CustomPaymentCreditCardSection extends StatelessWidget {
  final PaymentController controller;

  const CustomPaymentCreditCardSection({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Credit & Debit Card',
              style: TextStyle(
                fontSize: 15.sp,
                fontWeight: FontWeight.bold,
                color: ColorConst.textBlackColor,
              ),
            ),
            GestureDetector(
              onTap: () => Get.toNamed(AppRoutes.managePaymentMethods),
              child: Text(
                'Manage',
                style: TextStyle(
                  fontSize: 13.sp,
                  fontWeight: FontWeight.w600,
                  color: ColorConst.primaryColor,
                ),
              ),
            ),
          ],
        ),
        SizedBox(height: 10.h),
        CustomPaymentOptionTile(
          icon: Icons.credit_card_rounded,
          label: 'Add Card',
          isSelected: controller.selectedOption == PaymentOption.card,
          onTap: () => Get.toNamed(AppRoutes.addCard),
          trailing: Icon(
            Icons.chevron_right_rounded,
            size: 20.r,
            color: ColorConst.textGreyColor,
          ),
        ),
      ],
    );
  }
}
