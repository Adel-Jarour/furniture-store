class ProductModel {
  final String id;
  final String title;
  final String category;
  final double price;
  final double? originalPrice;
  final double rating;
  final int reviewsCount;
  final String image;
  final String description;
  final bool isFavorite;
  final bool isNew;
  final bool inStock;

  const ProductModel({
    required this.id,
    required this.title,
    required this.category,
    required this.price,
    this.originalPrice,
    this.rating = 5.0,
    this.reviewsCount = 0,
    required this.image,
    this.description = '',
    this.isFavorite = false,
    this.isNew = false,
    this.inStock = true,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      id: json['id']?.toString() ?? '',
      title: json['title']?.toString() ?? '',
      category: json['category']?.toString() ?? '',
      price: (json['price'] as num?)?.toDouble() ?? 0.0,
      originalPrice: (json['original_price'] as num?)?.toDouble(),
      rating: (json['rating'] as num?)?.toDouble() ?? 5.0,
      reviewsCount: (json['reviews_count'] as num?)?.toInt() ?? 0,
      image: json['image']?.toString() ?? '',
      description: json['description']?.toString() ?? '',
      isFavorite: json['is_favorite'] as bool? ?? false,
      isNew: json['is_new'] as bool? ?? false,
      inStock: json['in_stock'] as bool? ?? true,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'category': category,
      'price': price,
      'original_price': originalPrice,
      'rating': rating,
      'reviews_count': reviewsCount,
      'image': image,
      'description': description,
      'is_favorite': isFavorite,
      'is_new': isNew,
      'in_stock': inStock,
    };
  }

  ProductModel copyWith({
    String? id,
    String? title,
    String? category,
    double? price,
    double? originalPrice,
    double? rating,
    int? reviewsCount,
    String? image,
    String? description,
    bool? isFavorite,
    bool? isNew,
    bool? inStock,
  }) {
    return ProductModel(
      id: id ?? this.id,
      title: title ?? this.title,
      category: category ?? this.category,
      price: price ?? this.price,
      originalPrice: originalPrice ?? this.originalPrice,
      rating: rating ?? this.rating,
      reviewsCount: reviewsCount ?? this.reviewsCount,
      image: image ?? this.image,
      description: description ?? this.description,
      isFavorite: isFavorite ?? this.isFavorite,
      isNew: isNew ?? this.isNew,
      inStock: inStock ?? this.inStock,
    );
  }
}
