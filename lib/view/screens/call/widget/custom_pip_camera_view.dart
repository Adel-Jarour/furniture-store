import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../const/image_const.dart';

class CustomPipCameraView extends StatelessWidget {
  const CustomPipCameraView({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 90.w,
      height: 125.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12.r),
        border:
            Border.all(color: Colors.white.withValues(alpha: 0.4), width: 1.5),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.25),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10.r),
        child: Image.asset(
          ImageConst.callUserPip,
          fit: BoxFit.cover,
          errorBuilder: (_, __, ___) => Container(
            color: const Color(0xFF374151),
            child: const Icon(Icons.person, color: Colors.white),
          ),
        ),
      ),
    );
  }
}
