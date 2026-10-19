import 'package:flutter/services.dart';
import 'package:get/get.dart';
import '../data/repository/order_repository.dart';
import '../models/coupon_model.dart';
import '../utils/app_snack_bar.dart';

class CouponController extends GetxController {
  final OrderRepository _repository = OrderRepository();

  bool isLoading = false;
  List<CouponModel> coupons = [];

  @override
  void onInit() {
    super.onInit();
    fetchCoupons();
  }

  Future<void> fetchCoupons() async {
    try {
      isLoading = true;
      update();
      coupons = await _repository.getCoupons();
    } catch (e) {
      AppSnackBar.showError(message: 'Failed to load coupons');
    } finally {
      isLoading = false;
      update();
    }
  }

  void copyCode(String code) {
    Clipboard.setData(ClipboardData(text: code));
    AppSnackBar.showSuccess(
      title: 'Coupon Copied',
      message: 'Code "$code" copied to clipboard!',
    );
  }
}
