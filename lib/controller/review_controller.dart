import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../data/repository/catalog_repository.dart';
import '../models/review_model.dart';
import '../utils/app_snack_bar.dart';

class ReviewController extends GetxController {
  final CatalogRepository _repository = CatalogRepository();

  int rating = 5;
  final TextEditingController reviewTextController = TextEditingController();
  bool isSubmitting = false;

  void setRating(int newRating) {
    rating = newRating;
    update();
  }

  Future<void> submitReview() async {
    final comment = reviewTextController.text.trim();
    if (comment.isEmpty) {
      AppSnackBar.showError(
          message: 'Please write your review before submitting');
      return;
    }

    try {
      isSubmitting = true;
      update();

      final review = ReviewModel(
        id: DateTime.now().millisecondsSinceEpoch.toString(),
        productId: 'prod_1',
        rating: rating.toDouble(),
        comment: comment,
        date: 'Today',
        reviewerName: 'You',
      );

      final success = await _repository.submitReview(review);
      if (success) {
        AppSnackBar.showSuccess(
          title: 'Review Submitted',
          message: 'Thank you for your valuable feedback!',
        );
        Get.back();
      } else {
        AppSnackBar.showError(message: 'Failed to submit review');
      }
    } catch (_) {
      AppSnackBar.showError(message: 'Error submitting review');
    } finally {
      isSubmitting = false;
      update();
    }
  }

  @override
  void onClose() {
    reviewTextController.dispose();
    super.onClose();
  }
}
