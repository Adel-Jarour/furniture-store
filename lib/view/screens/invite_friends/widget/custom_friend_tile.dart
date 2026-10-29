import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../const/color_const.dart';
import '../../../../models/friend_contact_model.dart';

class CustomFriendTile extends StatelessWidget {
  final FriendContactModel friend;
  final VoidCallback onToggleInvite;

  const CustomFriendTile({
    super.key,
    required this.friend,
    required this.onToggleInvite,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 12.h),
          child: Row(
            children: [
              // Avatar
              CircleAvatar(
                radius: 26.r,
                backgroundColor: const Color(0xFFF3F4F6),
                backgroundImage: friend.avatar.isNotEmpty
                    ? AssetImage(friend.avatar) as ImageProvider
                    : null,
                child: friend.avatar.isEmpty
                    ? Icon(
                        Icons.person,
                        size: 26.r,
                        color: ColorConst.primaryColor,
                      )
                    : null,
              ),
              SizedBox(width: 14.w),

              // Name & Phone
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      friend.name,
                      style: TextStyle(
                        fontSize: 15.sp,
                        fontWeight: FontWeight.bold,
                        color: ColorConst.textBlackColor,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    SizedBox(height: 4.h),
                    Text(
                      friend.phone,
                      style: TextStyle(
                        fontSize: 13.sp,
                        color: ColorConst.textGreyColor,
                      ),
                    ),
                  ],
                ),
              ),

              // Invite Button
              GestureDetector(
                onTap: onToggleInvite,
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 200),
                  padding: EdgeInsets.symmetric(
                    horizontal: 18.w,
                    vertical: 8.h,
                  ),
                  decoration: BoxDecoration(
                    color: friend.isInvited
                        ? Colors.white
                        : ColorConst.primaryColor,
                    borderRadius: BorderRadius.circular(20.r),
                    border: Border.all(
                      color: ColorConst.primaryColor,
                      width: 1.5.w,
                    ),
                  ),
                  child: Text(
                    friend.isInvited ? 'Invited' : 'Invite',
                    style: TextStyle(
                      fontSize: 13.sp,
                      fontWeight: FontWeight.w600,
                      color: friend.isInvited
                          ? ColorConst.primaryColor
                          : Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        Divider(
          height: 1.h,
          thickness: 0.8.h,
          color: const Color(0xFFF0F0F0),
          indent: 20.w,
          endIndent: 20.w,
        ),
      ],
    );
  }
}
