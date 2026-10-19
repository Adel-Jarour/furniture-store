class ChatItemModel {
  final String id;
  final String senderName;
  final String lastMessage;
  final String time;
  final String avatar;
  final bool isOnline;
  final int unreadCount;

  const ChatItemModel({
    required this.id,
    required this.senderName,
    required this.lastMessage,
    required this.time,
    required this.avatar,
    this.isOnline = true,
    this.unreadCount = 0,
  });

  factory ChatItemModel.fromJson(Map<String, dynamic> json) {
    return ChatItemModel(
      id: json['id']?.toString() ?? '',
      senderName: json['sender_name']?.toString() ?? '',
      lastMessage: json['last_message']?.toString() ?? '',
      time: json['time']?.toString() ?? '',
      avatar: json['avatar']?.toString() ?? '',
      isOnline: json['is_online'] as bool? ?? true,
      unreadCount: (json['unread_count'] as num?)?.toInt() ?? 0,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'sender_name': senderName,
      'last_message': lastMessage,
      'time': time,
      'avatar': avatar,
      'is_online': isOnline,
      'unread_count': unreadCount,
    };
  }
}
