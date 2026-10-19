import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../data/repository/order_repository.dart';
import '../models/cart_item_model.dart';
import '../routes/app_routes.dart';
import '../utils/app_snack_bar.dart';

class CartController extends GetxController {
  final OrderRepository _repository = OrderRepository();

  bool isLoading = false;
  List<CartItemModel> items = [];
  final TextEditingController promoController = TextEditingController();

  double deliveryFee = 25.00;
  double discount = 35.00;

  @override
  void onInit() {
    super.onInit();
    fetchCartItems();
  }

  @override
  void onClose() {
    promoController.dispose();
    super.onClose();
  }

  Future<void> fetchCartItems() async {
    try {
      isLoading = true;
      update();
      items = await _repository.getCartItems();
    } catch (e) {
      AppSnackBar.showError(message: 'Failed to load cart');
    } finally {
      isLoading = false;
      update();
    }
  }

  double get subTotal => items.fold(0.0, (sum, item) => sum + item.totalPrice);

  double get totalCost =>
      (subTotal + deliveryFee - discount).clamp(0.0, double.infinity);

  void incrementQuantity(String itemId) {
    final index = items.indexWhere((e) => e.id == itemId);
    if (index != -1) {
      items[index].quantity++;
      update();
    }
  }

  void decrementQuantity(String itemId) {
    final index = items.indexWhere((e) => e.id == itemId);
    if (index != -1) {
      if (items[index].quantity > 1) {
        items[index].quantity--;
        update();
      }
    }
  }

  void removeItem(String itemId) {
    items.removeWhere((e) => e.id == itemId);
    update();
    AppSnackBar.showSuccess(
      title: 'Item Removed',
      message: 'Item has been removed from your cart.',
    );
  }

  void applyPromoCode() {
    final code = promoController.text.trim();
    if (code.isEmpty) {
      AppSnackBar.showError(message: 'Please enter a promo code');
      return;
    }
    discount = 35.00;
    update();
    AppSnackBar.showSuccess(
      title: 'Promo Code Applied',
      message: 'Coupon $code has been successfully applied!',
    );
  }

  void proceedToCheckout() {
    if (items.isEmpty) {
      AppSnackBar.showError(message: 'Your cart is empty');
      return;
    }
    Get.toNamed(AppRoutes.checkout);
  }
}
