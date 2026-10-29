import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../const/color_const.dart';
import '../../../controller/auth_controller.dart';

class CompleteProfileScreen extends StatelessWidget {
  const CompleteProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AuthController>(
      init: AuthController(),
      builder: (controller) {
        return Scaffold(
          backgroundColor: Colors.white,
          body: SafeArea(
            child: SingleChildScrollView(
              padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 16.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // ── Back Button ────────────────────────────────────
                  Align(
                    alignment: Alignment.centerLeft,
                    child: GestureDetector(
                      onTap: () => Get.back(),
                      child: Container(
                        width: 44.r,
                        height: 44.r,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.white,
                          border: Border.all(
                            color: const Color(0xFFE5E7EB),
                            width: 1.w,
                          ),
                        ),
                        alignment: Alignment.center,
                        child: Icon(
                          Icons.arrow_back,
                          size: 20.r,
                          color: ColorConst.textBlackColor,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 16.h),

                  // ── Title & Subtitle ───────────────────────────────
                  Text(
                    'Complete Your Profile',
                    style: TextStyle(
                      fontSize: 24.sp,
                      fontWeight: FontWeight.bold,
                      color: ColorConst.textBlackColor,
                    ),
                  ),
                  SizedBox(height: 8.h),
                  Text(
                    'Don’t worry, only you can see your personal\ndata. No one else will be able to see it.',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 13.sp,
                      color: ColorConst.textGreyColor,
                      height: 1.4,
                    ),
                  ),
                  SizedBox(height: 28.h),

                  // ── Avatar Placeholder with Edit Pencil ────────────
                  Stack(
                    children: [
                      Container(
                        width: 104.r,
                        height: 104.r,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: Color(0xFFF3F4F6),
                        ),
                        alignment: Alignment.center,
                        child: Icon(
                          Icons.person_rounded,
                          size: 56.r,
                          color: ColorConst.primaryColor,
                        ),
                      ),
                      Positioned(
                        bottom: 0,
                        right: 0,
                        child: Container(
                          width: 28.r,
                          height: 28.r,
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color: ColorConst.primaryColor,
                          ),
                          alignment: Alignment.center,
                          child: Icon(
                            Icons.edit_outlined,
                            size: 15.r,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 32.h),

                  // ── Name Field ─────────────────────────────────────
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Name',
                      style: TextStyle(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w600,
                        color: ColorConst.textBlackColor,
                      ),
                    ),
                  ),
                  SizedBox(height: 8.h),
                  Container(
                    height: 52.h,
                    padding: EdgeInsets.symmetric(horizontal: 16.w),
                    decoration: BoxDecoration(
                      color: const Color(0xFFF7F8F9),
                      borderRadius: BorderRadius.circular(12.r),
                    ),
                    alignment: Alignment.centerLeft,
                    child: TextField(
                      controller: controller.profileNameController,
                      style: TextStyle(
                        fontSize: 14.sp,
                        color: ColorConst.textBlackColor,
                      ),
                      decoration: const InputDecoration(
                        hintText: 'John Doe',
                        hintStyle: TextStyle(
                          color: Color(0xFF9CA3AF),
                        ),
                        border: InputBorder.none,
                        isDense: true,
                        contentPadding: EdgeInsets.zero,
                      ),
                    ),
                  ),
                  SizedBox(height: 18.h),

                  // ── Phone Number Field ─────────────────────────────
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Phone Number',
                      style: TextStyle(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w600,
                        color: ColorConst.textBlackColor,
                      ),
                    ),
                  ),
                  SizedBox(height: 8.h),
                  Container(
                    height: 52.h,
                    padding: EdgeInsets.symmetric(horizontal: 16.w),
                    decoration: BoxDecoration(
                      color: const Color(0xFFF7F8F9),
                      borderRadius: BorderRadius.circular(12.r),
                    ),
                    child: Row(
                      children: [
                        // Country code prefix with dropdown
                        Row(
                          children: [
                            Text(
                              controller.selectedCountryCode,
                              style: TextStyle(
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w500,
                                color: ColorConst.textBlackColor,
                              ),
                            ),
                            SizedBox(width: 4.w),
                            Icon(
                              Icons.keyboard_arrow_down_rounded,
                              size: 18.r,
                              color: ColorConst.textBlackColor,
                            ),
                          ],
                        ),
                        SizedBox(width: 8.w),
                        Container(
                          width: 1.w,
                          height: 24.h,
                          color: const Color(0xFFE5E7EB),
                        ),
                        SizedBox(width: 12.w),
                        Expanded(
                          child: TextField(
                            controller: controller.profilePhoneController,
                            keyboardType: TextInputType.phone,
                            style: TextStyle(
                              fontSize: 14.sp,
                              color: ColorConst.textBlackColor,
                            ),
                            decoration: const InputDecoration(
                              hintText: 'Enter Phone Number',
                              hintStyle: TextStyle(
                                color: Color(0xFF9CA3AF),
                              ),
                              border: InputBorder.none,
                              isDense: true,
                              contentPadding: EdgeInsets.zero,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 18.h),

                  // ── Gender Field (Dropdown) ────────────────────────
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Gender',
                      style: TextStyle(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w600,
                        color: ColorConst.textBlackColor,
                      ),
                    ),
                  ),
                  SizedBox(height: 8.h),
                  Container(
                    height: 52.h,
                    padding: EdgeInsets.symmetric(horizontal: 16.w),
                    decoration: BoxDecoration(
                      color: const Color(0xFFF7F8F9),
                      borderRadius: BorderRadius.circular(12.r),
                    ),
                    child: DropdownButtonHideUnderline(
                      child: DropdownButton<String>(
                        value: controller.selectedGender,
                        isExpanded: true,
                        icon: Icon(
                          Icons.keyboard_arrow_down_rounded,
                          size: 20.r,
                          color: ColorConst.textBlackColor,
                        ),
                        items: controller.genderOptions.map((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(
                              value,
                              style: TextStyle(
                                fontSize: 14.sp,
                                color: value == 'Select'
                                    ? const Color(0xFF9CA3AF)
                                    : ColorConst.textBlackColor,
                              ),
                            ),
                          );
                        }).toList(),
                        onChanged: (String? newValue) {
                          if (newValue != null) {
                            controller.setGender(newValue);
                          }
                        },
                      ),
                    ),
                  ),
                  SizedBox(height: 36.h),

                  // ── Complete Profile Button ────────────────────────
                  SizedBox(
                    width: double.infinity,
                    height: 52.h,
                    child: ElevatedButton(
                      onPressed: controller.isLoading
                          ? null
                          : controller.completeProfile,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: ColorConst.primaryColor,
                        foregroundColor: Colors.white,
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(28.r),
                        ),
                      ),
                      child: controller.isLoading
                          ? SizedBox(
                              width: 22.r,
                              height: 22.r,
                              child: const CircularProgressIndicator(
                                color: Colors.white,
                                strokeWidth: 2,
                              ),
                            )
                          : Text(
                              'Complete Profile',
                              style: TextStyle(
                                fontSize: 16.sp,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                    ),
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
