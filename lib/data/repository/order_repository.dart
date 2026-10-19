import 'package:flutter/material.dart';
import '../../const/image_const.dart';
import '../../models/cart_item_model.dart';
import '../../models/coupon_model.dart';
import '../../models/order_model.dart';
import '../../models/product_model.dart';
import '../../models/shipping_option_model.dart';

class OrderRepository {
  Future<List<CartItemModel>> getCartItems() async {
    return [
      CartItemModel(
        id: 'cart_1',
        product: const ProductModel(
          id: 'prod_arm_chair',
          title: 'Arm Chair',
          category: 'Chair',
          price: 180.00,
          originalPrice: 200.00,
          rating: 4.5,
          reviewsCount: 142,
          image: ImageConst.productArmChair,
          description: 'Comfortable modern arm chair with soft velvet cushion.',
        ),
        quantity: 1,
      ),
      CartItemModel(
        id: 'cart_2',
        product: const ProductModel(
          id: 'prod_sofa_chair',
          title: 'Sofa Chair',
          category: 'Chair',
          price: 120.00,
          originalPrice: 150.00,
          rating: 4.5,
          reviewsCount: 98,
          image: ImageConst.productSofaChair,
          description: 'Plaid patterned cozy sofa chair.',
        ),
        quantity: 1,
      ),
      CartItemModel(
        id: 'cart_3',
        product: const ProductModel(
          id: 'prod_wood_chair',
          title: 'Wood Chair',
          category: 'Chair',
          price: 110.00,
          originalPrice: 130.00,
          rating: 4.3,
          reviewsCount: 75,
          image: ImageConst.productWoodChair,
          description: 'Solid wooden leg accent chair.',
        ),
        quantity: 1,
      ),
      CartItemModel(
        id: 'cart_4',
        product: const ProductModel(
          id: 'prod_grey_chair',
          title: 'Grey Chair',
          category: 'Chair',
          price: 120.00,
          originalPrice: 140.00,
          rating: 4.4,
          reviewsCount: 60,
          image: ImageConst.productGreyChair,
          description: 'Relaxing grey textured lounge chair.',
        ),
        quantity: 1,
      ),
    ];
  }

  Future<List<ShippingOptionModel>> getShippingOptions() async {
    return const [
      ShippingOptionModel(
        id: 'ship_1',
        title: 'Economy',
        estimatedArrival: 'Estimated Arrival  25 Sep 2023',
        price: 25.00,
        type: ShippingType.economy,
        icon: Icons.inventory_2_outlined,
      ),
      ShippingOptionModel(
        id: 'ship_2',
        title: 'Regular',
        estimatedArrival: 'Estimated Arrival  24 Sep 2023',
        price: 35.00,
        type: ShippingType.regular,
        icon: Icons.inventory_2_outlined,
      ),
      ShippingOptionModel(
        id: 'ship_3',
        title: 'Cargo',
        estimatedArrival: 'Estimated Arrival  22 Sep 2023',
        price: 45.00,
        type: ShippingType.cargo,
        icon: Icons.local_shipping_outlined,
      ),
      ShippingOptionModel(
        id: 'ship_4',
        title: 'Express',
        estimatedArrival: 'Estimated Arrival  20 Sep',
        price: 55.00,
        type: ShippingType.express,
        icon: Icons.local_shipping_outlined,
      ),
    ];
  }

  Future<List<CouponModel>> getCoupons() async {
    return const [
      CouponModel(
        id: 'cpn_1',
        code: 'WELCOME200',
        title: 'WELCOME200',
        requirement: 'Add items worth \$2 more to unlock',
        discountBadge: 'Get 50% OFF',
        discountPercent: 50.0,
      ),
      CouponModel(
        id: 'cpn_2',
        code: 'CASHBACK12',
        title: 'CASHBACK12',
        requirement: 'Add items worth \$2 more to unlock',
        discountBadge: 'Up to \$12.00 cashback',
        discountAmount: 12.0,
      ),
      CouponModel(
        id: 'cpn_3',
        code: 'FEST2COST',
        title: 'FEST2COST',
        requirement: 'Add items worth \$28 more to unlock',
        discountBadge: 'Get 50% OFF for Combo',
        discountPercent: 50.0,
        isCombo: true,
      ),
      CouponModel(
        id: 'cpn_4',
        code: 'WELCOME200',
        title: 'WELCOME200',
        requirement: 'Add items worth \$2 more to unlock',
        discountBadge: 'Get 50% OFF',
        discountPercent: 50.0,
      ),
    ];
  }

  Future<List<OrderModel>> getOrders(OrderStatus status) async {
    final defaultSteps = const [
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
    ];

    switch (status) {
      case OrderStatus.active:
        return [
          OrderModel(
            id: 'ord_act_1',
            orderNumber: 'TRK452126542',
            product: const ProductModel(
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
            steps: defaultSteps,
          ),
          OrderModel(
            id: 'ord_act_2',
            orderNumber: 'TRK452126543',
            product: const ProductModel(
              id: 'prod_sofa_chair',
              title: 'Sofa Chair',
              category: 'Chair',
              price: 120.00,
              image: ImageConst.productSofaChair,
            ),
            quantity: 2,
            price: 120.00,
            status: OrderStatus.active,
            orderDate: 'Sep 18, 2023 | 10:30 AM',
            expectedDeliveryDate: '04 Sep 2023',
            trackingId: 'TRK452126543',
            steps: defaultSteps,
          ),
          OrderModel(
            id: 'ord_act_3',
            orderNumber: 'TRK452126544',
            product: const ProductModel(
              id: 'prod_wood_chair',
              title: 'Wood Chair',
              category: 'Chair',
              price: 110.00,
              image: ImageConst.productWoodChair,
            ),
            quantity: 2,
            price: 110.00,
            status: OrderStatus.active,
            orderDate: 'Sep 18, 2023 | 11:00 AM',
            expectedDeliveryDate: '05 Sep 2023',
            trackingId: 'TRK452126544',
            steps: defaultSteps,
          ),
        ];

      case OrderStatus.completed:
        return [
          OrderModel(
            id: 'ord_comp_1',
            orderNumber: 'TRK452126545',
            product: const ProductModel(
              id: 'prod_arm_chair',
              title: 'Arm Chair',
              category: 'Chair',
              price: 180.00,
              image: ImageConst.productArmChair,
            ),
            quantity: 2,
            price: 180.00,
            status: OrderStatus.completed,
            orderDate: 'Aug 20, 2023 | 02:00 PM',
            expectedDeliveryDate: '25 Aug 2023',
            trackingId: 'TRK452126545',
            steps: defaultSteps,
          ),
          OrderModel(
            id: 'ord_comp_2',
            orderNumber: 'TRK452126546',
            product: const ProductModel(
              id: 'prod_grey_chair',
              title: 'Grey Chair',
              category: 'Chair',
              price: 120.00,
              image: ImageConst.productGreyChair,
            ),
            quantity: 2,
            price: 120.00,
            status: OrderStatus.completed,
            orderDate: 'Aug 18, 2023 | 01:15 PM',
            expectedDeliveryDate: '23 Aug 2023',
            trackingId: 'TRK452126546',
            steps: defaultSteps,
          ),
          OrderModel(
            id: 'ord_comp_3',
            orderNumber: 'TRK452126547',
            product: const ProductModel(
              id: 'prod_sofa_chair',
              title: 'Sofa Chair',
              category: 'Chair',
              price: 120.00,
              image: ImageConst.productSofaChair,
            ),
            quantity: 2,
            price: 120.00,
            status: OrderStatus.completed,
            orderDate: 'Aug 15, 2023 | 11:45 AM',
            expectedDeliveryDate: '20 Aug 2023',
            trackingId: 'TRK452126547',
            steps: defaultSteps,
          ),
          OrderModel(
            id: 'ord_comp_4',
            orderNumber: 'TRK452126548',
            product: const ProductModel(
              id: 'prod_wood_chair',
              title: 'Wood Chair',
              category: 'Chair',
              price: 120.00,
              image: ImageConst.productWoodChair,
            ),
            quantity: 2,
            price: 120.00,
            status: OrderStatus.completed,
            orderDate: 'Aug 10, 2023 | 04:30 PM',
            expectedDeliveryDate: '15 Aug 2023',
            trackingId: 'TRK452126548',
            steps: defaultSteps,
          ),
        ];

      case OrderStatus.cancelled:
        return [
          OrderModel(
            id: 'ord_canc_1',
            orderNumber: 'TRK452126549',
            product: const ProductModel(
              id: 'prod_arm_chair',
              title: 'Arm Chair',
              category: 'Chair',
              price: 180.00,
              image: ImageConst.productArmChair,
            ),
            quantity: 2,
            price: 180.00,
            status: OrderStatus.cancelled,
            orderDate: 'Jul 28, 2023 | 09:00 AM',
            expectedDeliveryDate: '02 Aug 2023',
            trackingId: 'TRK452126549',
            steps: defaultSteps,
          ),
          OrderModel(
            id: 'ord_canc_2',
            orderNumber: 'TRK452126550',
            product: const ProductModel(
              id: 'prod_sofa_chair',
              title: 'Sofa Chair',
              category: 'Chair',
              price: 120.00,
              image: ImageConst.productSofaChair,
            ),
            quantity: 2,
            price: 120.00,
            status: OrderStatus.cancelled,
            orderDate: 'Jul 25, 2023 | 10:15 AM',
            expectedDeliveryDate: '30 Jul 2023',
            trackingId: 'TRK452126550',
            steps: defaultSteps,
          ),
          OrderModel(
            id: 'ord_canc_3',
            orderNumber: 'TRK452126551',
            product: const ProductModel(
              id: 'prod_grey_chair',
              title: 'Grey Chair',
              category: 'Chair',
              price: 120.00,
              image: ImageConst.productGreyChair,
            ),
            quantity: 2,
            price: 120.00,
            status: OrderStatus.cancelled,
            orderDate: 'Jul 20, 2023 | 03:45 PM',
            expectedDeliveryDate: '25 Jul 2023',
            trackingId: 'TRK452126551',
            steps: defaultSteps,
          ),
          OrderModel(
            id: 'ord_canc_4',
            orderNumber: 'TRK452126552',
            product: const ProductModel(
              id: 'prod_wood_chair',
              title: 'Wood Chair',
              category: 'Chair',
              price: 110.00,
              image: ImageConst.productWoodChair,
            ),
            quantity: 2,
            price: 110.00,
            status: OrderStatus.cancelled,
            orderDate: 'Jul 15, 2023 | 05:00 PM',
            expectedDeliveryDate: '20 Jul 2023',
            trackingId: 'TRK452126552',
            steps: defaultSteps,
          ),
        ];
    }
  }
}
