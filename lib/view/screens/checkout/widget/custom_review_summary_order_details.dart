import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../const/color_const.dart';
import '../../../../models/review_summary_model.dart';

class CustomReviewSummaryOrderDetails extends StatelessWidget {
  final ReviewSummaryModel summary;

  const CustomReviewSummaryOrderDetails({super.key, required this.summary});

  Widget _buildRow(String label, String value,
      {bool isBold = false, Color? valueColor}) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 6.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: TextStyle(
              fontSize: 14.sp,
              color:
                  isBold ? ColorConst.textBlackColor : ColorConst.textGreyColor,
              fontWeight: isBold ? FontWeight.bold : FontWeight.normal,
            ),
          ),
          Text(
            value,
            style: TextStyle(
              fontSize: 14.sp,
              fontWeight: isBold ? FontWeight.bold : FontWeight.w600,
              color: valueColor ?? ColorConst.textBlackColor,
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _buildRow('Order Date', summary.orderDate),
        _buildRow('Promo code', summary.promoCode),
        _buildRow('Delivery Type', summary.deliveryType),
        SizedBox(height: 12.h),
        Divider(
          height: 1.h,
          thickness: 0.8.h,
          color: const Color(0xFFF0F0F0),
        ),
        SizedBox(height: 12.h),
        _buildRow('Amount', '\$${summary.amount.toStringAsFixed(2)}'),
        _buildRow('Delivery Charge',
            '\$${summary.deliveryCharge.toStringAsFixed(2)}'),
        _buildRow('Tax', '\$${summary.tax.toStringAsFixed(2)}'),
        _buildRow(
          'Discount',
          '\$${summary.discount.toStringAsFixed(2)}',
          valueColor: ColorConst.primaryColor,
        ),
        SizedBox(height: 12.h),
        // Dashed Divider Line
        LayoutBuilder(
          builder: (context, constraints) {
            final boxWidth = constraints.constrainWidth();
            const dashWidth = 5.0;
            const dashHeight = 1.0;
            final dashCount = (boxWidth / (2 * dashWidth)).floor();
            return Flex(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              direction: Axis.horizontal,
              children: List.generate(dashCount, (_) {
                return SizedBox(
                  width: dashWidth,
                  height: dashHeight,
                  child: const DecoratedBox(
                    decoration: BoxDecoration(color: Color(0xFFE5E7EB)),
                  ),
                );
              }),
            );
          },
        ),
        SizedBox(height: 12.h),
        _buildRow(
          'Total',
          '\$${summary.total.toStringAsFixed(summary.total.truncateToDouble() == summary.total ? 0 : 2)}',
          isBold: true,
        ),
      ],
    );
  }
}
