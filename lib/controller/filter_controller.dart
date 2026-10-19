import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FilterController extends GetxController {
  // Category section
  final List<String> categories = ['All', 'Sofa', 'Chair', 'Cupboard'];
  String selectedCategory = 'All';

  // Price range section ($50 to $400)
  RangeValues priceRange = const RangeValues(100, 350);
  final double minPrice = 50;
  final double maxPrice = 400;

  // Reviews section
  final List<String> reviewOptions = [
    '4.5 and above',
    '4.0 - 4.5',
    '3.5 - 4.0',
    '3.0 - 3.5',
    '2.5 - 3.0',
  ];
  String selectedReview = '4.5 and above';

  // Sort by section
  final List<String> sortOptions = ['All', 'Popular', 'Most Recent', 'Price'];
  String selectedSortBy = 'All';

  // For section (Room type)
  final List<String> roomOptions = ['All', 'Living Room', 'Bedroom', 'Kitchen'];
  String selectedRoom = 'All';

  void setCategory(String cat) {
    selectedCategory = cat;
    update();
  }

  void setPriceRange(RangeValues values) {
    priceRange = values;
    update();
  }

  void setReview(String review) {
    selectedReview = review;
    update();
  }

  void setSortBy(String sort) {
    selectedSortBy = sort;
    update();
  }

  void setRoom(String room) {
    selectedRoom = room;
    update();
  }

  void resetFilters() {
    selectedCategory = 'All';
    priceRange = const RangeValues(100, 350);
    selectedReview = '4.5 and above';
    selectedSortBy = 'All';
    selectedRoom = 'All';
    update();
  }

  void applyFilters() {
    Get.back(result: {
      'category': selectedCategory,
      'minPrice': priceRange.start,
      'maxPrice': priceRange.end,
      'review': selectedReview,
      'sortBy': selectedSortBy,
      'room': selectedRoom,
    });
  }
}
