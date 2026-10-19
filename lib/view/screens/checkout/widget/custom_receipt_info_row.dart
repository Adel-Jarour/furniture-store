import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../const/color_const.dart';

class CustomReceiptInfoRow extends StatelessWidget {
  final String label;
  final String value;
  final bool isBold;
  final Widget? trailing;

  const CustomReceiptInfoRow({
    super.key,
    required this.label,
    required this.value,
    this.isBold = false,
    this.trailing,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: TextStyle(
            fontSize: isBold ? 15.sp : 14.sp,
            fontWeight: isBold ? FontWeight.bold : FontWeight.w400,
            color:
                isBold ? ColorConst.textBlackColor : ColorConst.textGreyColor,
          ),
        ),
        if (trailing != null)
          trailing!
        else
          Text(
            value,
            style: TextStyle(
              fontSize: isBold ? 16.sp : 14.sp,
              fontWeight: isBold ? FontWeight.bold : FontWeight.bold,
              color: ColorConst.textBlackColor,
            ),
          ),
      ],
    );
  }
}
