import '../../const/image_const.dart';
import '../../models/review_model.dart';

class ReviewStatsModel {
  final double averageRating;
  final int totalReviews;
  final Map<int, double> starPercentages; // 5: 0.8, 4: 0.6, etc.

  const ReviewStatsModel({
    required this.averageRating,
    required this.totalReviews,
    required this.starPercentages,
  });
}

class ReviewRepository {
  final List<ReviewModel> _mockReviews = const [
    ReviewModel(
      id: 'rev_1',
      productId: 'prod_2',
      rating: 5.0,
      comment:
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.',
      date: '11 months ago',
      reviewerName: 'Dale Thiel',
      reviewerAvatar: ImageConst.avatarProfile,
      isVerified: true,
      photos: [],
    ),
    ReviewModel(
      id: 'rev_2',
      productId: 'prod_2',
      rating: 5.0,
      comment:
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.',
      date: '11 months ago',
      reviewerName: 'Tiffany Nitzsche',
      reviewerAvatar: ImageConst.avatarProfile,
      isVerified: true,
      photos: [
        ImageConst.bannerNew,
        ImageConst.welcomeHero,
      ],
    ),
    ReviewModel(
      id: 'rev_3',
      productId: 'prod_2',
      rating: 4.0,
      comment:
          'Great build quality and very comfortable to sit on for long reading sessions.',
      date: '1 year ago',
      reviewerName: 'Robert Fox',
      reviewerAvatar: ImageConst.avatarProfile,
      isVerified: true,
      photos: [],
    ),
  ];

  Future<ReviewStatsModel> getReviewStats(String productId) async {
    return const ReviewStatsModel(
      averageRating: 4.5,
      totalReviews: 107,
      starPercentages: {
        5: 0.85,
        4: 0.60,
        3: 0.40,
        2: 0.25,
        1: 0.10,
      },
    );
  }

  Future<List<ReviewModel>> getProductReviews(String productId) async {
    return List.from(_mockReviews);
  }
}
