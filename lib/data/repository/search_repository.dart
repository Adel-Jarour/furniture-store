import '../../const/image_const.dart';
import '../../models/location_result_model.dart';
import '../../models/product_model.dart';

class SearchRepository {
  final List<String> _recentSearches = [
    'Sofa Chair',
    'Arm Chair',
    'Wood Chair',
  ];

  final List<ProductModel> _mockRecentViews = const [
    ProductModel(
      id: 'rv_1',
      title: 'Arm Chair',
      category: 'Chair',
      price: 180.0,
      rating: 4.9,
      image: ImageConst.productArmChair,
      description: 'Comfortable modern arm chair with solid wood legs.',
    ),
    ProductModel(
      id: 'rv_2',
      title: 'Sofa Chair',
      category: 'Chair',
      price: 120.0,
      rating: 5.0,
      image: ImageConst.productSofaChair,
      description: 'Plaid patterned cozy sofa chair.',
    ),
    ProductModel(
      id: 'rv_3',
      title: 'Wood Chair',
      category: 'Chair',
      price: 110.0,
      rating: 4.9,
      image: ImageConst.productWoodChair,
      description: 'Minimalist ergonomic wooden dining chair.',
    ),
    ProductModel(
      id: 'rv_4',
      title: 'Grey Chair',
      category: 'Chair',
      price: 120.0,
      rating: 5.0,
      image: ImageConst.productGreyChair,
      description: 'Deep cushion plush grey lounge chair.',
    ),
  ];

  final List<ProductModel> _mockSearchResults = const [
    ProductModel(
      id: 'sr_1',
      title: 'Arm Chair',
      category: 'Chair',
      price: 180.0,
      rating: 4.9,
      image: ImageConst.productArmChair,
      isFavorite: false,
    ),
    ProductModel(
      id: 'sr_2',
      title: 'Sofa Chair',
      category: 'Chair',
      price: 120.0,
      rating: 5.0,
      image: ImageConst.productSofaChair,
      isFavorite: false,
    ),
    ProductModel(
      id: 'sr_3',
      title: 'Wood Chair',
      category: 'Chair',
      price: 110.0,
      rating: 4.9,
      image: ImageConst.productWoodChair,
      isFavorite: false,
    ),
    ProductModel(
      id: 'sr_4',
      title: 'Grey Chair',
      category: 'Chair',
      price: 200.0,
      rating: 5.0,
      image: ImageConst.productGreyChair,
      isFavorite: false,
    ),
    ProductModel(
      id: 'sr_5',
      title: 'Sofa Chair',
      category: 'Chair',
      price: 180.0,
      rating: 4.9,
      image: ImageConst.sofaComfort,
      isFavorite: false,
    ),
    ProductModel(
      id: 'sr_6',
      title: 'Wood Chair',
      category: 'Chair',
      price: 130.0,
      rating: 5.0,
      image: ImageConst.chairModern,
      isFavorite: false,
    ),
  ];

  final List<LocationResultModel> _mockLocations = const [
    LocationResultModel(
      id: 'loc_1',
      title: 'Golden Avenue',
      address: '8502 Preston Rd. Ingl..',
      latitude: 37.7749,
      longitude: -122.4194,
    ),
    LocationResultModel(
      id: 'loc_2',
      title: 'Golden Square Park',
      address: '2464 Royal Ln. Mesa, New Jersey..',
      latitude: 37.7849,
      longitude: -122.4094,
    ),
    LocationResultModel(
      id: 'loc_3',
      title: 'Golden Gate Bridge Rd',
      address: '1901 Thornridge Cir. Shiloh, Hawaii..',
      latitude: 37.7949,
      longitude: -122.3994,
    ),
  ];

  Future<List<String>> getRecentSearches() async {
    return List.from(_recentSearches);
  }

  Future<void> removeRecentSearch(String keyword) async {
    _recentSearches.remove(keyword);
  }

  Future<void> addRecentSearch(String keyword) async {
    if (keyword.trim().isEmpty) return;
    _recentSearches.remove(keyword);
    _recentSearches.insert(0, keyword);
  }

  Future<List<ProductModel>> getRecentViews() async {
    return List.from(_mockRecentViews);
  }

  Future<List<ProductModel>> searchProducts(String query) async {
    if (query.trim().isEmpty) return [];
    final lower = query.toLowerCase();
    return _mockSearchResults.where((p) {
      return p.title.toLowerCase().contains(lower) ||
          p.category.toLowerCase().contains(lower);
    }).toList();
  }

  Future<List<LocationResultModel>> searchLocations(String query) async {
    if (query.trim().isEmpty) return _mockLocations;
    final lower = query.toLowerCase();
    return _mockLocations.where((loc) {
      return loc.title.toLowerCase().contains(lower) ||
          loc.address.toLowerCase().contains(lower);
    }).toList();
  }
}
