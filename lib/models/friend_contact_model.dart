class FriendContactModel {
  final String id;
  final String name;
  final String phone;
  final String avatar;
  final bool isInvited;

  const FriendContactModel({
    required this.id,
    required this.name,
    required this.phone,
    required this.avatar,
    this.isInvited = false,
  });

  FriendContactModel copyWith({
    String? id,
    String? name,
    String? phone,
    String? avatar,
    bool? isInvited,
  }) {
    return FriendContactModel(
      id: id ?? this.id,
      name: name ?? this.name,
      phone: phone ?? this.phone,
      avatar: avatar ?? this.avatar,
      isInvited: isInvited ?? this.isInvited,
    );
  }

  factory FriendContactModel.fromJson(Map<String, dynamic> json) {
    return FriendContactModel(
      id: json['id']?.toString() ?? '',
      name: json['name']?.toString() ?? '',
      phone: json['phone']?.toString() ?? '',
      avatar: json['avatar']?.toString() ?? '',
      isInvited: json['isInvited'] as bool? ?? false,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'phone': phone,
      'avatar': avatar,
      'isInvited': isInvited,
    };
  }
}
