import 'package:get/get.dart';
import '../data/repository/home_repository.dart';
import '../models/chat_item_model.dart';

class ChatController extends GetxController {
  final HomeRepository _repository = HomeRepository();

  List<ChatItemModel> allChats = [];
  List<ChatItemModel> filteredChats = [];
  String searchQuery = '';

  @override
  void onInit() {
    super.onInit();
    loadChats();
  }

  Future<void> loadChats() async {
    allChats = await _repository.getChats();
    filteredChats = List.from(allChats);
    update();
  }

  void search(String query) {
    searchQuery = query;
    if (query.isEmpty) {
      filteredChats = List.from(allChats);
    } else {
      filteredChats = allChats
          .where((c) =>
              c.senderName.toLowerCase().contains(query.toLowerCase()) ||
              c.lastMessage.toLowerCase().contains(query.toLowerCase()))
          .toList();
    }
    update();
  }
}
