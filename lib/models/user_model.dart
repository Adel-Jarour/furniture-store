class UserModel {
  final String id;
  final String name;
  final String email;
  final String? phone;
  final String? avatarUrl;
  final String? address;

  const UserModel({
    required this.id,
    required this.name,
    required this.email,
    this.phone,
    this.avatarUrl,
    this.address,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id']?.toString() ?? '',
      name: json['name']?.toString() ?? '',
      email: json['email']?.toString() ?? '',
      phone: json['phone']?.toString(),
      avatarUrl: json['avatarUrl'] ?? json['avatar_url'],
      address: json['address']?.toString(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'email': email,
      'phone': phone,
      'avatar_url': avatarUrl,
      'address': address,
    };
  }

  UserModel copyWith({
    String? id,
    String? name,
    String? email,
    String? phone,
    String? avatarUrl,
    String? address,
  }) {
    return UserModel(
      id: id ?? this.id,
      name: name ?? this.name,
      email: email ?? this.email,
      phone: phone ?? this.phone,
      avatarUrl: avatarUrl ?? this.avatarUrl,
      address: address ?? this.address,
    );
  }
}
