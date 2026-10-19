import 'package:flutter/services.dart';
import 'package:get/get.dart';
import '../const/image_const.dart';
import '../models/product_model.dart';
import '../utils/app_snack_bar.dart';

class ReceiptItem {
  final ProductModel product;
  final int quantity;

  const ReceiptItem({required this.product, required this.quantity});
}

class ReceiptController extends GetxController {
  final List<ReceiptItem> items = const [
    ReceiptItem(
      product: ProductModel(
        id: 'prod_arm_chair',
        title: 'Arm Chair',
        category: 'Chair',
        price: 180.00,
        rating: 4.5,
        image: ImageConst.productArmChair,
      ),
      quantity: 1,
    ),
    ReceiptItem(
      product: ProductModel(
        id: 'prod_sofa_chair',
        title: 'Arm Chair',
        category: 'Chair',
        price: 120.00,
        rating: 4.5,
        image: ImageConst.productSofaChair,
      ),
      quantity: 1,
    ),
  ];

  final String orderDate = 'Sep 18, 2023 | 10:00 AM';
  final String promoCode = 'FR1254HGGWE';
  final String deliveryType = 'Economy';
  final double amount = 300.00;
  final double deliveryCharge = 25.00;
  final double tax = 25.00;
  final double discount = 25.00;
  final double total = 325.00;
  final String paymentMethod = 'Paypal';
  final String date = '23 Aug 2023, 04:25 PM';
  final String transactionId = 'TR2565HGJD';

  void copyTransactionId() {
    Clipboard.setData(ClipboardData(text: transactionId));
    AppSnackBar.showSuccess(
      title: 'Copied',
      message: 'Transaction ID copied to clipboard.',
    );
  }

  void downloadReceipt() {
    AppSnackBar.showSuccess(
      title: 'Receipt Downloaded',
      message: 'E-Receipt has been saved to your downloads.',
    );
  }
}
