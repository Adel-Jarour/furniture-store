import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../const/color_const.dart';
import '../../../controller/password_manager_controller.dart';
import 'widget/custom_change_password_button.dart';
import 'widget/custom_password_field.dart';
import 'widget/custom_password_manager_top_bar.dart';

class PasswordManagerScreen extends StatelessWidget {
  const PasswordManagerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<PasswordManagerController>(
      init: PasswordManagerController(),
      builder: (controller) {
        return Scaffold(
          backgroundColor: Colors.white,
          body: SafeArea(
            child: Column(
              children: [
                const CustomPasswordManagerTopBar(),
                Expanded(
                  child: SingleChildScrollView(
                    padding:
                        EdgeInsets.symmetric(horizontal: 20.w, vertical: 16.h),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomPasswordField(
                          label: 'Current Password',
                          controller: controller.currentPasswordController,
                          obscureText: controller.obscureCurrent,
                          onToggleObscure: controller.toggleObscureCurrent,
                        ),
                        Align(
                          alignment: Alignment.centerRight,
                          child: TextButton(
                            onPressed: controller.onForgotPassword,
                            child: Text(
                              'Forgot Password?',
                              style: TextStyle(
                                fontSize: 13.sp,
                                fontWeight: FontWeight.w600,
                                color: ColorConst.primaryColor,
                                decoration: TextDecoration.underline,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 12.h),
                        CustomPasswordField(
                          label: 'New Password',
                          controller: controller.newPasswordController,
                          obscureText: controller.obscureNew,
                          onToggleObscure: controller.toggleObscureNew,
                        ),
                        SizedBox(height: 24.h),
                        CustomPasswordField(
                          label: 'Confirm New Password',
                          controller: controller.confirmPasswordController,
                          obscureText: controller.obscureConfirm,
                          onToggleObscure: controller.toggleObscureConfirm,
                        ),
                      ],
                    ),
                  ),
                ),
                CustomChangePasswordButton(
                  isLoading: controller.isLoading,
                  onPressed: controller.changePassword,
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
