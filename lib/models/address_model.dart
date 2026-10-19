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
}
