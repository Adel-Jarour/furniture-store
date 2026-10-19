import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../data/repository/payment_repository.dart';
import '../models/payment_card_model.dart';
import '../utils/app_snack_bar.dart';

class AddCardController extends GetxController {
  final PaymentRepository _repository = PaymentRepository();

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
    if (cardNumberController.text.trim().isEmpty ||
        expiryController.text.trim().isEmpty ||
        holderNameController.text.trim().isEmpty) {
      AppSnackBar.showError(message: 'Please fill all card details');
      return;
    }

    try {
      isLoading = true;
      update();
      final newCard = PaymentCardModel(
        id: DateTime.now().millisecondsSinceEpoch.toString(),
        holderName: holderNameController.text.trim(),
        cardNumber: cardNumberController.text.trim(),
        expiryDate: expiryController.text.trim(),
        cvv: cvvController.text.trim(),
        cardType:
            cardNumberController.text.startsWith('4') ? 'visa' : 'mastercard',
        isDefault: saveCard,
      );
      await _repository.addCard(newCard);
      AppSnackBar.showSuccess(message: 'Card added successfully');
      Get.back(result: true);
    } catch (_) {
      AppSnackBar.showError(message: 'Failed to add card');
    } finally {
      isLoading = false;
      update();
    }
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
