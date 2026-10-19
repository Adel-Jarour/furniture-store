class LocationResultModel {
  final String id;
  final String title;
  final String address;
  final double? latitude;
  final double? longitude;

  const LocationResultModel({
    required this.id,
    required this.title,
    required this.address,
    this.latitude,
    this.longitude,
  });

  factory LocationResultModel.fromJson(Map<String, dynamic> json) {
    return LocationResultModel(
      id: json['id']?.toString() ?? '',
      title: json['title']?.toString() ?? '',
      address: json['address']?.toString() ?? '',
      latitude: (json['latitude'] as num?)?.toDouble(),
      longitude: (json['longitude'] as num?)?.toDouble(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'address': address,
      'latitude': latitude,
      'longitude': longitude,
    };
  }
}
