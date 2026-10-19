import '../../models/address_model.dart';
import '../api/address_api.dart';

class AddressRepository {
  final AddressApi _api = AddressApi();

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
    try {
      final response = await _api.getAddresses();
      if (response != null && response.data != null) {
        final List list = response.data['data'] ?? [];
        return list.map((json) => AddressModel.fromJson(json)).toList();
      }
    } catch (_) {}
    return List.from(_mockAddresses);
  }

  Future<bool> addAddress(AddressModel address) async {
    try {
      final response = await _api.addAddress(address.toJson());
      if (response != null && response.statusCode == 200) {
        return true;
      }
    } catch (_) {}
    _mockAddresses.add(address);
    return true;
  }

  Future<bool> selectAddress(String id) async {
    try {
      await _api.selectAddress(id);
      return true;
    } catch (_) {
      return true;
    }
  }
}
