import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../data/repository/review_repository.dart';
import '../models/review_model.dart';
import '../routes/app_routes.dart';

class ProductReviewsController extends GetxController {
  final ReviewRepository _reviewRepository = ReviewRepository();

  bool isLoading = false;
  ReviewStatsModel? stats;
  List<ReviewModel> allReviews = [];
  List<ReviewModel> displayedReviews = [];

  final TextEditingController searchController = TextEditingController();
  final Set<String> activeFilters = {'Verified', 'Latest'};

  @override
  void onInit() {
    super.onInit();
    fetchReviews();
  }

  Future<void> fetchReviews() async {
    try {
      isLoading = true;
      update();
      stats = await _reviewRepository.getReviewStats('prod_2');
      allReviews = await _reviewRepository.getProductReviews('prod_2');
      _applyFilters();
    } catch (_) {
      // Fallback
    } finally {
      isLoading = false;
      update();
    }
  }

  void onSearchChanged(String query) {
    _applyFilters();
  }

  void toggleFilter(String filter) {
    if (activeFilters.contains(filter)) {
      activeFilters.remove(filter);
    } else {
      activeFilters.add(filter);
    }
    _applyFilters();
  }

  void _applyFilters() {
    final query = searchController.text.trim().toLowerCase();
    displayedReviews = allReviews.where((review) {
      final matchesSearch = query.isEmpty ||
          review.comment.toLowerCase().contains(query) ||
          review.reviewerName.toLowerCase().contains(query);

      final matchesVerified =
          !activeFilters.contains('Verified') || review.isVerified;
      final matchesDetailed = !activeFilters.contains('Detailed Reviews') ||
          review.photos.isNotEmpty;

      return matchesSearch && matchesVerified && matchesDetailed;
    }).toList();
    update();
  }

  void onWriteReview() async {
    final result = await Get.toNamed(AppRoutes.leaveReview);
    if (result == true) {
      fetchReviews();
    }
  }

  @override
  void onClose() {
    searchController.dispose();
    super.onClose();
  }
}
