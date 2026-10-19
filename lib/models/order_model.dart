import 'package:flutter/material.dart';
import 'product_model.dart';

enum OrderStatus { active, completed, cancelled }

class TrackingStep {
  final String title;
  final String timestamp;
  final bool isCompleted;
  final IconData icon;

  const TrackingStep({
    required this.title,
    required this.timestamp,
    required this.isCompleted,
    required this.icon,
  });

  factory TrackingStep.fromJson(Map<String, dynamic> json) {
    return TrackingStep(
      title: json['title']?.toString() ?? '',
      timestamp: json['timestamp']?.toString() ?? '',
      isCompleted: json['isCompleted'] as bool? ?? false,
      icon: Icons.check_circle_outline,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'timestamp': timestamp,
      'isCompleted': isCompleted,
    };
  }
}

class OrderModel {
  final String id;
  final String orderNumber;
  final ProductModel product;
  final int quantity;
  final double price;
  final OrderStatus status;
  final String orderDate;
  final String expectedDeliveryDate;
  final String trackingId;
  final String shippingAddress;
  final String shippingType;
  final String promoCode;
  final double deliveryCharge;
  final double tax;
  final double discount;
  final double totalAmount;
  final String paymentMethod;
  final String transactionId;
  final List<TrackingStep> steps;

  const OrderModel({
    required this.id,
    required this.orderNumber,
    required this.product,
    required this.quantity,
    required this.price,
    required this.status,
    required this.orderDate,
    required this.expectedDeliveryDate,
    required this.trackingId,
    this.shippingAddress = '1901 Thornridge Cir. Shiloh, Hawaii 81063',
    this.shippingType = 'Economy',
    this.promoCode = 'FR1254HGGWE',
    this.deliveryCharge = 25.00,
    this.tax = 25.00,
    this.discount = 25.00,
    this.totalAmount = 325.00,
    this.paymentMethod = 'Paypal',
    this.transactionId = 'TR2565HGJD',
    this.steps = const [],
  });

  factory OrderModel.fromJson(Map<String, dynamic> json) {
    return OrderModel(
      id: json['id']?.toString() ?? '',
      orderNumber: json['orderNumber']?.toString() ?? '',
      product:
          ProductModel.fromJson(json['product'] as Map<String, dynamic>? ?? {}),
      quantity: (json['quantity'] as num?)?.toInt() ?? 1,
      price: (json['price'] as num?)?.toDouble() ?? 0.0,
      status: OrderStatus.values.firstWhere(
        (e) => e.name == json['status'],
        orElse: () => OrderStatus.active,
      ),
      orderDate: json['orderDate']?.toString() ?? '',
      expectedDeliveryDate: json['expectedDeliveryDate']?.toString() ?? '',
      trackingId: json['trackingId']?.toString() ?? '',
      shippingAddress: json['shippingAddress']?.toString() ??
          '1901 Thornridge Cir. Shiloh, Hawaii 81063',
      shippingType: json['shippingType']?.toString() ?? 'Economy',
      promoCode: json['promoCode']?.toString() ?? 'FR1254HGGWE',
      deliveryCharge: (json['deliveryCharge'] as num?)?.toDouble() ?? 25.00,
      tax: (json['tax'] as num?)?.toDouble() ?? 25.00,
      discount: (json['discount'] as num?)?.toDouble() ?? 25.00,
      totalAmount: (json['totalAmount'] as num?)?.toDouble() ?? 325.00,
      paymentMethod: json['paymentMethod']?.toString() ?? 'Paypal',
      transactionId: json['transactionId']?.toString() ?? 'TR2565HGJD',
      steps: (json['steps'] as List<dynamic>?)
              ?.map((e) => TrackingStep.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'orderNumber': orderNumber,
      'product': product.toJson(),
      'quantity': quantity,
      'price': price,
      'status': status.name,
      'orderDate': orderDate,
      'expectedDeliveryDate': expectedDeliveryDate,
      'trackingId': trackingId,
      'shippingAddress': shippingAddress,
      'shippingType': shippingType,
      'promoCode': promoCode,
      'deliveryCharge': deliveryCharge,
      'tax': tax,
      'discount': discount,
      'totalAmount': totalAmount,
      'paymentMethod': paymentMethod,
      'transactionId': transactionId,
      'steps': steps.map((e) => e.toJson()).toList(),
    };
  }
}
