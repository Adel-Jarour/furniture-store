import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../const/color_const.dart';
import '../../../controller/category_controller.dart';
import '../../../routes/app_routes.dart';
import 'widget/custom_category_grid_item.dart';

class CategoryScreen extends StatelessWidget {
  const CategoryScreen({super.key});

  IconData _getIcon(String id) {
    switch (id) {
      case 'cat_sofa':
        return Icons.weekend_rounded;
      case 'cat_chair':
        return Icons.chair_rounded;
      case 'cat_lamp':
        return Icons.light_rounded;
      case 'cat_cupboard':
        return Icons.kitchen_rounded;
      case 'cat_table':
        return Icons.table_restaurant_rounded;
      case 'cat_bed':
        return Icons.bed_rounded;
      case 'cat_bookcases':
        return Icons.menu_book_rounded;
      case 'cat_office_chair':
        return Icons.chair_alt_rounded;
      case 'cat_desk_table':
        return Icons.desk_rounded;
      case 'cat_dining_table':
        return Icons.table_bar_rounded;
      case 'cat_dresser':
        return Icons.meeting_room_rounded;
      case 'cat_rocking_chair':
        return Icons.airline_seat_recline_extra_rounded;
      case 'cat_swing_zula':
        return Icons.nest_cam_wired_stand_rounded;
      case 'cat_vase':
        return Icons.yard_rounded;
      case 'cat_mattress':
        return Icons.aspect_ratio_rounded;
      case 'cat_tv_table':
        return Icons.tv_rounded;
      case 'cat_drawer':
        return Icons.inventory_2_rounded;
      case 'cat_wall_mirror':
        return Icons.circle_outlined;
      case 'cat_stool':
        return Icons.event_seat_rounded;
      case 'cat_other':
        return Icons.widgets_rounded;
      default:
        return Icons.chair_outlined;
    }
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CategoryController>(
      init: CategoryController(),
      builder: (controller) {
        return Scaffold(
          backgroundColor: Colors.white,
          body: SafeArea(
            child: SingleChildScrollView(
              padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 16.h),
              child: Column(
                children: [
                  // Top Header Bar
                  Row(
                    children: [
                      GestureDetector(
                        onTap: () => Get.back(),
                        child: Container(
                          width: 44.r,
                          height: 44.r,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.white,
                            border: Border.all(
                                color: const Color(0xFFE5E7EB), width: 1.w),
                          ),
                          alignment: Alignment.center,
                          child: Icon(Icons.arrow_back,
                              size: 20.r, color: ColorConst.textBlackColor),
                        ),
                      ),
                      Expanded(
                        child: Center(
                          child: Text(
                            'Category',
                            style: TextStyle(
                              fontSize: 18.sp,
                              fontWeight: FontWeight.bold,
                              color: ColorConst.textBlackColor,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(width: 44.r),
                    ],
                  ),
                  SizedBox(height: 24.h),

                  // 4-Column Categories Grid
                  GridView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: controller.categories.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 4,
                      crossAxisSpacing: 14.w,
                      mainAxisSpacing: 20.h,
                      childAspectRatio: 0.72,
                    ),
                    itemBuilder: (context, index) {
                      final item = controller.categories[index];
                      return CustomCategoryGridItem(
                        item: item,
                        icon: _getIcon(item.id),
                        onTap: () => Get.toNamed(AppRoutes.filter),
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
