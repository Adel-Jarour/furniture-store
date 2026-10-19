class ChatMessageModel {
  final String id;
  final String text;
  final String time;
  final bool isMe;
  final String? imageUrl;
  final bool isVoice;
  final String voiceDuration;

  const ChatMessageModel({
    required this.id,
    required this.text,
    required this.time,
    required this.isMe,
    this.imageUrl,
    this.isVoice = false,
    this.voiceDuration = '',
  });
}
