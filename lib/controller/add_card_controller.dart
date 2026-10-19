import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddCardController extends GetxController {
  final holderNameController = TextEditingController();
  final cardNumberController = TextEditingController();
  final expiryController = TextEditingController();
  final cvvController = TextEditingController();
  bool saveCard = true;
  bool isLoading = false;

  String get maskedNumber {
    final raw = cardNumberController.text.replaceAll(' ', '');
    if (raw.length < 4) return '•••• •••• •••• ••••';
    final chunks = <String>[];
    for (var i = 0; i < raw.length && i < 16; i += 4) {
      chunks.add(raw.substring(i, (i + 4).clamp(0, raw.length)));
    }
    while (chunks.length < 4) {
      chunks.add('••••');
    }
    return chunks.join(' ');
  }

  void toggleSaveCard(bool? val) {
    saveCard = val ?? true;
    update();
  }

  Future<void> addCard() async {
    isLoading = true;
    update();
    await Future.delayed(const Duration(seconds: 1));
    isLoading = false;
    update();
    Get.back();
  }

  @override
  void onClose() {
    holderNameController.dispose();
    cardNumberController.dispose();
    expiryController.dispose();
    cvvController.dispose();
    super.onClose();
  }
}
