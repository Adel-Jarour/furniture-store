import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../routes/app_routes.dart';
import '../utils/app_snack_bar.dart';
import '../utils/my_shared_pref.dart';

class LocationController extends GetxController {
  final TextEditingController searchController = TextEditingController();

  final List<String> allLocations = const [
    'Brooklyn, New York, USA',
    'Manhattan, New York, USA',
    'Queens, New York, USA',
    'Austin, Texas, USA',
    'Los Angeles, California, USA',
    'Chicago, Illinois, USA',
    'San Francisco, California, USA',
    'Miami, Florida, USA',
    'Seattle, Washington, USA',
  ];

  List<String> filteredLocations = [];
  bool isDetecting = false;

  @override
  void onInit() {
    super.onInit();
    filteredLocations = List.from(allLocations);
    searchController.addListener(_onSearchChanged);
  }

  void _onSearchChanged() {
    final query = searchController.text.toLowerCase().trim();
    if (query.isEmpty) {
      filteredLocations = List.from(allLocations);
    } else {
      filteredLocations = allLocations
          .where((loc) => loc.toLowerCase().contains(query))
          .toList();
    }
    update();
  }

  Future<void> allowLocationAccess() async {
    isDetecting = true;
    update();

    // Simulate location service detection
    await Future.delayed(const Duration(milliseconds: 1000));
    const detected = 'Brooklyn, New York, USA';
    await selectLocation(detected);

    isDetecting = false;
    update();
  }

  Future<void> selectLocation(String location) async {
    await MySharedPref.setSelectedLocation(location);
    AppSnackBar.showSuccess(
      title: 'Location Set',
      message: 'Delivering to $location',
    );

    if (MySharedPref.isLoggedIn()) {
      Get.offAllNamed(AppRoutes.bottomNav);
    } else {
      Get.offAllNamed(AppRoutes.login);
    }
  }

  @override
  void onClose() {
    searchController.dispose();
    super.onClose();
  }
}
