class BannerModel {
  final String id;
  final String title;
  final String subtitle;
  final String buttonText;
  final String image;

  const BannerModel({
    required this.id,
    required this.title,
    required this.subtitle,
    this.buttonText = 'Shop Now',
    required this.image,
  });

  factory BannerModel.fromJson(Map<String, dynamic> json) {
    return BannerModel(
      id: json['id']?.toString() ?? '',
      title: json['title']?.toString() ?? '',
      subtitle: json['subtitle']?.toString() ?? '',
      buttonText: json['button_text']?.toString() ?? 'Shop Now',
      image: json['image']?.toString() ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'subtitle': subtitle,
      'button_text': buttonText,
      'image': image,
    };
  }
}
