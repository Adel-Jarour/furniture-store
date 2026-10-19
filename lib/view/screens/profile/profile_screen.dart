import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../const/color_const.dart';
import '../../../controller/profile_controller.dart';
import 'widget/custom_profile_avatar.dart';
import 'widget/custom_profile_menu_item.dart';

class ProfileScreen extends StatelessWidget {
  final bool showBackButton;

  const ProfileScreen({super.key, this.showBackButton = false});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProfileController>(
      init: ProfileController(),
      builder: (controller) {
        return Scaffold(
          backgroundColor: Colors.white,
          body: SafeArea(
            bottom: false,
            child: SingleChildScrollView(
              padding: EdgeInsets.symmetric(horizontal: 20.w).copyWith(
                top: 10.h,
                bottom: 110.h,
              ),
              child: Column(
                children: [
                  // Top Bar
                  if (showBackButton)
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
                              'Profile',
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
                    )
                  else
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 8.h),
                      child: Center(
                        child: Text(
                          'Profile',
                          style: TextStyle(
                            fontSize: 18.sp,
                            fontWeight: FontWeight.bold,
                            color: ColorConst.textBlackColor,
                          ),
                        ),
                      ),
                    ),
                  SizedBox(height: 16.h),

                  // Avatar with Edit Badge and User Name
                  CustomProfileAvatar(
                    avatarImage: controller.avatarImage,
                    userName: controller.userName,
                  ),
                  SizedBox(height: 24.h),

                  // Menu List
                  ListView.separated(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: controller.menuItems.length,
                    separatorBuilder: (context, index) =>
                        Divider(height: 22.h, color: const Color(0xFFF3F4F6)),
                    itemBuilder: (context, index) {
                      return CustomProfileMenuItem(
                          item: controller.menuItems[index]);
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
