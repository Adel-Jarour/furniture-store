import '../../const/image_const.dart';
import '../../models/banner_model.dart';
import '../../models/category_model.dart';
import '../../models/chat_item_model.dart';
import '../../models/product_model.dart';

class HomeRepository {
  // ── Default Mock / Offline Banners ─────────────────────────
  final List<BannerModel> _mockBanners = const [
    BannerModel(
      id: 'banner_1',
      title: 'New Collection',
      subtitle: 'Discount 50% for\nthe first transaction',
      buttonText: 'Shop Now',
      image: ImageConst.bannerNewCollection,
    ),
  ];

  // ── Default Mock / Offline Categories from Design ─────────
  final List<CategoryModel> _mockCategories = const [
    CategoryModel(id: 'cat_sofa', title: 'Sofa', icon: 'weekend_rounded'),
    CategoryModel(id: 'cat_chair', title: 'Chair', icon: 'chair_rounded'),
    CategoryModel(id: 'cat_lamp', title: 'Lamp', icon: 'light_rounded'),
    CategoryModel(
        id: 'cat_cupboard', title: 'Cupboard', icon: 'kitchen_rounded'),
  ];

  // ── Default Mock / Offline Products from Design ───────────
  final List<ProductModel> _mockProducts = const [
    ProductModel(
      id: 'prod_1',
      title: 'Arm Chair',
      category: 'Chair',
      price: 180.00,
      rating: 4.9,
      reviewsCount: 124,
      image: ImageConst.productArmChair,
      description: 'Ergonomic contemporary armchair with premium cushion.',
      isFavorite: false,
      isNew: true,
    ),
    ProductModel(
      id: 'prod_2',
      title: 'Sofa Chair',
      category: 'Chair',
      price: 120.00,
      rating: 5.0,
      reviewsCount: 98,
      image: ImageConst.productSofaChair,
      description: 'Checkered designer sofa accent chair with solid oak legs.',
      isFavorite: false,
      isNew: true,
    ),
    ProductModel(
      id: 'prod_3',
      title: 'Wood Chair',
      category: 'Chair',
      price: 180.00,
      rating: 4.9,
      reviewsCount: 86,
      image: ImageConst.productWoodChair,
      description: 'Minimalist wooden chair with natural walnut finish.',
      isFavorite: false,
      isNew: false,
    ),
    ProductModel(
      id: 'prod_4',
      title: 'Grey Chair',
      category: 'Chair',
      price: 120.00,
      rating: 5.0,
      reviewsCount: 142,
      image: ImageConst.productGreyChair,
      description: 'Classic oversized lounge grey armchair.',
      isFavorite: false,
      isNew: false,
    ),
  ];

  // ── Default Mock / Offline Chats from Design ──────────────
  final List<ChatItemModel> _mockChats = const [
    ChatItemModel(
      id: 'chat_1',
      senderName: 'Carla Schoen',
      lastMessage: 'Perfect, will check it',
      time: '09:34 PM',
      avatar: 'assets/images/avatar_profile.png',
      isOnline: true,
    ),
    ChatItemModel(
      id: 'chat_2',
      senderName: 'Sheila Lemke',
      lastMessage: 'Thanks',
      time: '09:34 PM',
      avatar: 'assets/images/avatar_profile.png',
      isOnline: true,
    ),
    ChatItemModel(
      id: 'chat_3',
      senderName: 'Deanna Botsford V',
      lastMessage: 'Welcome!',
      time: '09:34 PM',
      avatar: 'assets/images/avatar_profile.png',
      isOnline: false,
    ),
    ChatItemModel(
      id: 'chat_4',
      senderName: 'Mr. Katie Bergnaum',
      lastMessage: 'Good Morning!',
      time: '09:34 PM',
      avatar: 'assets/images/avatar_profile.png',
      isOnline: true,
    ),
    ChatItemModel(
      id: 'chat_5',
      senderName: 'Armando Ferry',
      lastMessage: 'Share Image Please!',
      time: '09:34 PM',
      avatar: 'assets/images/avatar_profile.png',
      isOnline: false,
    ),
    ChatItemModel(
      id: 'chat_6',
      senderName: 'Annette Fritsch',
      lastMessage: 'Thanks!',
      time: '09:34 PM',
      avatar: 'assets/images/avatar_profile.png',
      isOnline: true,
    ),
  ];

  Future<List<BannerModel>> getBanners() async {
    return _mockBanners;
  }

  Future<List<CategoryModel>> getCategories() async {
    return _mockCategories;
  }

  Future<List<ProductModel>> getPopularProducts() async {
    return _mockProducts;
  }

  Future<List<ChatItemModel>> getChats() async {
    return _mockChats;
  }
}
