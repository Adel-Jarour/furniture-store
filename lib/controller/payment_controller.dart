import 'package:get/get.dart';
import '../data/repository/payment_repository.dart';
import '../models/payment_card_model.dart';
import '../routes/app_routes.dart';
import '../utils/app_snack_bar.dart';

enum PaymentOption { cash, card, paypal, applePay, googlePay }

class PaymentController extends GetxController {
  final PaymentRepository _repository = PaymentRepository();

  PaymentOption selectedOption = PaymentOption.cash;
  bool isLoading = false;
  List<PaymentCardModel> savedCards = [];
  String? selectedDefaultCardId;

  @override
  void onInit() {
    super.onInit();
    fetchCards();
  }

  Future<void> fetchCards() async {
    try {
      isLoading = true;
      update();
      savedCards = await _repository.getCards();
      final defaultCard = savedCards.firstWhereOrNull((c) => c.isDefault);
      selectedDefaultCardId = defaultCard?.id ??
          (savedCards.isNotEmpty ? savedCards.first.id : null);
    } catch (_) {
      AppSnackBar.showError(message: 'Failed to load payment cards');
    } finally {
      isLoading = false;
      update();
    }
  }

  void selectOption(PaymentOption option) {
    selectedOption = option;
    update();
  }

  void selectDefaultCard(String id) {
    selectedDefaultCardId = id;
    _repository.setDefaultCard(id);
    update();
  }

  Future<void> confirmPayment() async {
    isLoading = true;
    update();
    try {
      await _repository.confirmPayment(
        paymentType: selectedOption.name,
        cardId:
            selectedOption == PaymentOption.card ? selectedDefaultCardId : null,
        totalAmount: 185.00,
      );
      Get.toNamed(AppRoutes.paymentSuccess);
    } catch (_) {
      AppSnackBar.showError(message: 'Payment failed. Please try again.');
    } finally {
      isLoading = false;
      update();
    }
  }
}
