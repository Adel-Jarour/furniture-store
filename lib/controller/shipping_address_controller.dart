import 'package:get/get.dart';
import '../data/repository/address_repository.dart';
import '../models/address_model.dart';
import '../routes/app_routes.dart';

class ShippingAddressController extends GetxController {
  final AddressRepository _addressRepository = AddressRepository();

  bool isLoading = false;
  List<AddressModel> addresses = [];
  String selectedId = '1';

  @override
  void onInit() {
    super.onInit();
    fetchAddresses();
  }

  Future<void> fetchAddresses() async {
    try {
      isLoading = true;
      update();
      addresses = await _addressRepository.getAddresses();
      final selected = addresses.firstWhereOrNull((a) => a.isSelected);
      if (selected != null) {
        selectedId = selected.id;
      } else if (addresses.isNotEmpty) {
        selectedId = addresses.first.id;
      }
    } catch (_) {
      // Fallback
    } finally {
      isLoading = false;
      update();
    }
  }

  void selectAddress(String id) {
    selectedId = id;
    for (int i = 0; i < addresses.length; i++) {
      addresses[i] = addresses[i].copyWith(isSelected: addresses[i].id == id);
    }
    update();
  }

  void onAddNewAddress() async {
    final result = await Get.toNamed(AppRoutes.addAddress);
    if (result != null) {
      fetchAddresses();
    }
  }

  void onApply() {
    final selected = addresses.firstWhereOrNull((a) => a.id == selectedId) ??
        addresses.first;
    Get.back(result: selected);
  }
}
