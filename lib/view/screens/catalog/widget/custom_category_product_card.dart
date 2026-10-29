import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../const/color_const.dart';
import '../../../../models/product_model.dart';

class CustomCategoryProductCard extends StatelessWidget {
  final ProductModel product;
  final VoidCallback onToggleFavorite;
  final VoidCallback onTap;

  const CustomCategoryProductCard({
    super.key,
    required this.product,
    required this.onToggleFavorite,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      behavior: HitTestBehavior.opaque,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Product Image Card Container
          Expanded(
            child: Stack(
              children: [
                Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: const Color(0xFFF7F8F9),
                    borderRadius: BorderRadius.circular(16.r),
                  ),
                  alignment: Alignment.center,
                  padding: EdgeInsets.all(16.r),
                  child: Image.asset(
                    product.image,
                    fit: BoxFit.contain,
                    errorBuilder: (_, __, ___) => Icon(
                      Icons.chair_rounded,
                      size: 64.r,
                      color: Colors.grey.shade400,
                    ),
                  ),
                ),
                // Favorite Heart Button in top-right
                Positioned(
                  top: 10.h,
                  right: 10.w,
                  child: GestureDetector(
                    onTap: onToggleFavorite,
                    child: Container(
                      width: 32.r,
                      height: 32.r,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: product.isFavorite
                            ? ColorConst.primaryColor
                            : Colors.white,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withValues(alpha: 0.06),
                            blurRadius: 6,
                            offset: const Offset(0, 2),
                          ),
                        ],
                      ),
                      alignment: Alignment.center,
                      child: Icon(
                        product.isFavorite
                            ? Icons.favorite
                            : Icons.favorite_border_rounded,
                        size: 16.r,
                        color: product.isFavorite
                            ? Colors.white
                            : ColorConst.textBlackColor,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 8.h),

          // Title & Rating
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Text(
                  product.title,
                  style: TextStyle(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w600,
                    color: ColorConst.textBlackColor,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              Row(
                children: [
                  Icon(
                    Icons.star_rounded,
                    size: 16.r,
                    color: const Color(0xFFFFA41C),
                  ),
                  SizedBox(width: 4.w),
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

          // Price
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
