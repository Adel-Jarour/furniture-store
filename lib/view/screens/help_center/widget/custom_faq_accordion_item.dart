import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../const/color_const.dart';
import '../../../../models/faq_model.dart';

class CustomFaqAccordionItem extends StatelessWidget {
  final FaqModel faq;
  final VoidCallback onTap;

  const CustomFaqAccordionItem({
    super.key,
    required this.faq,
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
                  Expanded(
                    child: Text(
                      faq.question,
                      style: TextStyle(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w600,
                        color: ColorConst.textBlackColor,
                      ),
                    ),
                  ),
                  SizedBox(width: 8.w),
                  Icon(
                    faq.isExpanded
                        ? Icons.keyboard_arrow_up_rounded
                        : Icons.keyboard_arrow_down_rounded,
                    size: 22.r,
                    color: ColorConst.textBlackColor,
                  ),
                ],
              ),
            ),
          ),
          if (faq.isExpanded) ...[
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: const Divider(height: 1, color: Color(0xFFE5E7EB)),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 14.h),
              child: Text(
                faq.answer,
                style: TextStyle(
                  fontSize: 13.sp,
                  height: 1.5,
                  color: ColorConst.textGreyColor,
                ),
              ),
            ),
          ],
        ],
      ),
    );
  }
}
