import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../controller/invite_friends_controller.dart';
import 'widget/custom_friend_tile.dart';
import 'widget/custom_invite_friends_top_bar.dart';

class InviteFriendsScreen extends StatelessWidget {
  const InviteFriendsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<InviteFriendsController>(
      init: InviteFriendsController(),
      builder: (controller) {
        return Scaffold(
          backgroundColor: Colors.white,
          body: SafeArea(
            child: Column(
              children: [
                const CustomInviteFriendsTopBar(),
                Expanded(
                  child: controller.isLoading
                      ? const Center(child: CircularProgressIndicator())
                      : ListView.builder(
                          itemCount: controller.friends.length,
                          itemBuilder: (context, index) {
                            final friend = controller.friends[index];
                            return CustomFriendTile(
                              friend: friend,
                              onToggleInvite: () =>
                                  controller.toggleInvite(index),
                            );
                          },
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
