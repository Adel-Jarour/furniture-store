import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../data/repository/order_repository.dart';
import '../models/cart_item_model.dart';
import '../models/shipping_option_model.dart';
import '../models/address_model.dart';
import '../routes/app_routes.dart';
import '../utils/app_snack_bar.dart';

class CheckoutController extends GetxController {
  final OrderRepository _repository = OrderRepository();

  bool isLoading = false;
  List<CartItemModel> orderItems = [];

  String addressType = 'Home';
  String addressDetails = '1901 Thornridge Cir. Shiloh, Hawaii 81063';

  ShippingOptionModel selectedShipping = const ShippingOptionModel(
    id: 'ship_1',
    title: 'Economy',
    estimatedArrival: 'Estimated Arrival  25 September 2023',
    price: 25.00,
    type: ShippingType.economy,
    icon: Icons.inventory_2_outlined,
  );

  @override
  void onInit() {
    super.onInit();
    loadCheckoutData();
  }

  Future<void> loadCheckoutData() async {
    try {
      isLoading = true;
      update();
      orderItems = await _repository.getCartItems();
    } catch (e) {
      AppSnackBar.showError(message: 'Failed to load order items');
    } finally {
      isLoading = false;
      update();
    }
  }

  Future<void> changeShippingType() async {
    final result = await Get.toNamed(AppRoutes.chooseShipping);
    if (result != null && result is ShippingOptionModel) {
      selectedShipping = result;
      update();
    }
  }

  Future<void> changeAddress() async {
    final result = await Get.toNamed(AppRoutes.shippingAddress);
    if (result is AddressModel) {
      addressType = result.label;
      addressDetails = result.fullAddress;
      update();
    }
  }

  void continueToPayment() {
    Get.toNamed(AppRoutes.reviewSummary);
  }
}
