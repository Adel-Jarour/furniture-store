import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../const/color_const.dart';
import '../../../controller/payment_controller.dart';
import '../../../routes/app_routes.dart';
import 'widget/custom_payment_option_tile.dart';
import 'widget/custom_payment_confirm_bar.dart';

class PaymentMethodsScreen extends StatelessWidget {
  const PaymentMethodsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<PaymentController>(
      init: PaymentController(),
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

                // Body
                Expanded(
                  child: SingleChildScrollView(
                    padding:
                        EdgeInsets.symmetric(horizontal: 20.w, vertical: 8.h),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Cash section
                        Text('Cash',
                            style: TextStyle(
                                fontSize: 15.sp,
                                fontWeight: FontWeight.bold,
                                color: ColorConst.textBlackColor)),
                        SizedBox(height: 10.h),
                        CustomPaymentOptionTile(
                          icon: Icons.money_outlined,
                          label: 'Cash',
                          isSelected:
                              controller.selectedOption == PaymentOption.cash,
                          onTap: () =>
                              controller.selectOption(PaymentOption.cash),
                          trailing: null,
                        ),
                        SizedBox(height: 24.h),

                        // Credit & Debit Card
                        Text('Credit & Debit Card',
                            style: TextStyle(
                                fontSize: 15.sp,
                                fontWeight: FontWeight.bold,
                                color: ColorConst.textBlackColor)),
                        SizedBox(height: 10.h),
                        CustomPaymentOptionTile(
                          icon: Icons.credit_card_rounded,
                          label: 'Add Card',
                          isSelected:
                              controller.selectedOption == PaymentOption.card,
                          onTap: () => Get.toNamed(AppRoutes.addCard),
                          trailing: Icon(Icons.chevron_right_rounded,
                              size: 20.r, color: ColorConst.textGreyColor),
                        ),
                        SizedBox(height: 24.h),

                        // More options
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
                              _buildMoreOption('Paypal', Icons.paypal,
                                  PaymentOption.paypal, controller),
                              Divider(
                                  height: 1.h, color: const Color(0xFFE5E7EB)),
                              _buildMoreOption('Apple Pay', Icons.apple,
                                  PaymentOption.applePay, controller),
                              Divider(
                                  height: 1.h, color: const Color(0xFFE5E7EB)),
                              _buildMoreOption(
                                  'Google Pay',
                                  Icons.g_mobiledata_rounded,
                                  PaymentOption.googlePay,
                                  controller),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

                // Bottom Bar
                CustomPaymentConfirmBar(controller: controller),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildMoreOption(String label, IconData icon, PaymentOption option,
      PaymentController controller) {
    final isSelected = controller.selectedOption == option;
    return GestureDetector(
      onTap: () => controller.selectOption(option),
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
            Container(
              width: 20.r,
              height: 20.r,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: isSelected
                      ? ColorConst.primaryColor
                      : const Color(0xFF9CA3AF),
                  width: isSelected ? 5.r : 1.5.r,
                ),
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
