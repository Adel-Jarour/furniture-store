import 'package:get/get.dart';
import '../models/payment_card_model.dart';

enum PaymentOption { cash, card, paypal, applePay, googlePay }

class PaymentController extends GetxController {
  PaymentOption selectedOption = PaymentOption.cash;
  bool isLoading = false;

  List<PaymentCardModel> savedCards = const [
    PaymentCardModel(
      id: 'card_1',
      holderName: 'Esther Howard',
      cardNumber: '4716 9627 1635 8047',
      expiryDate: '02/30',
      cvv: '000',
    ),
  ];

  void selectOption(PaymentOption option) {
    selectedOption = option;
    update();
  }

  Future<void> confirmPayment() async {
    isLoading = true;
    update();
    await Future.delayed(const Duration(seconds: 2));
    isLoading = false;
    update();
    Get.toNamed('/payment-success');
  }
}
