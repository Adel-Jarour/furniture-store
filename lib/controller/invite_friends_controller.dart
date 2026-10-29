import 'package:get/get.dart';
import '../data/repository/invite_friends_repository.dart';
import '../models/friend_contact_model.dart';
import '../utils/app_snack_bar.dart';

class InviteFriendsController extends GetxController {
  final InviteFriendsRepository _repository = InviteFriendsRepository();

  bool isLoading = false;
  List<FriendContactModel> friends = [];

  @override
  void onInit() {
    super.onInit();
    fetchFriends();
  }

  Future<void> fetchFriends() async {
    try {
      isLoading = true;
      update();
      friends = await _repository.getFriends();
    } catch (_) {
      AppSnackBar.showError(message: 'Failed to load contacts');
    } finally {
      isLoading = false;
      update();
    }
  }

  void toggleInvite(int index) {
    if (index >= 0 && index < friends.length) {
      final current = friends[index];
      final newStatus = !current.isInvited;
      friends[index] = current.copyWith(isInvited: newStatus);
      update();

      if (newStatus) {
        AppSnackBar.showSuccess(
          title: 'Invitation Sent',
          message: 'Invited ${current.name} to Furniture Store',
        );
      }
    }
  }
}
