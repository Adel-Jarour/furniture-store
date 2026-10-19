import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../const/color_const.dart';
import '../../../../models/product_model.dart';

class CustomProductCard extends StatelessWidget {
  final ProductModel product;
  final VoidCallback? onFavoriteTap;
  final VoidCallback? onTap;

  const CustomProductCard({
    super.key,
    required this.product,
    this.onFavoriteTap,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // ── Product Image Container ────────────────────────
          Container(
            height: 120.h,
            width: double.infinity,
            decoration: BoxDecoration(
              color: const Color(0xFFF3F4F6),
              borderRadius: BorderRadius.circular(14.r),
            ),
            child: Stack(
              children: [
                // Chair image
                Center(
                  child: Padding(
                    padding: EdgeInsets.all(8.r),
                    child: Image.asset(
                      product.image,
                      fit: BoxFit.contain,
                    ),
                  ),
                ),

                // Wishlist Heart Button (top-right)
                Positioned(
                  top: 8.r,
                  right: 8.r,
                  child: GestureDetector(
                    onTap: onFavoriteTap,
                    child: Container(
                      width: 30.r,
                      height: 30.r,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.circle,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withValues(alpha: 0.06),
                            blurRadius: 4,
                            offset: const Offset(0, 2),
                          ),
                        ],
                      ),
                      alignment: Alignment.center,
                      child: Icon(
                        product.isFavorite
                            ? Icons.favorite_rounded
                            : Icons.favorite_border_rounded,
                        color: ColorConst.primaryColor,
                        size: 17.r,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 8.h),

          // ── Title & Rating Row ─────────────────────────────
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Text(
                  product.title,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w600,
                    color: ColorConst.textBlackColor,
                  ),
                ),
              ),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
                    Icons.star_rounded,
                    size: 16.r,
                    color: const Color(0xFFF59E0B),
                  ),
                  SizedBox(width: 3.w),
                  Text(
                    product.rating.toStringAsFixed(1),
                    style: TextStyle(
                      fontSize: 12.sp,
                      color: ColorConst.textGreyColor,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ],
          ),
          SizedBox(height: 4.h),

          // ── Price ──────────────────────────────────────────
          Text(
            '\$${product.price.toStringAsFixed(2)}',
            style: TextStyle(
              fontSize: 15.sp,
              fontWeight: FontWeight.bold,
              color: ColorConst.textBlackColor,
            ),
          ),
        ],
      ),
    );
  }
}
