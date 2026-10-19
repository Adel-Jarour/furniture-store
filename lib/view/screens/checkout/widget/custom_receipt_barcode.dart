import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomReceiptBarcode extends StatelessWidget {
  const CustomReceiptBarcode({super.key});

  @override
  Widget build(BuildContext context) {
    // Sharp vector barcode generator using varied bar widths
    final barPattern = [
      4,
      2,
      6,
      2,
      8,
      3,
      4,
      2,
      6,
      4,
      2,
      5,
      8,
      2,
      4,
      3,
      7,
      2,
      5,
      4,
      8,
      3,
      2,
      6,
      4,
      3,
      7,
      2,
      4,
      3,
      8,
      2,
      5,
      3,
      6,
      2,
      7,
      4,
      3,
      2,
      8,
      4,
      5,
      2,
      6,
      3,
      4,
      2,
      8,
      3
    ];

    return Container(
      width: double.infinity,
      height: 64.h,
      alignment: Alignment.center,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: barPattern.map((width) {
          final isBar = width % 2 == 0;
          return Container(
            width: width.toDouble() * 0.7,
            height: 60.h,
            color: isBar ? Colors.black : Colors.transparent,
            margin: EdgeInsets.symmetric(horizontal: 0.8.w),
          );
        }).toList(),
      ),
    );
  }
}
