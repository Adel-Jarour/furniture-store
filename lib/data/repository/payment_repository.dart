import '../../models/payment_card_model.dart';

class PaymentRepository {
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
    return List.from(_mockCards);
  }

  Future<bool> addCard(PaymentCardModel card) async {
    _mockCards.add(card);
    return true;
  }

  Future<bool> setDefaultCard(String cardId) async {
    for (int i = 0; i < _mockCards.length; i++) {
      final card = _mockCards[i];
      _mockCards[i] = PaymentCardModel(
        id: card.id,
        holderName: card.holderName,
        cardNumber: card.cardNumber,
        expiryDate: card.expiryDate,
        cardType: card.cardType,
        isDefault: card.id == cardId,
      );
    }
    return true;
  }

  Future<bool> confirmPayment({
    required String paymentType,
    String? cardId,
    required double totalAmount,
  }) async {
    return true;
  }
}
