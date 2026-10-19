import '../../const/image_const.dart';
import '../../models/category_model.dart';
import '../../models/product_model.dart';
import '../../models/review_model.dart';

class CatalogRepository {
  // ── All 20 Categories from Category.png Design ─────────────
  final List<CategoryModel> _allCategories = const [
    CategoryModel(id: 'cat_sofa', title: 'Sofa', icon: 'weekend_rounded'),
    CategoryModel(id: 'cat_chair', title: 'Chair', icon: 'chair_rounded'),
    CategoryModel(id: 'cat_lamp', title: 'Lamp', icon: 'light_rounded'),
    CategoryModel(
        id: 'cat_cupboard', title: 'Cupboard', icon: 'kitchen_rounded'),
    CategoryModel(
        id: 'cat_table', title: 'Table', icon: 'table_restaurant_rounded'),
    CategoryModel(id: 'cat_bed', title: 'Bed', icon: 'bed_rounded'),
    CategoryModel(
        id: 'cat_bookcases', title: 'Bookcases', icon: 'menu_book_rounded'),
    CategoryModel(
        id: 'cat_office_chair',
        title: 'Office Chair',
        icon: 'chair_alt_rounded'),
    CategoryModel(
        id: 'cat_desk_table', title: 'Desk Table', icon: 'desk_rounded'),
    CategoryModel(
        id: 'cat_dining_table',
        title: 'Dining Table',
        icon: 'table_bar_rounded'),
    CategoryModel(
        id: 'cat_dresser', title: 'Dresser', icon: 'meeting_room_rounded'),
    CategoryModel(
        id: 'cat_rocking_chair',
        title: 'Rocking Chair',
        icon: 'airline_seat_recline_extra_rounded'),
    CategoryModel(
        id: 'cat_swing_zula',
        title: 'Swing Zula',
        icon: 'nest_cam_wired_stand_rounded'),
    CategoryModel(id: 'cat_vase', title: 'Vase', icon: 'yard_rounded'),
    CategoryModel(
        id: 'cat_mattress', title: 'Mattress', icon: 'aspect_ratio_rounded'),
    CategoryModel(id: 'cat_tv_table', title: 'TV Table', icon: 'tv_rounded'),
    CategoryModel(
        id: 'cat_drawer', title: 'Drawer', icon: 'inventory_2_rounded'),
    CategoryModel(
        id: 'cat_wall_mirror', title: 'Wall Mirror', icon: 'circle_outlined'),
    CategoryModel(id: 'cat_stool', title: 'Stool', icon: 'event_seat_rounded'),
    CategoryModel(id: 'cat_other', title: 'Other', icon: 'widgets_rounded'),
  ];

  Future<List<CategoryModel>> getAllCategories() async {
    return _allCategories;
  }

  Future<ProductModel> getProductDetails(String id) async {
    // Return design-matched Modern Sofa Chair
    return const ProductModel(
      id: 'prod_2',
      title: 'Modern Sofa Chair',
      category: 'Arm Chair',
      price: 120.00,
      originalPrice: 150.00,
      rating: 4.5,
      reviewsCount: 142,
      image: ImageConst.productSofaChair,
      description:
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua',
      isFavorite: false,
      isNew: true,
    );
  }

  Future<bool> submitReview(ReviewModel review) async {
    return true;
  }
}
