import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../data/repository/search_repository.dart';
import '../models/product_model.dart';

class ProductSearchController extends GetxController {
  final SearchRepository _repository = SearchRepository();
  final TextEditingController searchController = TextEditingController();

  List<String> recentSearches = [];
  List<ProductModel> recentViews = [];
  List<ProductModel> searchResults = [];

  String query = '';
  bool isLoading = false;

  bool get isShowingResults => query.trim().isNotEmpty;

  @override
  void onInit() {
    super.onInit();
    loadInitialData();
  }

  Future<void> loadInitialData() async {
    isLoading = true;
    recentSearches = await _repository.getRecentSearches();
    recentViews = await _repository.getRecentViews();
    isLoading = false;
    update();
  }

  void onSearchChanged(String val) {
    query = val;
    if (query.trim().isEmpty) {
      searchResults = [];
      update();
    } else {
      executeSearch(query);
    }
  }

  Future<void> executeSearch(String searchTerm) async {
    final trimmed = searchTerm.trim();
    if (trimmed.isEmpty) {
      query = '';
      searchResults = [];
      update();
      return;
    }

    query = trimmed;
    searchController.text = trimmed;
    searchController.selection = TextSelection.fromPosition(
      TextPosition(offset: searchController.text.length),
    );

    isLoading = true;
    update();

    await _repository.addRecentSearch(trimmed);
    recentSearches = await _repository.getRecentSearches();
    searchResults = await _repository.searchProducts(trimmed);

    isLoading = false;
    update();
  }

  void clearSearch() {
    searchController.clear();
    query = '';
    searchResults = [];
    update();
  }

  Future<void> removeRecentSearch(String keyword) async {
    await _repository.removeRecentSearch(keyword);
    recentSearches = await _repository.getRecentSearches();
    update();
  }

  void toggleFavorite(String productId) {
    final index = searchResults.indexWhere((p) => p.id == productId);
    if (index != -1) {
      final item = searchResults[index];
      searchResults[index] = item.copyWith(isFavorite: !item.isFavorite);
      update();
    }
  }

  @override
  void onClose() {
    searchController.dispose();
    super.onClose();
  }
}
