import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../const/color_const.dart';
import '../../../../models/address_model.dart';

class CustomShippingAddressTile extends StatelessWidget {
  final AddressModel address;
  final bool isSelected;
  final VoidCallback onSelect;

  const CustomShippingAddressTile({
    super.key,
    required this.address,
    required this.isSelected,
    required this.onSelect,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: onSelect,
          behavior: HitTestBehavior.opaque,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 14.h),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(top: 2.h),
                  child: Icon(
                    Icons.location_on_outlined,
                    size: 22.r,
                    color: ColorConst.textBlackColor,
                  ),
                ),
                SizedBox(width: 14.w),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        address.label,
                        style: TextStyle(
                          fontSize: 15.sp,
                          fontWeight: FontWeight.bold,
                          color: ColorConst.textBlackColor,
                        ),
                      ),
                      SizedBox(height: 4.h),
                      Text(
                        address.fullAddress,
                        style: TextStyle(
                          fontSize: 13.sp,
                          color: ColorConst.textGreyColor,
                          height: 1.35,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(width: 12.w),
                Container(
                  width: 22.r,
                  height: 22.r,
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
                          width: 12.r,
                          height: 12.r,
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color: ColorConst.primaryColor,
                          ),
                        )
                      : null,
                ),
              ],
            ),
          ),
        ),
        Divider(
          height: 1.h,
          thickness: 0.8.h,
          color: const Color(0xFFF0F0F0),
          indent: 20.w,
          endIndent: 20.w,
        ),
      ],
    );
  }
}
