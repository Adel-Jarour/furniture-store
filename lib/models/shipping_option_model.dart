import 'package:flutter/material.dart';

enum ShippingType { economy, regular, cargo, express }

class ShippingOptionModel {
  final String id;
  final String title;
  final String estimatedArrival;
  final double price;
  final ShippingType type;
  final IconData icon;

  const ShippingOptionModel({
    required this.id,
    required this.title,
    required this.estimatedArrival,
    required this.price,
    required this.type,
    required this.icon,
  });

  factory ShippingOptionModel.fromJson(Map<String, dynamic> json) {
    return ShippingOptionModel(
      id: json['id']?.toString() ?? '',
      title: json['title']?.toString() ?? '',
      estimatedArrival: json['estimatedArrival']?.toString() ?? '',
      price: (json['price'] as num?)?.toDouble() ?? 0.0,
      type: ShippingType.values.firstWhere(
        (e) => e.name == json['type'],
        orElse: () => ShippingType.economy,
      ),
      icon: Icons.inventory_2_outlined,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'estimatedArrival': estimatedArrival,
      'price': price,
      'type': type.name,
    };
  }
}
