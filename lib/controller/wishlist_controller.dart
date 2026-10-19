import 'package:get/get.dart';
import '../data/repository/home_repository.dart';
import '../models/product_model.dart';

class WishlistController extends GetxController {
  final HomeRepository _repository = HomeRepository();

  final List<String> categories = ['All', 'Chair', 'Sofa', 'Lamp', 'Cupboard'];
  String selectedCategory = 'Chair'; // matches active chip in Figma design

  List<ProductModel> wishlistItems = [];

  @override
  void onInit() {
    super.onInit();
    loadWishlist();
  }

  Future<void> loadWishlist() async {
    final all = await _repository.getPopularProducts();
    // In Wishlist, all items have isFavorite = true
    wishlistItems = all.map((p) => p.copyWith(isFavorite: true)).toList();
    update();
  }

  void selectCategory(String cat) {
    selectedCategory = cat;
    update();
  }

  void toggleFavorite(String productId) {
    final index = wishlistItems.indexWhere((p) => p.id == productId);
    if (index != -1) {
      final item = wishlistItems[index];
      if (item.isFavorite) {
        wishlistItems.removeAt(index);
      } else {
        wishlistItems[index] = item.copyWith(isFavorite: true);
      }
      update();
    }
  }
}
