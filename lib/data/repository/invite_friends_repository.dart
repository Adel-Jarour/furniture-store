import '../../const/image_const.dart';
import '../../models/friend_contact_model.dart';

class InviteFriendsRepository {
  final List<FriendContactModel> _mockFriends = const [
    FriendContactModel(
      id: 'f_1',
      name: 'Carla Schoen',
      phone: '207.555.0119',
      avatar: ImageConst.avatarProfile,
      isInvited: false,
    ),
    FriendContactModel(
      id: 'f_2',
      name: 'Esther Howard',
      phone: '702.555.0122',
      avatar: ImageConst.avatarProfile,
      isInvited: false,
    ),
    FriendContactModel(
      id: 'f_3',
      name: 'Robert Fox',
      phone: '239.555.0108',
      avatar: ImageConst.avatarProfile,
      isInvited: false,
    ),
    FriendContactModel(
      id: 'f_4',
      name: 'Jacob Jones',
      phone: '316.555.0116',
      avatar: ImageConst.avatarProfile,
      isInvited: false,
    ),
    FriendContactModel(
      id: 'f_5',
      name: 'Jacob Jones',
      phone: '629.555.0129',
      avatar: ImageConst.avatarProfile,
      isInvited: false,
    ),
    FriendContactModel(
      id: 'f_6',
      name: 'Darlene Robertson',
      phone: '629.555.0129',
      avatar: ImageConst.avatarProfile,
      isInvited: false,
    ),
    FriendContactModel(
      id: 'f_7',
      name: 'Ralph Edwards',
      phone: '203.555.0106',
      avatar: ImageConst.avatarProfile,
      isInvited: false,
    ),
    FriendContactModel(
      id: 'f_8',
      name: 'Ronald Richards',
      phone: '209.555.0104',
      avatar: ImageConst.avatarProfile,
      isInvited: false,
    ),
    FriendContactModel(
      id: 'f_9',
      name: 'Courtney Henry',
      phone: '405.555.0128',
      avatar: ImageConst.avatarProfile,
      isInvited: false,
    ),
  ];

  Future<List<FriendContactModel>> getFriends() async {
    return List.from(_mockFriends);
  }
}
