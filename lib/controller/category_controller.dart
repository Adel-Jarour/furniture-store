import 'package:get/get.dart';
import '../data/repository/catalog_repository.dart';
import '../models/category_model.dart';

class CategoryController extends GetxController {
  final CatalogRepository _repository = CatalogRepository();

  bool isLoading = false;
  List<CategoryModel> categories = [];

  @override
  void onInit() {
    super.onInit();
    fetchCategories();
  }

  Future<void> fetchCategories() async {
    isLoading = true;
    update();

    categories = await _repository.getAllCategories();

    isLoading = false;
    update();
  }
}
