import 'package:get/get.dart';
import '../data/repository/order_repository.dart';
import '../models/review_summary_model.dart';
import '../routes/app_routes.dart';

class ReviewSummaryController extends GetxController {
  final OrderRepository _orderRepository = OrderRepository();

  bool isLoading = false;
  ReviewSummaryModel? summary;
  String paymentMethod = 'Paypal';

  @override
  void onInit() {
    super.onInit();
    fetchSummary();
  }

  Future<void> fetchSummary() async {
    try {
      isLoading = true;
      update();
      summary = await _orderRepository.getReviewSummary();
      if (summary != null) {
        paymentMethod = summary!.paymentMethod;
      }
    } catch (_) {
      // Fallback
    } finally {
      isLoading = false;
      update();
    }
  }

  void onChangePaymentMethod() async {
    final result = await Get.toNamed(AppRoutes.paymentMethods);
    if (result != null && result is String) {
      paymentMethod = result;
      update();
    }
  }

  void onContinue() {
    Get.toNamed(AppRoutes.paymentSuccess);
  }
}
