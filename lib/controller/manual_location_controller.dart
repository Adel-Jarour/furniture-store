import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../data/repository/search_repository.dart';
import '../models/location_result_model.dart';
import '../utils/app_snack_bar.dart';

class ManualLocationController extends GetxController {
  final SearchRepository _repository = SearchRepository();
  final TextEditingController searchController =
      TextEditingController(text: 'Golden Avenue');

  List<LocationResultModel> results = [];
  bool isLoading = false;
  String query = 'Golden Avenue';

  @override
  void onInit() {
    super.onInit();
    searchLocations(query);
  }

  Future<void> searchLocations(String val) async {
    query = val;
    isLoading = true;
    update();
    results = await _repository.searchLocations(val);
    isLoading = false;
    update();
  }

  void clearSearch() {
    searchController.clear();
    query = '';
    searchLocations('');
  }

  void selectLocation(LocationResultModel location) {
    AppSnackBar.showSuccess(message: 'Selected: ${location.title}');
    Get.back(result: location);
  }

  void useCurrentLocation() {
    AppSnackBar.showSuccess(message: 'Using current GPS location');
    Get.back(
        result: const LocationResultModel(
      id: 'current_loc',
      title: 'Current Location',
      address: 'Near Golden Avenue, San Francisco',
    ));
  }

  @override
  void onClose() {
    searchController.dispose();
    super.onClose();
  }
}
