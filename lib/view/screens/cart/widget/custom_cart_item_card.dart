import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../const/color_const.dart';
import '../../../../controller/cart_controller.dart';
import '../../../../models/cart_item_model.dart';
import 'remove_from_cart_dialog.dart';

class CustomCartItemCard extends StatelessWidget {
  final CartItemModel item;
  final CartController controller;

  const CustomCartItemCard({
    super.key,
    required this.item,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 16.h),
      child: Dismissible(
        key: Key(item.id),
        direction: DismissDirection.endToStart,
        confirmDismiss: (direction) async {
          RemoveFromCartDialog.show(
            context,
            item,
            () => controller.removeItem(item.id),
          );
          return false;
        },
        background: Container(
          alignment: Alignment.centerRight,
          padding: EdgeInsets.only(right: 24.w),
          decoration: BoxDecoration(
            color: const Color(0xFFFFDCE0),
            borderRadius: BorderRadius.circular(16.r),
          ),
          child: Icon(
            Icons.delete_outline_rounded,
            color: const Color(0xFFEF4444),
            size: 28.r,
          ),
        ),
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 4.h),
          child: Row(
            children: [
              // Product thumbnail
              Container(
                width: 80.r,
                height: 80.r,
                decoration: BoxDecoration(
                  color: const Color(0xFFF3F4F6),
                  borderRadius: BorderRadius.circular(16.r),
                ),
                padding: EdgeInsets.all(8.r),
                child: Image.asset(
                  item.product.image,
                  fit: BoxFit.contain,
                ),
              ),
              SizedBox(width: 14.w),

              // Title and price
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
                    SizedBox(height: 6.h),
                    Text(
                      '\$${item.product.price.toStringAsFixed(item.product.price % 1 == 0 ? 0 : 2)}',
                      style: TextStyle(
                        fontSize: 15.sp,
                        fontWeight: FontWeight.bold,
                        color: ColorConst.textBlackColor,
                      ),
                    ),
                  ],
                ),
              ),

              // Quantity counter
              Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      if (item.quantity == 1) {
                        RemoveFromCartDialog.show(
                          context,
                          item,
                          () => controller.removeItem(item.id),
                        );
                      } else {
                        controller.decrementQuantity(item.id);
                      }
                    },
                    child: Container(
                      width: 28.r,
                      height: 28.r,
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
                  GestureDetector(
                    onTap: () => controller.incrementQuantity(item.id),
                    child: Container(
                      width: 28.r,
                      height: 28.r,
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
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
