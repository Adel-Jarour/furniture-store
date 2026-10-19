import 'product_model.dart';

class CartItemModel {
  final String id;
  final ProductModel product;
  int quantity;
  final String selectedColor;

  CartItemModel({
    required this.id,
    required this.product,
    this.quantity = 1,
    this.selectedColor = 'Brown',
  });

  double get totalPrice => product.price * quantity;

  factory CartItemModel.fromJson(Map<String, dynamic> json) {
    return CartItemModel(
      id: json['id']?.toString() ?? '',
      product:
          ProductModel.fromJson(json['product'] as Map<String, dynamic>? ?? {}),
      quantity: (json['quantity'] as num?)?.toInt() ?? 1,
      selectedColor: json['selectedColor']?.toString() ?? 'Brown',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'product': product.toJson(),
      'quantity': quantity,
      'selectedColor': selectedColor,
    };
  }

  CartItemModel copyWith({
    String? id,
    ProductModel? product,
    int? quantity,
    String? selectedColor,
  }) {
    return CartItemModel(
      id: id ?? this.id,
      product: product ?? this.product,
      quantity: quantity ?? this.quantity,
      selectedColor: selectedColor ?? this.selectedColor,
    );
  }
}
