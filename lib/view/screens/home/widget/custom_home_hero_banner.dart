import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../const/color_const.dart';
import '../../../../const/image_const.dart';
import '../../../../models/banner_model.dart';

class CustomHomeHeroBanner extends StatelessWidget {
  final List<BannerModel> banners;
  final int activeIndex;
  final ValueChanged<int>? onPageChanged;
  final VoidCallback? onShopNowTap;

  const CustomHomeHeroBanner({
    super.key,
    required this.banners,
    this.activeIndex = 2,
    this.onPageChanged,
    this.onShopNowTap,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Banner Card Container
        Container(
          width: double.infinity,
          height: 140.h,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16.r),
            color: const Color(0xFFF6F8F7),
          ),
          clipBehavior: Clip.antiAlias,
          child: Stack(
            fit: StackFit.expand,
            children: [
              Image.asset(
                ImageConst.bannerNewCollection,
                fit: BoxFit.cover,
              ),
              // Invisible tap layer for Shop Now button area
              Positioned(
                left: 20.w,
                bottom: 16.h,
                child: GestureDetector(
                  onTap: onShopNowTap,
                  child: Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: 16.w,
                      vertical: 8.h,
                    ),
                    decoration: BoxDecoration(
                      color: ColorConst.primaryColor,
                      borderRadius: BorderRadius.circular(16.r),
                    ),
                    child: Text(
                      'Shop Now',
                      style: TextStyle(
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: 10.h),

        // 5-dot Carousel Page Indicator (middle dot active teal)
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(
            5,
            (index) {
              final isActive = index == activeIndex;
              return Container(
                margin: EdgeInsets.symmetric(horizontal: 3.w),
                width: isActive ? 14.w : 6.w,
                height: 6.h,
                decoration: BoxDecoration(
                  color: isActive
                      ? ColorConst.primaryColor
                      : const Color(0xFFE0E0E0),
                  borderRadius: BorderRadius.circular(3.r),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
