import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../const/image_const.dart';

class CustomVoiceCallRepCard extends StatelessWidget {
  const CustomVoiceCallRepCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 190.r,
      height: 190.r,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(24.r),
        border: Border.all(color: Colors.white, width: 2.w),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.2),
            blurRadius: 16,
            offset: const Offset(0, 6),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(22.r),
        child: Image.asset(
          ImageConst.callRepAgent,
          fit: BoxFit.cover,
          errorBuilder: (_, __, ___) => Container(
            color: const Color(0xFF374151),
            child: Icon(Icons.person, size: 80.r, color: Colors.white),
          ),
        ),
      ),
    );
  }
}
