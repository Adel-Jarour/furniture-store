class PaymentCardModel {
  final String id;
  final String holderName;
  final String cardNumber;
  final String expiryDate;
  final String cvv;
  final String cardType; // 'mastercard', 'visa', etc.
  final bool isDefault;

  const PaymentCardModel({
    required this.id,
    required this.holderName,
    required this.cardNumber,
    required this.expiryDate,
    this.cvv = '',
    this.cardType = 'mastercard',
    this.isDefault = false,
  });

  factory PaymentCardModel.fromJson(Map<String, dynamic> json) {
    return PaymentCardModel(
      id: json['id']?.toString() ?? '',
      holderName: json['holderName']?.toString() ??
          json['holder_name']?.toString() ??
          '',
      cardNumber: json['cardNumber']?.toString() ??
          json['card_number']?.toString() ??
          '',
      expiryDate: json['expiryDate']?.toString() ??
          json['expiry_date']?.toString() ??
          '',
      cvv: json['cvv']?.toString() ?? '',
      cardType: json['cardType']?.toString() ??
          json['card_type']?.toString() ??
          'mastercard',
      isDefault:
          json['isDefault'] as bool? ?? json['is_default'] as bool? ?? false,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'holderName': holderName,
      'cardNumber': cardNumber,
      'expiryDate': expiryDate,
      'cvv': cvv,
      'cardType': cardType,
      'isDefault': isDefault,
    };
  }
}
