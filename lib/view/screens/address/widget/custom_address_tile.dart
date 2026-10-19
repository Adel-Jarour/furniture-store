import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../const/color_const.dart';
import '../../../../models/address_model.dart';

class CustomAddressTile extends StatelessWidget {
  final AddressModel address;
  final bool isSelected;
  final VoidCallback onTap;

  const CustomAddressTile(
      {super.key,
      required this.address,
      required this.isSelected,
      required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      behavior: HitTestBehavior.opaque,
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 14.h),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(Icons.location_on_outlined,
                size: 22.r,
                color: isSelected
                    ? ColorConst.primaryColor
                    : ColorConst.textGreyColor),
            SizedBox(width: 14.w),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(address.label,
                      style: TextStyle(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.bold,
                          color: ColorConst.textBlackColor)),
                  SizedBox(height: 4.h),
                  Text(address.fullAddress,
                      style: TextStyle(
                          fontSize: 13.sp, color: ColorConst.textGreyColor)),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
