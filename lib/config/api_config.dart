class ApiConfig {
  // Base URLs
  static const String baseUrl = 'https://api.furniturestore.example.com/api/v1';

  // Timeouts
  static const Duration connectTimeout = Duration(seconds: 30);
  static const Duration receiveTimeout = Duration(seconds: 30);

  // Authentication Endpoints
  static const String login = '/auth/login';
  static const String register = '/auth/register';
  static const String forgotPassword = '/auth/forgot-password';
  static const String verifyOtp = '/auth/verify-otp';
  static const String resetPassword = '/auth/reset-password';
  static const String logout = '/auth/logout';
  static const String profile = '/auth/profile';

  // Home & Catalog Endpoints
  static const String banners = '/home/banners';
  static const String categories = '/categories';
  static const String flashSale = '/products/flash-sale';
  static const String popularProducts = '/products/popular';
  static const String productDetails = '/products'; // + /{id}
  static const String searchProducts = '/products/search';

  // Wishlist & Cart Endpoints
  static const String wishlist = '/wishlist';
  static const String cart = '/cart';
  static const String applyCoupon = '/cart/apply-coupon';

  // Checkout & Orders
  static const String checkout = '/orders/checkout';
  static const String orders = '/orders';
  static const String trackOrder = '/orders/track';
  static const String coupons = '/coupons';
  static const String shippingOptions = '/shipping-options';
  static const String addresses = '/user/addresses';
  static const String paymentMethods = '/user/payment-methods';

  // Support & Chat
  static const String chatConversations = '/chat/conversations';
  static const String chatMessages = '/chat/messages';
}
