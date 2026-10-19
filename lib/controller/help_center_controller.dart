import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../models/contact_channel_model.dart';
import '../models/faq_model.dart';

class HelpCenterController extends GetxController {
  final TextEditingController searchController = TextEditingController();

  // Tab index: 0 = FAQ, 1 = Contact Us
  int selectedTabIndex = 0;

  // FAQ Categories
  final List<String> categories = ['All', 'Services', 'General', 'Account'];
  String selectedCategory = 'All';

  String searchQuery = '';

  final List<FaqModel> _allFaqs = [
    FaqModel(
      id: '1',
      question: "Can I track my order's delivery status?",
      answer:
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.',
      category: 'Services',
      isExpanded: true,
    ),
    FaqModel(
      id: '2',
      question: 'Is there a return policy?',
      answer:
          'Yes, we offer a 30-day hassle-free return policy for unused items in their original packaging.',
      category: 'Services',
    ),
    FaqModel(
      id: '3',
      question: 'Can I save my favorite items for later?',
      answer:
          'You can add items to your Wishlist anytime by tapping the heart icon on any product page.',
      category: 'General',
    ),
    FaqModel(
      id: '4',
      question: 'Can I share products with my friends?',
      answer:
          'Yes, tap the share icon on the product details page to send product links via WhatsApp, SMS, or social media.',
      category: 'General',
    ),
    FaqModel(
      id: '5',
      question: 'How do I contact customer support?',
      answer:
          'You can reach us through in-app live chat, email, or any of our official social channels on the Contact Us tab.',
      category: 'Services',
    ),
    FaqModel(
      id: '6',
      question: 'What payment methods are accepted?',
      answer:
          'We accept Cash on Delivery, Credit/Debit Cards (Visa, Mastercard), PayPal, Apple Pay, and Google Pay.',
      category: 'Account',
    ),
    FaqModel(
      id: '7',
      question: 'How to add review?',
      answer:
          'Go to My Orders, select a completed order, and tap Leave Review to submit your rating and comments.',
      category: 'Account',
    ),
  ];

  final List<ContactChannelModel> contactChannels = [
    ContactChannelModel(
      id: 'customer_service',
      title: 'Customer Service',
      icon: Icons.headset_mic_outlined,
      subtitle: '24/7 dedicated telephone and live support',
      actionValue: '+1 (800) 234-5678',
    ),
    ContactChannelModel(
      id: 'whatsapp',
      title: 'WhatsApp',
      icon: Icons.chat_bubble_outline_rounded,
      subtitle: '(480) 555-0103',
      actionValue: '(480) 555-0103',
      isExpanded: true,
    ),
    ContactChannelModel(
      id: 'website',
      title: 'Website',
      icon: Icons.language_rounded,
      subtitle: 'www.furniturestore.com',
      actionValue: 'https://www.furniturestore.com',
    ),
    ContactChannelModel(
      id: 'facebook',
      title: 'Facebook',
      icon: Icons.facebook,
      subtitle: 'facebook.com/furniturestore',
      actionValue: 'facebook.com/furniturestore',
    ),
    ContactChannelModel(
      id: 'twitter',
      title: 'Twitter',
      icon: Icons.alternate_email_rounded,
      subtitle: '@furniturestore',
      actionValue: '@furniturestore',
    ),
    ContactChannelModel(
      id: 'instagram',
      title: 'Instagram',
      icon: Icons.camera_alt_outlined,
      subtitle: '@furniture_store_official',
      actionValue: '@furniture_store_official',
    ),
  ];

  List<FaqModel> get filteredFaqs {
    return _allFaqs.where((faq) {
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
    final faq = _allFaqs.firstWhereOrNull((item) => item.id == id);
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
