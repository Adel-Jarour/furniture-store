import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../const/color_const.dart';
import '../../../controller/payment_controller.dart';
import '../../../routes/app_routes.dart';
import 'widget/custom_add_card_button.dart';
import 'widget/custom_payment_top_bar.dart';
import 'widget/custom_saved_card_tile.dart';

class ManagePaymentMethodsScreen extends StatelessWidget {
  const ManagePaymentMethodsScreen({super.key});

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
                const CustomPaymentTopBar(title: 'Payment Methods'),
                Expanded(
                  child: SingleChildScrollView(
                    padding:
                        EdgeInsets.symmetric(horizontal: 20.w, vertical: 8.h),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Credit & Debit Card',
                          style: TextStyle(
                            fontSize: 15.sp,
                            fontWeight: FontWeight.bold,
                            color: ColorConst.textBlackColor,
                          ),
                        ),
                        SizedBox(height: 12.h),
                        if (controller.isLoading)
                          const Center(child: CircularProgressIndicator())
                        else
                          ListView.separated(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount: controller.savedCards.length,
                            separatorBuilder: (context, index) =>
                                SizedBox(height: 12.h),
                            itemBuilder: (context, index) {
                              final card = controller.savedCards[index];
                              return CustomSavedCardTile(
                                card: card,
                                isSelected:
                                    controller.selectedDefaultCardId == card.id,
                                onTap: () =>
                                    controller.selectDefaultCard(card.id),
                              );
                            },
                          ),
                      ],
                    ),
                  ),
                ),
                CustomAddCardButton(
                  onTap: () async {
                    final res = await Get.toNamed(AppRoutes.addCard);
                    if (res == true) {
                      controller.fetchCards();
                    }
                  },
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
