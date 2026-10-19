import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../const/color_const.dart';
import '../../../controller/chat_controller.dart';
import 'widget/custom_chat_search_bar.dart';
import 'widget/custom_chat_list_tile.dart';

class ChatScreen extends StatelessWidget {
  final bool showBackButton;

  const ChatScreen({super.key, this.showBackButton = false});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ChatController>(
      init: ChatController(),
      builder: (controller) {
        return Scaffold(
          backgroundColor: ColorConst.primaryColor,
          body: SafeArea(
            bottom: false,
            child: Column(
              children: [
                // Teal Header Area
                Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: 20.w, vertical: 12.h),
                  child: Column(
                    children: [
                      // Top Row with optional back button
                      if (showBackButton)
                        Row(
                          children: [
                            GestureDetector(
                              onTap: () => Get.back(),
                              child: Container(
                                width: 44.r,
                                height: 44.r,
                                decoration: const BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Colors.white),
                                alignment: Alignment.center,
                                child: Icon(Icons.arrow_back,
                                    size: 20.r,
                                    color: ColorConst.textBlackColor),
                              ),
                            ),
                            Expanded(
                              child: Center(
                                child: Text(
                                  'Chat',
                                  style: TextStyle(
                                      fontSize: 18.sp,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white),
                                ),
                              ),
                            ),
                            SizedBox(width: 44.r),
                          ],
                        )
                      else
                        Padding(
                          padding: EdgeInsets.symmetric(vertical: 6.h),
                          child: Center(
                            child: Text(
                              'Chat',
                              style: TextStyle(
                                  fontSize: 18.sp,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
                            ),
                          ),
                        ),
                      SizedBox(height: 14.h),

                      // Search Bar
                      CustomChatSearchBar(onChanged: controller.search),
                    ],
                  ),
                ),
                SizedBox(height: 10.h),

                // White List Container with Rounded Top
                Expanded(
                  child: Container(
                    width: double.infinity,
                    padding: EdgeInsets.only(
                        left: 20.w, right: 20.w, top: 16.h, bottom: 110.h),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius:
                          BorderRadius.vertical(top: Radius.circular(28.r)),
                    ),
                    child: ListView.separated(
                      padding: EdgeInsets.zero,
                      itemCount: controller.filteredChats.length,
                      separatorBuilder: (context, index) =>
                          SizedBox(height: 12.h),
                      itemBuilder: (context, index) {
                        return CustomChatListTile(
                            chat: controller.filteredChats[index]);
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
