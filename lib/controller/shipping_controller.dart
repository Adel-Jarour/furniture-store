import 'package:get/get.dart';
import '../data/repository/order_repository.dart';
import '../models/shipping_option_model.dart';
import '../utils/app_snack_bar.dart';

class ShippingController extends GetxController {
  final OrderRepository _repository = OrderRepository();

  bool isLoading = false;
  List<ShippingOptionModel> options = [];
  int selectedIndex = 0; // Default Economy

  @override
  void onInit() {
    super.onInit();
    fetchOptions();
  }

  Future<void> fetchOptions() async {
    try {
      isLoading = true;
      update();
      options = await _repository.getShippingOptions();
    } catch (e) {
      AppSnackBar.showError(message: 'Failed to load shipping options');
    } finally {
      isLoading = false;
      update();
    }
  }

  void selectOption(int index) {
    selectedIndex = index;
    update();
  }

  ShippingOptionModel? get selectedOption =>
      options.isNotEmpty && selectedIndex < options.length
          ? options[selectedIndex]
          : null;

  void applySelection() {
    Get.back(result: selectedOption);
  }
}
