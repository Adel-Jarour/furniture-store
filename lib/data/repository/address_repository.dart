import '../../models/address_model.dart';

class AddressRepository {
  final List<AddressModel> _mockAddresses = [
    const AddressModel(
      id: '1',
      label: 'Home',
      fullAddress: '2095 Barefoot Bay, Florida 32909, USA',
      isSelected: true,
    ),
    const AddressModel(
      id: '2',
      label: 'Office',
      fullAddress: '702 South Shore, Austin, Texas 78741, USA',
      isSelected: false,
    ),
    const AddressModel(
      id: '3',
      label: 'Apartment',
      fullAddress: '1540 Ocean Ave, Brooklyn, New York 11230, USA',
      isSelected: false,
    ),
    const AddressModel(
      id: '4',
      label: "Parent's House",
      fullAddress: '312 Elm Street, Denver, Colorado 80202, USA',
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
