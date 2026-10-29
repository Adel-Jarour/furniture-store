import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../controller/shipping_address_controller.dart';
import 'widget/custom_add_address_dashed_card.dart';
import 'widget/custom_apply_address_bottom_bar.dart';
import 'widget/custom_shipping_address_tile.dart';
import 'widget/custom_shipping_address_top_bar.dart';

class ShippingAddressScreen extends StatelessWidget {
  const ShippingAddressScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ShippingAddressController>(
      init: ShippingAddressController(),
      builder: (controller) {
        return Scaffold(
          backgroundColor: Colors.white,
          body: SafeArea(
            child: Column(
              children: [
                const CustomShippingAddressTopBar(),
                Expanded(
                  child: controller.isLoading
                      ? const Center(child: CircularProgressIndicator())
                      : ListView(
                          children: [
                            ...controller.addresses.map((address) {
                              return CustomShippingAddressTile(
                                address: address,
                                isSelected: address.id == controller.selectedId,
                                onSelect: () =>
                                    controller.selectAddress(address.id),
                              );
                            }),
                            CustomAddAddressDashedCard(
                              onTap: controller.onAddNewAddress,
                            ),
                          ],
                        ),
                ),
                CustomApplyAddressBottomBar(
                  onApply: controller.onApply,
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
