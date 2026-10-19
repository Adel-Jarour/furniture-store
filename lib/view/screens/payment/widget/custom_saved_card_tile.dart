import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../const/color_const.dart';
import '../../../../models/payment_card_model.dart';

class CustomSavedCardTile extends StatelessWidget {
  final PaymentCardModel card;
  final bool isSelected;
  final VoidCallback onTap;

  const CustomSavedCardTile({
    super.key,
    required this.card,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final isMastercard = card.cardType.toLowerCase().contains('master');
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 14.h),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(14.r),
          border: Border.all(
            color:
                isSelected ? ColorConst.primaryColor : const Color(0xFFE5E7EB),
            width: isSelected ? 1.5.w : 1.w,
          ),
        ),
        child: Row(
          children: [
            Container(
              width: 40.r,
              height: 28.r,
              decoration: BoxDecoration(
                color: const Color(0xFFF9FAFB),
                borderRadius: BorderRadius.circular(6.r),
                border: Border.all(color: const Color(0xFFE5E7EB)),
              ),
              alignment: Alignment.center,
              child: Icon(
                isMastercard ? Icons.credit_card : Icons.payment,
                size: 20.r,
                color: isMastercard
                    ? const Color(0xFFEB001B)
                    : const Color(0xFF1A1F71),
              ),
            ),
            SizedBox(width: 14.w),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    isMastercard ? 'Mastercard' : 'Visa',
                    style: TextStyle(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.bold,
                      color: ColorConst.textBlackColor,
                    ),
                  ),
                  SizedBox(height: 2.h),
                  Text(
                    '•••• •••• •••• ${card.cardNumber.length >= 4 ? card.cardNumber.substring(card.cardNumber.length - 4) : '0000'}',
                    style: TextStyle(
                      fontSize: 12.sp,
                      color: ColorConst.textGreyColor,
                    ),
                  ),
                ],
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
