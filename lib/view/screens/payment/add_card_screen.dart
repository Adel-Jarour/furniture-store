import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../const/color_const.dart';
import '../../../controller/add_card_controller.dart';
import 'widget/custom_card_preview.dart';
import 'widget/custom_card_form_field.dart';

class AddCardScreen extends StatelessWidget {
  const AddCardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AddCardController>(
      init: AddCardController(),
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
                                color: const Color(0xFFE5E7EB), width: 1.w),
                          ),
                          alignment: Alignment.center,
                          child: Icon(Icons.arrow_back,
                              size: 20.r, color: ColorConst.textBlackColor),
                        ),
                      ),
                      Expanded(
                        child: Center(
                          child: Text('Add Card',
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
                    padding: EdgeInsets.symmetric(horizontal: 20.w),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Card Preview
                        CustomCardPreview(controller: controller),
                        SizedBox(height: 28.h),

                        // Form Fields
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
                          hint: '4716 9627 1635 8047',
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
                                hint: '02/30',
                                keyboardType: TextInputType.datetime,
                                onChanged: (_) => controller.update(),
                              ),
                            ),
                            SizedBox(width: 16.w),
                            Expanded(
                              child: CustomCardFormField(
                                label: 'CVV',
                                controller: controller.cvvController,
                                hint: '000',
                                keyboardType: TextInputType.number,
                                obscure: true,
                                onChanged: (_) => controller.update(),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 16.h),

                        // Save Card checkbox
                        Row(
                          children: [
                            Checkbox(
                              value: controller.saveCard,
                              onChanged: controller.toggleSaveCard,
                              activeColor: ColorConst.primaryColor,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(4.r)),
                            ),
                            Text('Save Card',
                                style: TextStyle(
                                    fontSize: 14.sp,
                                    color: ColorConst.textBlackColor)),
                          ],
                        ),
                        SizedBox(height: 24.h),
                      ],
                    ),
                  ),
                ),

                // Bottom Bar
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
                      onPressed:
                          controller.isLoading ? null : controller.addCard,
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
                          : Text('Add Card',
                              style: TextStyle(
                                  fontSize: 15.sp,
                                  fontWeight: FontWeight.bold)),
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
