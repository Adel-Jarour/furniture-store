import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../controller/payment_controller.dart';
import 'widget/custom_payment_cash_section.dart';
import 'widget/custom_payment_confirm_bar.dart';
import 'widget/custom_payment_credit_card_section.dart';
import 'widget/custom_payment_more_options.dart';
import 'widget/custom_payment_top_bar.dart';

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
                const CustomPaymentTopBar(),
                Expanded(
                  child: SingleChildScrollView(
                    padding:
                        EdgeInsets.symmetric(horizontal: 20.w, vertical: 8.h),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomPaymentCashSection(controller: controller),
                        SizedBox(height: 24.h),
                        CustomPaymentCreditCardSection(controller: controller),
                        SizedBox(height: 24.h),
                        CustomPaymentMoreOptions(controller: controller),
                        SizedBox(height: 16.h),
                      ],
                    ),
                  ),
                ),
                CustomPaymentConfirmBar(controller: controller),
              ],
            ),
          ),
        );
      },
    );
  }
}
