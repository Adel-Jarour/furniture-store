import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../const/color_const.dart';
import '../../../../controller/orders_controller.dart';

class CustomOrdersTabBar extends StatelessWidget {
  final OrdersController controller;

  const CustomOrdersTabBar({
    super.key,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        border: Border(
          bottom: BorderSide(color: Color(0xFFE5E7EB), width: 1),
        ),
      ),
      child: Row(
        children: [
          _buildTab('Active', 0),
          _buildTab('Completed', 1),
          _buildTab('Cancelled', 2),
        ],
      ),
    );
  }

  Widget _buildTab(String title, int index) {
    final isSelected = controller.selectedTabIndex == index;
    return Expanded(
      child: GestureDetector(
        onTap: () => controller.changeTab(index),
        behavior: HitTestBehavior.opaque,
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 14.h),
          decoration: BoxDecoration(
            border: Border(
              bottom: BorderSide(
                color:
                    isSelected ? ColorConst.primaryColor : Colors.transparent,
                width: 2.5,
              ),
            ),
          ),
          alignment: Alignment.center,
          child: Text(
            title,
            style: TextStyle(
              fontSize: 15.sp,
              fontWeight: isSelected ? FontWeight.bold : FontWeight.w500,
              color: isSelected
                  ? ColorConst.primaryColor
                  : ColorConst.textGreyColor,
            ),
          ),
        ),
      ),
    );
  }
}
