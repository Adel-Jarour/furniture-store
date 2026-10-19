import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../const/color_const.dart';

class CustomPaymentOptionTile extends StatelessWidget {
  final IconData icon;
  final String label;
  final bool isSelected;
  final VoidCallback onTap;
  final Widget? trailing;

  const CustomPaymentOptionTile({
    super.key,
    required this.icon,
    required this.label,
    required this.isSelected,
    required this.onTap,
    this.trailing,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
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
            Icon(icon, size: 22.r, color: ColorConst.textBlackColor),
            SizedBox(width: 14.w),
            Expanded(
                child: Text(label,
                    style: TextStyle(
                        fontSize: 14.sp, color: ColorConst.textBlackColor))),
            trailing ??
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
