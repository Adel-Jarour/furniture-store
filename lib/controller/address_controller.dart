import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../data/repository/address_repository.dart';
import '../models/address_model.dart';
import '../utils/app_snack_bar.dart';

class AddressController extends GetxController {
  final AddressRepository _repository = AddressRepository();

  String selectedLabel = 'Home';
  final List<String> labels = ['Home', 'Work', 'Friend', 'Other'];
  final addressController = TextEditingController();
  final floorController = TextEditingController();
  final landmarkController = TextEditingController();
  bool isLoading = false;

  List<AddressModel> addresses = [];
  String selectedAddressId = '1';

  @override
  void onInit() {
    super.onInit();
    fetchAddresses();
  }

  Future<void> fetchAddresses() async {
    try {
      isLoading = true;
      update();
      addresses = await _repository.getAddresses();
      final selected = addresses.firstWhereOrNull((a) => a.isSelected);
      if (selected != null) {
        selectedAddressId = selected.id;
      } else if (addresses.isNotEmpty) {
        selectedAddressId = addresses.first.id;
      }
    } catch (_) {
      AppSnackBar.showError(message: 'Failed to load addresses');
    } finally {
      isLoading = false;
      update();
    }
  }

  void selectLabel(String label) {
    selectedLabel = label;
    update();
  }

  void selectAddress(String id) {
    selectedAddressId = id;
    _repository.selectAddress(id);
    update();
  }

  Future<void> saveAddress() async {
    if (addressController.text.trim().isEmpty) {
      AppSnackBar.showError(message: 'Please enter full address');
      return;
    }

    try {
      isLoading = true;
      update();
      final newAddress = AddressModel(
        id: DateTime.now().millisecondsSinceEpoch.toString(),
        label: selectedLabel,
        fullAddress: addressController.text.trim(),
        isSelected: true,
      );
      await _repository.addAddress(newAddress);
      AppSnackBar.showSuccess(message: 'Address saved successfully');
      Get.back(result: true);
    } catch (_) {
      AppSnackBar.showError(message: 'Failed to save address');
    } finally {
      isLoading = false;
      update();
    }
  }

  @override
  void onClose() {
    addressController.dispose();
    floorController.dispose();
    landmarkController.dispose();
    super.onClose();
  }
}
