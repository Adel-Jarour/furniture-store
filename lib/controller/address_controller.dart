import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../models/address_model.dart';

class AddressController extends GetxController {
  String selectedLabel = 'Home';
  final List<String> labels = ['Home', 'Work', 'Friend', 'Other'];
  final addressController = TextEditingController();
  final floorController = TextEditingController();
  final landmarkController = TextEditingController();
  bool isLoading = false;

  List<AddressModel> addresses = [
    const AddressModel(
        id: 'a1',
        label: 'Home',
        fullAddress: '1901 Thornridge Cir. Shiloh, Hawaii 81063',
        isSelected: true),
    const AddressModel(
        id: 'a2',
        label: 'Office',
        fullAddress: '4517 Washington Ave. Manchester, Kentucky 39495'),
    const AddressModel(
        id: 'a3',
        label: "Parent's House",
        fullAddress: '8502 Preston Rd. Inglewood, Maine 98380'),
    const AddressModel(
        id: 'a4',
        label: "Friend's House",
        fullAddress: '2464 Royal Ln. Mesa, New Jersey 45463'),
  ];

  String selectedAddressId = 'a1';

  void selectLabel(String label) {
    selectedLabel = label;
    update();
  }

  void selectAddress(String id) {
    selectedAddressId = id;
    update();
  }

  Future<void> saveAddress() async {
    isLoading = true;
    update();
    await Future.delayed(const Duration(milliseconds: 800));
    isLoading = false;
    update();
    Get.back();
  }

  @override
  void onClose() {
    addressController.dispose();
    floorController.dispose();
    landmarkController.dispose();
    super.onClose();
  }
}
