import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../const/color_const.dart';
import '../../../../controller/add_card_controller.dart';
import 'custom_card_form_field.dart';

class CustomCardInputForm extends StatelessWidget {
  final AddCardController controller;

  const CustomCardInputForm({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomCardFormField(
          label: 'Card Holder Name',
          controller: controller.holderNameController,
          hint: 'Esther Howard',
          onChanged: (_) => controller.update(),
        ),
        SizedBox(height: 16.h),
        CustomCardFormField(
          label: 'Card Number',
          controller: controller.cardNumberController,
          hint: '5300 0000 0000 0000',
          keyboardType: TextInputType.number,
          onChanged: (_) => controller.update(),
        ),
        SizedBox(height: 16.h),
        Row(
          children: [
            Expanded(
              child: CustomCardFormField(
                label: 'Expiry Date',
                controller: controller.expiryController,
                hint: '12/26',
                keyboardType: TextInputType.datetime,
                onChanged: (_) => controller.update(),
              ),
            ),
            SizedBox(width: 14.w),
            Expanded(
              child: CustomCardFormField(
                label: 'CVV',
                controller: controller.cvvController,
                hint: '•••',
                keyboardType: TextInputType.number,
                obscure: true,
                onChanged: (_) => controller.update(),
              ),
            ),
          ],
        ),
        SizedBox(height: 16.h),
        Row(
          children: [
            SizedBox(
              width: 22.r,
              height: 22.r,
              child: Checkbox(
                value: controller.saveCard,
                onChanged: controller.toggleSaveCard,
                activeColor: ColorConst.primaryColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5.r),
                ),
              ),
            ),
            SizedBox(width: 10.w),
            Text(
              'Save Card for future payments',
              style: TextStyle(
                fontSize: 14.sp,
                fontWeight: FontWeight.w500,
                color: ColorConst.textBlackColor,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
