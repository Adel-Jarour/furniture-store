import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../../const/color_const.dart';
import '../../../../models/cart_item_model.dart';

class RemoveFromCartDialog extends StatelessWidget {
  final CartItemModel item;
  final VoidCallback onConfirmRemove;

  const RemoveFromCartDialog({
    super.key,
    required this.item,
    required this.onConfirmRemove,
  });

  static void show(
      BuildContext context, CartItemModel item, VoidCallback onConfirm) {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      isScrollControlled: true,
      builder: (_) => RemoveFromCartDialog(
        item: item,
        onConfirmRemove: onConfirm,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(24.r)),
      ),
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
      child: SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Handle bar
            Container(
              width: 40.w,
              height: 4.h,
              decoration: BoxDecoration(
                color: const Color(0xFFE5E7EB),
                borderRadius: BorderRadius.circular(2.r),
              ),
            ),
            SizedBox(height: 16.h),

            // Title
            Text(
              'Remove from Cart?',
              style: TextStyle(
                fontSize: 18.sp,
                fontWeight: FontWeight.bold,
                color: ColorConst.textBlackColor,
              ),
            ),
            SizedBox(height: 16.h),

            const Divider(color: Color(0xFFF3F4F6), height: 1),
            SizedBox(height: 16.h),

            // Item preview card
            Container(
              padding: EdgeInsets.all(12.r),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16.r),
                border: Border.all(color: const Color(0xFFF3F4F6)),
              ),
              child: Row(
                children: [
                  // Image
                  Container(
                    width: 70.r,
                    height: 70.r,
                    decoration: BoxDecoration(
                      color: const Color(0xFFF3F4F6),
                      borderRadius: BorderRadius.circular(12.r),
                    ),
                    padding: EdgeInsets.all(6.r),
                    child: Image.asset(
                      item.product.image,
                      fit: BoxFit.contain,
                    ),
                  ),
                  SizedBox(width: 14.w),

                  // Info
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          item.product.title,
                          style: TextStyle(
                            fontSize: 16.sp,
                            fontWeight: FontWeight.bold,
                            color: ColorConst.textBlackColor,
                          ),
                        ),
                        SizedBox(height: 4.h),
                        Text(
                          item.product.category,
                          style: TextStyle(
                            fontSize: 13.sp,
                            color: ColorConst.textGreyColor,
                          ),
                        ),
                        SizedBox(height: 8.h),
                        Text(
                          '\$${item.product.price.toStringAsFixed(2)}',
                          style: TextStyle(
                            fontSize: 15.sp,
                            fontWeight: FontWeight.bold,
                            color: ColorConst.textBlackColor,
                          ),
                        ),
                      ],
                    ),
                  ),

                  // Quantity pill
                  Row(
                    children: [
                      Container(
                        width: 26.r,
                        height: 26.r,
                        decoration: BoxDecoration(
                          color: const Color(0xFFF3F4F6),
                          borderRadius: BorderRadius.circular(6.r),
                        ),
                        child: Icon(
                          Icons.remove,
                          size: 14.r,
                          color: ColorConst.textBlackColor,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 10.w),
                        child: Text(
                          '${item.quantity}',
                          style: TextStyle(
                            fontSize: 14.sp,
                            fontWeight: FontWeight.bold,
                            color: ColorConst.textBlackColor,
                          ),
                        ),
                      ),
                      Container(
                        width: 26.r,
                        height: 26.r,
                        decoration: BoxDecoration(
                          color: ColorConst.primaryColor,
                          borderRadius: BorderRadius.circular(6.r),
                        ),
                        child: Icon(
                          Icons.add,
                          size: 14.r,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: 24.h),

            // Action buttons
            Row(
              children: [
                Expanded(
                  child: SizedBox(
                    height: 50.h,
                    child: ElevatedButton(
                      onPressed: () => Get.back(),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFFF3F4F6),
                        foregroundColor: ColorConst.primaryColor,
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(26.r),
                        ),
                      ),
                      child: Text(
                        'Cancel',
                        style: TextStyle(
                          fontSize: 15.sp,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 14.w),
                Expanded(
                  child: SizedBox(
                    height: 50.h,
                    child: ElevatedButton(
                      onPressed: () {
                        Get.back();
                        onConfirmRemove();
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: ColorConst.primaryColor,
                        foregroundColor: Colors.white,
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(26.r),
                        ),
                      ),
                      child: Text(
                        'Yes, Remove',
                        style: TextStyle(
                          fontSize: 15.sp,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 10.h),
          ],
        ),
      ),
    );
  }
}
