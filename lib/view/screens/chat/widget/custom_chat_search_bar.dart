import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../const/color_const.dart';

class CustomChatSearchBar extends StatelessWidget {
  final ValueChanged<String> onChanged;

  const CustomChatSearchBar({super.key, required this.onChanged});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 48.h,
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14.r),
      ),
      child: Row(
        children: [
          Icon(Icons.search_rounded,
              color: ColorConst.textGreyColor, size: 22.r),
          SizedBox(width: 10.w),
          Expanded(
            child: TextField(
              onChanged: onChanged,
              style:
                  TextStyle(fontSize: 14.sp, color: ColorConst.textBlackColor),
              decoration: InputDecoration(
                hintText: 'Search shop owner',
                hintStyle:
                    TextStyle(fontSize: 13.sp, color: ColorConst.textGreyColor),
                border: InputBorder.none,
                isDense: true,
                contentPadding: EdgeInsets.zero,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
