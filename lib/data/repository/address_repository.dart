import '../../models/address_model.dart';

class AddressRepository {
  final List<AddressModel> _mockAddresses = [
    const AddressModel(
      id: '1',
      label: 'Home',
      fullAddress: '1901 Thornridge Cir. Shiloh, Hawaii 81063',
      isSelected: true,
    ),
    const AddressModel(
      id: '2',
      label: 'Office',
      fullAddress: '4517 Washington Ave. Manchester, Kentucky 39495',
      isSelected: false,
    ),
    const AddressModel(
      id: '3',
      label: "Parent's House",
      fullAddress: '8502 Preston Rd. Inglewood, Maine 98380',
      isSelected: false,
    ),
    const AddressModel(
      id: '4',
      label: "Friend's House",
      fullAddress: '2464 Royal Ln. Mesa, New Jersey 45463',
      isSelected: false,
    ),
  ];

  Future<List<AddressModel>> getAddresses() async {
    return List.from(_mockAddresses);
  }

  Future<bool> addAddress(AddressModel address) async {
    _mockAddresses.add(address);
    return true;
  }

  Future<bool> selectAddress(String id) async {
    for (int i = 0; i < _mockAddresses.length; i++) {
      final item = _mockAddresses[i];
      _mockAddresses[i] = AddressModel(
        id: item.id,
        label: item.label,
        fullAddress: item.fullAddress,
        isSelected: item.id == id,
      );
    }
    return true;
  }
}
