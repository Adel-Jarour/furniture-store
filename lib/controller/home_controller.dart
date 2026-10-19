import 'dart:async';
import 'package:get/get.dart';
import '../data/repository/home_repository.dart';
import '../models/banner_model.dart';
import '../models/category_model.dart';
import '../models/product_model.dart';

class HomeController extends GetxController {
  final HomeRepository _repository = HomeRepository();

  bool isLoading = false;
  String currentLocation = 'New York, USA';

  List<BannerModel> banners = [];
  int currentBannerIndex = 2; // matches 3rd active dot in Figma design

  List<CategoryModel> categories = [];
  int selectedCategoryIndex = -1;

  // Flash Sale state
  final List<String> flashSaleFilters = ['All', 'Newest', 'Popular', 'Bedroom'];
  String selectedFilter = 'Newest';

  // Live countdown timer for Flash sale
  int remainingSeconds = (2 * 3600) + (12 * 60) + 56;
  Timer? _timer;

  List<ProductModel> products = [];

  @override
  void onInit() {
    super.onInit();
    fetchData();
    _startCountdown();
  }

  void _startCountdown() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (remainingSeconds > 0) {
        remainingSeconds--;
        update();
      } else {
        _timer?.cancel();
      }
    });
  }

  String get hoursString =>
      (remainingSeconds ~/ 3600).toString().padLeft(2, '0');
  String get minutesString =>
      ((remainingSeconds % 3600) ~/ 60).toString().padLeft(2, '0');
  String get secondsString =>
      (remainingSeconds % 60).toString().padLeft(2, '0');

  Future<void> fetchData() async {
    isLoading = true;
    update();

    try {
      final bannerResults = await _repository.getBanners();
      final categoryResults = await _repository.getCategories();
      final productResults = await _repository.getPopularProducts();

      banners = bannerResults;
      categories = categoryResults;
      products = productResults;
    } catch (_) {
    } finally {
      isLoading = false;
      update();
    }
  }

  void onBannerChanged(int index) {
    currentBannerIndex = index;
    update();
  }

  void selectCategory(int index) {
    selectedCategoryIndex = selectedCategoryIndex == index ? -1 : index;
    update();
  }

  void selectFilter(String filter) {
    selectedFilter = filter;
    update();
  }

  void toggleFavorite(String productId) {
    final index = products.indexWhere((p) => p.id == productId);
    if (index != -1) {
      final item = products[index];
      products[index] = item.copyWith(isFavorite: !item.isFavorite);
      update();
    }
  }

  @override
  void onClose() {
    _timer?.cancel();
    super.onClose();
  }
}
