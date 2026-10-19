class AddressModel {
  final String id;
  final String label;
  final String fullAddress;
  final bool isSelected;

  const AddressModel({
    required this.id,
    required this.label,
    required this.fullAddress,
    this.isSelected = false,
  });

  AddressModel copyWith({bool? isSelected}) => AddressModel(
        id: id,
        label: label,
        fullAddress: fullAddress,
        isSelected: isSelected ?? this.isSelected,
      );

  factory AddressModel.fromJson(Map<String, dynamic> json) {
    return AddressModel(
      id: json['id']?.toString() ?? '',
      label: json['label']?.toString() ?? 'Home',
      fullAddress: json['fullAddress']?.toString() ??
          json['full_address']?.toString() ??
          '',
      isSelected:
          json['isSelected'] as bool? ?? json['is_selected'] as bool? ?? false,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'label': label,
      'fullAddress': fullAddress,
      'isSelected': isSelected,
    };
  }
}
