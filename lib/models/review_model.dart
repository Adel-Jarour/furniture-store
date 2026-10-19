class ReviewModel {
  final String id;
  final String productId;
  final double rating;
  final String comment;
  final String date;
  final String reviewerName;
  final String reviewerAvatar;
  final List<String> photos;

  const ReviewModel({
    required this.id,
    required this.productId,
    required this.rating,
    required this.comment,
    required this.date,
    required this.reviewerName,
    this.reviewerAvatar = '',
    this.photos = const [],
  });

  factory ReviewModel.fromJson(Map<String, dynamic> json) {
    return ReviewModel(
      id: json['id']?.toString() ?? '',
      productId: json['product_id']?.toString() ?? '',
      rating: (json['rating'] as num?)?.toDouble() ?? 5.0,
      comment: json['comment']?.toString() ?? '',
      date: json['date']?.toString() ?? '',
      reviewerName: json['reviewer_name']?.toString() ?? '',
      reviewerAvatar: json['reviewer_avatar']?.toString() ?? '',
      photos:
          (json['photos'] as List?)?.map((e) => e.toString()).toList() ?? [],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'product_id': productId,
      'rating': rating,
      'comment': comment,
      'date': date,
      'reviewer_name': reviewerName,
      'reviewer_avatar': reviewerAvatar,
      'photos': photos,
    };
  }
}
