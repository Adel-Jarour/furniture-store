import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../const/image_const.dart';
import '../models/product_model.dart';
import '../routes/app_routes.dart';
import '../utils/app_snack_bar.dart';

class ColorSwatchOption {
  final String name;
  final Color color;

  const ColorSwatchOption({required this.name, required this.color});
}

class ProductDetailsController extends GetxController {
  late ProductModel product;
  bool isFavorite = false;
  int quantity = 1;
  int activeThumbnailIndex = 0;

  final List<ColorSwatchOption> colorOptions = const [
    ColorSwatchOption(name: 'Slate Teal', color: Color(0xFF2D4F4F)),
    ColorSwatchOption(name: 'Black', color: Color(0xFF1A1A1A)),
    ColorSwatchOption(name: 'Brown', color: Color(0xFF5A3831)),
    ColorSwatchOption(name: 'Purple', color: Color(0xFF443B52)),
    ColorSwatchOption(name: 'Olive', color: Color(0xFF596041)),
  ];
  int selectedColorIndex = 2; // Default 'Brown' as in Figma

  final List<String> thumbnails = const [
    ImageConst.productSofaChair,
    ImageConst.productArmChair,
    ImageConst.productWoodChair,
    ImageConst.productGreyChair,
    ImageConst.productSofaChair,
  ];

  @override
  void onInit() {
    super.onInit();
    final args = Get.arguments;
    if (args is ProductModel) {
      product = args;
      isFavorite = args.isFavorite;
    } else {
      // Default product from Figma design
      product = const ProductModel(
        id: 'prod_sofa_chair',
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
      );
    }
  }

  String get selectedColorName => colorOptions[selectedColorIndex].name;

  void selectColor(int index) {
    selectedColorIndex = index;
    update();
  }

  void selectThumbnail(int index) {
    activeThumbnailIndex = index;
    update();
  }

  void toggleFavorite() {
    isFavorite = !isFavorite;
    update();
    AppSnackBar.showSuccess(
      title: isFavorite ? 'Added to Wishlist' : 'Removed from Wishlist',
      message:
          '${product.title} ${isFavorite ? "added to" : "removed from"} your wishlist.',
    );
  }

  void incrementQuantity() {
    quantity++;
    update();
  }

  void decrementQuantity() {
    if (quantity > 1) {
      quantity--;
      update();
    }
  }

  void addToCart() {
    AppSnackBar.showSuccess(
      title: 'Added to Cart',
      message:
          '${product.title} ($selectedColorName) has been added to your cart!',
    );
    Get.toNamed(AppRoutes.cart);
  }
}
