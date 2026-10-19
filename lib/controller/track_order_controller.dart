import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../const/image_const.dart';
import '../models/order_model.dart';
import '../models/product_model.dart';

class TrackOrderController extends GetxController {
  late OrderModel order;

  @override
  void onInit() {
    super.onInit();
    final args = Get.arguments;
    if (args is OrderModel) {
      order = args;
    } else {
      order = const OrderModel(
        id: 'ord_act_1',
        orderNumber: 'TRK452126542',
        product: ProductModel(
          id: 'prod_arm_chair',
          title: 'Arm Chair',
          category: 'Chair',
          price: 180.00,
          image: ImageConst.productArmChair,
        ),
        quantity: 2,
        price: 180.00,
        status: OrderStatus.active,
        orderDate: 'Sep 18, 2023 | 10:00 AM',
        expectedDeliveryDate: '03 Sep 2023',
        trackingId: 'TRK452126542',
        steps: [
          TrackingStep(
            title: 'Order Placed',
            timestamp: '23 Sep 2023, 04:25 PM',
            isCompleted: true,
            icon: Icons.assignment_outlined,
          ),
          TrackingStep(
            title: 'In Progress',
            timestamp: '23 Sep 2023, 03:54 PM',
            isCompleted: true,
            icon: Icons.inventory_2_outlined,
          ),
          TrackingStep(
            title: 'Shipped',
            timestamp: 'Expected 02 Sep 2023',
            isCompleted: false,
            icon: Icons.local_shipping_outlined,
          ),
          TrackingStep(
            title: 'Delivered',
            timestamp: '23 Sep 2023, 2023',
            isCompleted: false,
            icon: Icons.check_circle_outline,
          ),
        ],
      );
    }
  }
}
