import '../../models/payment_card_model.dart';
import '../api/payment_api.dart';

class PaymentRepository {
  final PaymentApi _api = PaymentApi();

  final List<PaymentCardModel> _mockCards = [
    const PaymentCardModel(
      id: '1',
      holderName: 'Esther Howard',
      cardNumber: '5300 0000 0000 0000',
      expiryDate: '12/26',
      cardType: 'mastercard',
      isDefault: true,
    ),
    const PaymentCardModel(
      id: '2',
      holderName: 'Esther Howard',
      cardNumber: '4200 0000 0000 0000',
      expiryDate: '09/25',
      cardType: 'visa',
      isDefault: false,
    ),
  ];

  Future<List<PaymentCardModel>> getCards() async {
    try {
      final response = await _api.getCards();
      if (response != null && response.data != null) {
        final List list = response.data['data'] ?? [];
        return list.map((json) => PaymentCardModel.fromJson(json)).toList();
      }
    } catch (_) {}
    return List.from(_mockCards);
  }

  Future<bool> addCard(PaymentCardModel card) async {
    try {
      final response = await _api.addCard(card.toJson());
      if (response != null && response.statusCode == 200) {
        return true;
      }
    } catch (_) {}
    _mockCards.add(card);
    return true;
  }

  Future<bool> setDefaultCard(String cardId) async {
    try {
      await _api.setDefaultCard(cardId);
      return true;
    } catch (_) {
      return true;
    }
  }

  Future<bool> confirmPayment({
    required String paymentType,
    String? cardId,
    required double totalAmount,
  }) async {
    try {
      final response = await _api.confirmPayment({
        'payment_type': paymentType,
        'card_id': cardId,
        'amount': totalAmount,
      });
      return response != null && response.statusCode == 200;
    } catch (_) {
      return true;
    }
  }
}
