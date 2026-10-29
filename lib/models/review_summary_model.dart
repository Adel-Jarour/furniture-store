class ReviewSummaryItemModel {
  final String id;
  final String title;
  final String category;
  final double price;
  final int quantity;
  final double rating;
  final String image;

  const ReviewSummaryItemModel({
    required this.id,
    required this.title,
    required this.category,
    required this.price,
    required this.quantity,
    required this.rating,
    required this.image,
  });

  factory ReviewSummaryItemModel.fromJson(Map<String, dynamic> json) {
    return ReviewSummaryItemModel(
      id: json['id']?.toString() ?? '',
      title: json['title']?.toString() ?? '',
      category: json['category']?.toString() ?? '',
      price: (json['price'] as num?)?.toDouble() ?? 0.0,
      quantity: (json['quantity'] as num?)?.toInt() ?? 1,
      rating: (json['rating'] as num?)?.toDouble() ?? 5.0,
      image: json['image']?.toString() ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'category': category,
      'price': price,
      'quantity': quantity,
      'rating': rating,
      'image': image,
    };
  }
}

class ReviewSummaryModel {
  final List<ReviewSummaryItemModel> items;
  final String orderDate;
  final String promoCode;
  final String deliveryType;
  final double amount;
  final double deliveryCharge;
  final double tax;
  final double discount;
  final double total;
  final String paymentMethod;

  const ReviewSummaryModel({
    required this.items,
    required this.orderDate,
    required this.promoCode,
    required this.deliveryType,
    required this.amount,
    required this.deliveryCharge,
    required this.tax,
    required this.discount,
    required this.total,
    required this.paymentMethod,
  });

  factory ReviewSummaryModel.fromJson(Map<String, dynamic> json) {
    return ReviewSummaryModel(
      items: (json['items'] as List?)
              ?.map((e) =>
                  ReviewSummaryItemModel.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
      orderDate: json['orderDate']?.toString() ?? '',
      promoCode: json['promoCode']?.toString() ?? '',
      deliveryType: json['deliveryType']?.toString() ?? 'Economy',
      amount: (json['amount'] as num?)?.toDouble() ?? 0.0,
      deliveryCharge: (json['deliveryCharge'] as num?)?.toDouble() ?? 0.0,
      tax: (json['tax'] as num?)?.toDouble() ?? 0.0,
      discount: (json['discount'] as num?)?.toDouble() ?? 0.0,
      total: (json['total'] as num?)?.toDouble() ?? 0.0,
      paymentMethod: json['paymentMethod']?.toString() ?? 'Paypal',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'items': items.map((e) => e.toJson()).toList(),
      'orderDate': orderDate,
      'promoCode': promoCode,
      'deliveryType': deliveryType,
      'amount': amount,
      'deliveryCharge': deliveryCharge,
      'tax': tax,
      'discount': discount,
      'total': total,
      'paymentMethod': paymentMethod,
    };
  }
}
