import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../const/color_const.dart';

class CustomProfileAvatar extends StatelessWidget {
  final String avatarImage;
  final String userName;

  const CustomProfileAvatar({
    super.key,
    required this.avatarImage,
    required this.userName,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
          children: [
            CircleAvatar(
              radius: 46.r,
              backgroundImage: AssetImage(avatarImage),
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
                child:
                    Icon(Icons.edit_outlined, size: 15.r, color: Colors.white),
              ),
            ),
          ],
        ),
        SizedBox(height: 12.h),
        Text(
          userName,
          style: TextStyle(
            fontSize: 18.sp,
            fontWeight: FontWeight.bold,
            color: ColorConst.textBlackColor,
          ),
        ),
      ],
    );
  }
}
