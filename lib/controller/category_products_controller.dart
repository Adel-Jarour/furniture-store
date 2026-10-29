import 'package:get/get.dart';
import '../data/repository/catalog_repository.dart';
import '../models/product_model.dart';
import '../routes/app_routes.dart';

class CategoryProductsController extends GetxController {
  final CatalogRepository _catalogRepository = CatalogRepository();

  String categoryName = 'Chair';
  bool isLoading = false;
  List<ProductModel> products = [];

  @override
  void onInit() {
    super.onInit();
    final args = Get.arguments;
    if (args is Map && args['categoryName'] != null) {
      categoryName = args['categoryName'].toString();
    } else if (args is String && args.isNotEmpty) {
      categoryName = args;
    }
    fetchProducts();
  }

  Future<void> fetchProducts() async {
    try {
      isLoading = true;
      update();
      products = await _catalogRepository.getProductsByCategory(categoryName);
    } catch (_) {
      // Fallback
    } finally {
      isLoading = false;
      update();
    }
  }

  void toggleFavorite(int index) {
    if (index >= 0 && index < products.length) {
      final current = products[index];
      products[index] = current.copyWith(isFavorite: !current.isFavorite);
      update();
    }
  }

  void openProductDetails(ProductModel product) {
    Get.toNamed(AppRoutes.productDetails, arguments: product);
  }
}
