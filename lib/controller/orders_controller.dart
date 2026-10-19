import 'package:get/get.dart';
import '../data/repository/order_repository.dart';
import '../models/order_model.dart';
import '../routes/app_routes.dart';
import '../utils/app_snack_bar.dart';

class OrdersController extends GetxController {
  final OrderRepository _repository = OrderRepository();

  int selectedTabIndex = 0; // 0: Active, 1: Completed, 2: Cancelled
  bool isLoading = false;

  List<OrderModel> activeOrders = [];
  List<OrderModel> completedOrders = [];
  List<OrderModel> cancelledOrders = [];

  @override
  void onInit() {
    super.onInit();
    fetchAllOrders();
  }

  Future<void> fetchAllOrders() async {
    try {
      isLoading = true;
      update();
      activeOrders = await _repository.getOrders(OrderStatus.active);
      completedOrders = await _repository.getOrders(OrderStatus.completed);
      cancelledOrders = await _repository.getOrders(OrderStatus.cancelled);
    } catch (e) {
      AppSnackBar.showError(message: 'Failed to load orders');
    } finally {
      isLoading = false;
      update();
    }
  }

  void changeTab(int index) {
    selectedTabIndex = index;
    update();
  }

  List<OrderModel> get currentOrders {
    switch (selectedTabIndex) {
      case 0:
        return activeOrders;
      case 1:
        return completedOrders;
      case 2:
        return cancelledOrders;
      default:
        return activeOrders;
    }
  }

  void trackOrder(OrderModel order) {
    Get.toNamed(AppRoutes.trackOrder, arguments: order);
  }

  void leaveReview(OrderModel order) {
    Get.toNamed(AppRoutes.leaveReview, arguments: order.product);
  }

  void reOrder(OrderModel order) {
    AppSnackBar.showSuccess(
      title: 'Added to Cart',
      message: '${order.product.title} has been added back to your cart!',
    );
    Get.toNamed(AppRoutes.cart);
  }
}
