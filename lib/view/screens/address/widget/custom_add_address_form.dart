import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../controller/address_controller.dart';
import 'custom_address_form_field.dart';
import 'custom_address_label_chips.dart';

class CustomAddAddressForm extends StatelessWidget {
  final AddressController controller;

  const CustomAddAddressForm({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomAddressLabelChips(
          labels: controller.labels,
          selectedLabel: controller.selectedLabel,
          onSelected: controller.selectLabel,
        ),
        SizedBox(height: 16.h),
        CustomAddressFormField(
          label: 'Address Details',
          controller: controller.addressController,
          hint: 'Street name, Apartment/Suite number',
          maxLines: 2,
        ),
        SizedBox(height: 14.h),
        CustomAddressFormField(
          label: 'Floor / Unit (Optional)',
          controller: controller.floorController,
          hint: 'e.g. 4th floor, unit 402',
        ),
        SizedBox(height: 14.h),
        CustomAddressFormField(
          label: 'Landmark (Optional)',
          controller: controller.landmarkController,
          hint: 'e.g. Near Central Park',
        ),
      ],
    );
  }
}
