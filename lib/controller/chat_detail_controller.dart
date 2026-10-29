import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../models/chat_message_model.dart';
import '../models/chat_item_model.dart';
import '../const/image_const.dart';

class ChatDetailController extends GetxController {
  final messageController = TextEditingController();
  String senderName = 'Sheila Lemke';
  String senderAvatar = ImageConst.avatarChat1;
  bool senderOnline = true;

  @override
  void onInit() {
    super.onInit();
    final args = Get.arguments;
    if (args is ChatItemModel) {
      senderName = args.senderName;
      senderAvatar = args.avatar;
      senderOnline = args.isOnline;
    }
  }

  List<ChatMessageModel> messages = [
    const ChatMessageModel(
      id: 'm1',
      text:
          'Lorem Ipsum is simply dummy text of the printing and typesetting industry.',
      time: '08:04 pm',
      isMe: false,
    ),
    const ChatMessageModel(
      id: 'm2',
      text:
          'Lorem Ipsum is simply dummy text of the printing and typesetting industry.',
      time: '08:04 pm',
      isMe: true,
    ),
    const ChatMessageModel(
      id: 'm3',
      text: '',
      time: '08:04 pm',
      isMe: false,
      imageUrl: ImageConst.chatImage,
    ),
    const ChatMessageModel(
      id: 'm4',
      text: '',
      time: '08:04 pm',
      isMe: true,
      isVoice: true,
      voiceDuration: '0:13',
    ),
  ];

  void sendMessage() {
    final text = messageController.text.trim();
    if (text.isEmpty) return;
    messages.add(ChatMessageModel(
      id: DateTime.now().millisecondsSinceEpoch.toString(),
      text: text,
      time:
          '${DateTime.now().hour}:${DateTime.now().minute.toString().padLeft(2, '0')} pm',
      isMe: true,
    ));
    messageController.clear();
    update();
  }

  @override
  void onClose() {
    messageController.dispose();
    super.onClose();
  }
}
