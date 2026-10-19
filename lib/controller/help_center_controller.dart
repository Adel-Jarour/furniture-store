import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../data/repository/help_center_repository.dart';
import '../models/contact_channel_model.dart';
import '../models/faq_model.dart';

class HelpCenterController extends GetxController {
  final HelpCenterRepository _repository = HelpCenterRepository();
  final TextEditingController searchController = TextEditingController();

  // Tab index: 0 = FAQ, 1 = Contact Us
  int selectedTabIndex = 0;

  // FAQ Categories
  final List<String> categories = ['All', 'Services', 'General', 'Account'];
  String selectedCategory = 'All';
  String searchQuery = '';
  bool isLoading = false;

  List<FaqModel> allFaqs = [];
  List<ContactChannelModel> contactChannels = [];

  @override
  void onInit() {
    super.onInit();
    loadData();
  }

  Future<void> loadData() async {
    isLoading = true;
    update();
    allFaqs = await _repository.getFaqs();
    contactChannels = await _repository.getContactChannels();
    isLoading = false;
    update();
  }

  List<FaqModel> get filteredFaqs {
    return allFaqs.where((faq) {
      final matchesCategory = selectedCategory == 'All' ||
          faq.category.toLowerCase() == selectedCategory.toLowerCase();
      final matchesSearch = searchQuery.isEmpty ||
          faq.question.toLowerCase().contains(searchQuery.toLowerCase()) ||
          faq.answer.toLowerCase().contains(searchQuery.toLowerCase());
      return matchesCategory && matchesSearch;
    }).toList();
  }

  void setTab(int index) {
    selectedTabIndex = index;
    update();
  }

  void setCategory(String category) {
    selectedCategory = category;
    update();
  }

  void onSearchChanged(String query) {
    searchQuery = query.trim();
    update();
  }

  void toggleFaq(String id) {
    final faq = allFaqs.firstWhereOrNull((item) => item.id == id);
    if (faq != null) {
      faq.isExpanded = !faq.isExpanded;
      update();
    }
  }

  void toggleContact(String id) {
    final contact = contactChannels.firstWhereOrNull((item) => item.id == id);
    if (contact != null) {
      contact.isExpanded = !contact.isExpanded;
      update();
    }
  }

  @override
  void onClose() {
    searchController.dispose();
    super.onClose();
  }
}
