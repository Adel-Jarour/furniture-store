import 'package:get/get.dart';

class NotificationSettingsController extends GetxController {
  bool generalNotification = true;
  bool sound = true;
  bool vibrate = false;
  bool specialOffers = true;
  bool promoDiscount = false;
  bool payments = true;
  bool cashback = true;
  bool appUpdates = false;
  bool newServiceAvailable = true;
  bool newTipsAvailable = false;

  void toggleGeneral(bool value) {
    generalNotification = value;
    update();
  }

  void toggleSound(bool value) {
    sound = value;
    update();
  }

  void toggleVibrate(bool value) {
    vibrate = value;
    update();
  }

  void toggleSpecialOffers(bool value) {
    specialOffers = value;
    update();
  }

  void togglePromoDiscount(bool value) {
    promoDiscount = value;
    update();
  }

  void togglePayments(bool value) {
    payments = value;
    update();
  }

  void toggleCashback(bool value) {
    cashback = value;
    update();
  }

  void toggleAppUpdates(bool value) {
    appUpdates = value;
    update();
  }

  void toggleNewService(bool value) {
    newServiceAvailable = value;
    update();
  }

  void toggleNewTips(bool value) {
    newTipsAvailable = value;
    update();
  }
}
