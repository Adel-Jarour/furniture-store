import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../const/color_const.dart';
import '../../../../models/contact_channel_model.dart';

class CustomContactAccordionItem extends StatelessWidget {
  final ContactChannelModel channel;
  final VoidCallback onTap;

  const CustomContactAccordionItem({
    super.key,
    required this.channel,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14.r),
        border: Border.all(
          color: const Color(0xFFE5E7EB),
          width: 1.w,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          InkWell(
            onTap: onTap,
            borderRadius: BorderRadius.circular(14.r),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
              child: Row(
                children: [
                  Icon(
                    channel.icon,
                    size: 22.r,
                    color: ColorConst.primaryColor,
                  ),
                  SizedBox(width: 14.w),
                  Expanded(
                    child: Text(
                      channel.title,
                      style: TextStyle(
                        fontSize: 15.sp,
                        fontWeight: FontWeight.w600,
                        color: ColorConst.textBlackColor,
                      ),
                    ),
                  ),
                  Icon(
                    channel.isExpanded
                        ? Icons.keyboard_arrow_up_rounded
                        : Icons.keyboard_arrow_down_rounded,
                    size: 22.r,
                    color: ColorConst.textBlackColor,
                  ),
                ],
              ),
            ),
          ),
          if (channel.isExpanded && channel.subtitle != null) ...[
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: const Divider(height: 1, color: Color(0xFFE5E7EB)),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 14.h),
              child: Row(
                children: [
                  Container(
                    width: 6.r,
                    height: 6.r,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: ColorConst.primaryColor,
                    ),
                  ),
                  SizedBox(width: 10.w),
                  Expanded(
                    child: Text(
                      channel.subtitle!,
                      style: TextStyle(
                        fontSize: 14.sp,
                        color: ColorConst.textGreyColor,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ],
      ),
    );
  }
}
