class PaymentCardModel {
  final String id;
  final String holderName;
  final String cardNumber;
  final String expiryDate;
  final String cvv;

  const PaymentCardModel({
    required this.id,
    required this.holderName,
    required this.cardNumber,
    required this.expiryDate,
    required this.cvv,
  });
}
