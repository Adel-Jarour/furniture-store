class CouponModel {
  final String id;
  final String code;
  final String title;
  final String requirement;
  final String discountBadge;
  final double discountPercent;
  final double discountAmount;
  final bool isCombo;

  const CouponModel({
    required this.id,
    required this.code,
    required this.title,
    required this.requirement,
    required this.discountBadge,
    this.discountPercent = 0.0,
    this.discountAmount = 0.0,
    this.isCombo = false,
  });

  factory CouponModel.fromJson(Map<String, dynamic> json) {
    return CouponModel(
      id: json['id']?.toString() ?? '',
      code: json['code']?.toString() ?? '',
      title: json['title']?.toString() ?? '',
      requirement: json['requirement']?.toString() ?? '',
      discountBadge: json['discountBadge']?.toString() ?? '',
      discountPercent: (json['discountPercent'] as num?)?.toDouble() ?? 0.0,
      discountAmount: (json['discountAmount'] as num?)?.toDouble() ?? 0.0,
      isCombo: json['isCombo'] as bool? ?? false,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'code': code,
      'title': title,
      'requirement': requirement,
      'discountBadge': discountBadge,
      'discountPercent': discountPercent,
      'discountAmount': discountAmount,
      'isCombo': isCombo,
    };
  }
}
