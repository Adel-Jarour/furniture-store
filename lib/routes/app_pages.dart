import 'package:get/get.dart';
import '../routes/app_routes.dart';
import '../view/screens/auth/complete_profile_screen.dart';
import '../view/screens/auth/create_new_password_screen.dart';
import '../view/screens/auth/forgot_password_screen.dart';
import '../view/screens/auth/login_screen.dart';
import '../view/screens/auth/otp_verification_screen.dart';
import '../view/screens/auth/signup_screen.dart';
import '../view/screens/bottomNav/bottom_nav_screen.dart';
import '../view/screens/chat/chat_screen.dart';
import '../view/screens/home/home_screen.dart';
import '../view/screens/location/location_screen.dart';
import '../view/screens/onboarding/onboarding_screen.dart';
import '../view/screens/profile/profile_screen.dart';
import '../view/screens/catalog/category_screen.dart';
import '../view/screens/catalog/filter_screen.dart';
import '../view/screens/product_details/leave_review_screen.dart';
import '../view/screens/product_details/product_details_screen.dart';
import '../view/screens/cart/cart_screen.dart';
import '../view/screens/checkout/checkout_screen.dart';
import '../view/screens/checkout/choose_shipping_screen.dart';
import '../view/screens/checkout/coupons_screen.dart';
import '../view/screens/checkout/receipt_screen.dart';
import '../view/screens/orders/orders_screen.dart';
import '../view/screens/orders/track_order_screen.dart';
import '../view/screens/welcome/welcome_screen.dart';
import '../view/screens/wishlist/wishlist_screen.dart';
import '../view/screens/settings/settings_screen.dart';
import '../view/screens/payment/payment_methods_screen.dart';
import '../view/screens/payment/payment_success_screen.dart';
import '../view/screens/payment/manage_payment_methods_screen.dart';
import '../view/screens/payment/add_card_screen.dart';
import '../view/screens/address/manage_address_screen.dart';
import '../view/screens/address/add_address_screen.dart';
import '../view/screens/chat_detail/chat_detail_screen.dart';
import '../view/screens/notifications/notifications_screen.dart';
import '../view/screens/help_center/help_center_screen.dart';
import '../view/screens/profile/privacy_policy_screen.dart';
import '../view/screens/search/search_screen.dart';
import '../view/screens/location/search_manual_location_screen.dart';
import '../view/screens/catalog/category_products_screen.dart';
import '../view/screens/invite_friends/invite_friends_screen.dart';
import '../view/screens/password_manager/password_manager_screen.dart';
import '../view/screens/checkout/review_summary_screen.dart';
import '../view/screens/product_details/product_reviews_screen.dart';
import '../view/screens/address/shipping_address_screen.dart';
import '../view/screens/call/video_call_screen.dart';
import '../view/screens/call/voice_call_screen.dart';
import '../view/screens/notifications/notification_settings_screen.dart';

class AppPages {
  static const initial = AppRoutes.welcome;

  static final List<GetPage> routes = [
    GetPage(
      name: AppRoutes.welcome,
      page: () => const WelcomeScreen(),
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: AppRoutes.onboarding,
      page: () => const OnboardingScreen(),
      transition: Transition.rightToLeft,
    ),
    GetPage(
      name: AppRoutes.location,
      page: () => const LocationScreen(),
      transition: Transition.rightToLeft,
    ),
    GetPage(
      name: AppRoutes.login,
      page: () => const LoginScreen(),
      transition: Transition.rightToLeft,
    ),
    GetPage(
      name: AppRoutes.signup,
      page: () => const SignupScreen(),
      transition: Transition.rightToLeft,
    ),
    GetPage(
      name: AppRoutes.completeProfile,
      page: () => const CompleteProfileScreen(),
      transition: Transition.rightToLeft,
    ),
    GetPage(
      name: AppRoutes.forgotPassword,
      page: () => const ForgotPasswordScreen(),
      transition: Transition.rightToLeft,
    ),
    GetPage(
      name: AppRoutes.otpVerification,
      page: () => const OtpVerificationScreen(),
      transition: Transition.rightToLeft,
    ),
    GetPage(
      name: AppRoutes.resetPassword,
      page: () => const CreateNewPasswordScreen(),
      transition: Transition.rightToLeft,
    ),
    GetPage(
      name: AppRoutes.bottomNav,
      page: () => const BottomNavScreen(),
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: AppRoutes.home,
      page: () => const HomeScreen(),
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: AppRoutes.wishlist,
      page: () => const WishlistScreen(),
      transition: Transition.rightToLeft,
    ),
    GetPage(
      name: AppRoutes.chat,
      page: () => const ChatScreen(),
      transition: Transition.rightToLeft,
    ),
    GetPage(
      name: AppRoutes.profile,
      page: () => const ProfileScreen(),
      transition: Transition.rightToLeft,
    ),
    GetPage(
      name: AppRoutes.category,
      page: () => const CategoryScreen(),
      transition: Transition.rightToLeft,
    ),
    GetPage(
      name: AppRoutes.filter,
      page: () => const FilterScreen(),
      transition: Transition.rightToLeft,
    ),
    GetPage(
      name: AppRoutes.productDetails,
      page: () => const ProductDetailsScreen(),
      transition: Transition.rightToLeft,
    ),
    GetPage(
      name: AppRoutes.leaveReview,
      page: () => const LeaveReviewScreen(),
      transition: Transition.rightToLeft,
    ),
    GetPage(
      name: AppRoutes.cart,
      page: () => const CartScreen(),
      transition: Transition.rightToLeft,
    ),
    GetPage(
      name: AppRoutes.checkout,
      page: () => const CheckoutScreen(),
      transition: Transition.rightToLeft,
    ),
    GetPage(
      name: AppRoutes.chooseShipping,
      page: () => const ChooseShippingScreen(),
      transition: Transition.rightToLeft,
    ),
    GetPage(
      name: AppRoutes.coupons,
      page: () => const CouponsScreen(),
      transition: Transition.rightToLeft,
    ),
    GetPage(
      name: AppRoutes.eReceipt,
      page: () => const ReceiptScreen(),
      transition: Transition.rightToLeft,
    ),
    GetPage(
      name: AppRoutes.orders,
      page: () => const OrdersScreen(),
      transition: Transition.rightToLeft,
    ),
    GetPage(
      name: AppRoutes.trackOrder,
      page: () => const TrackOrderScreen(),
      transition: Transition.rightToLeft,
    ),
    GetPage(
      name: AppRoutes.settings,
      page: () => const SettingsScreen(),
      transition: Transition.rightToLeft,
    ),
    GetPage(
      name: AppRoutes.paymentMethods,
      page: () => const PaymentMethodsScreen(),
      transition: Transition.rightToLeft,
    ),
    GetPage(
      name: AppRoutes.paymentSuccess,
      page: () => const PaymentSuccessScreen(),
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: AppRoutes.managePaymentMethods,
      page: () => const ManagePaymentMethodsScreen(),
      transition: Transition.rightToLeft,
    ),
    GetPage(
      name: AppRoutes.addCard,
      page: () => const AddCardScreen(),
      transition: Transition.rightToLeft,
    ),
    GetPage(
      name: AppRoutes.manageAddress,
      page: () => const ManageAddressScreen(),
      transition: Transition.rightToLeft,
    ),
    GetPage(
      name: AppRoutes.addAddress,
      page: () => const AddAddressScreen(),
      transition: Transition.rightToLeft,
    ),
    GetPage(
      name: AppRoutes.chatDetail,
      page: () => const ChatDetailScreen(),
      transition: Transition.rightToLeft,
    ),
    GetPage(
      name: AppRoutes.notifications,
      page: () => const NotificationsScreen(),
      transition: Transition.rightToLeft,
    ),
    GetPage(
      name: AppRoutes.helpCenter,
      page: () => const HelpCenterScreen(),
      transition: Transition.rightToLeft,
    ),
    GetPage(
      name: AppRoutes.privacyPolicy,
      page: () => const PrivacyPolicyScreen(),
      transition: Transition.rightToLeft,
    ),
    GetPage(
      name: AppRoutes.search,
      page: () => const SearchScreen(),
      transition: Transition.rightToLeft,
    ),
    GetPage(
      name: AppRoutes.searchManualLocation,
      page: () => const SearchManualLocationScreen(),
      transition: Transition.rightToLeft,
    ),
    GetPage(
      name: AppRoutes.categoryProducts,
      page: () => const CategoryProductsScreen(),
      transition: Transition.rightToLeft,
    ),
    GetPage(
      name: AppRoutes.inviteFriends,
      page: () => const InviteFriendsScreen(),
      transition: Transition.rightToLeft,
    ),
    GetPage(
      name: AppRoutes.passwordManager,
      page: () => const PasswordManagerScreen(),
      transition: Transition.rightToLeft,
    ),
    GetPage(
      name: AppRoutes.reviewSummary,
      page: () => const ReviewSummaryScreen(),
      transition: Transition.rightToLeft,
    ),
    GetPage(
      name: AppRoutes.productReviews,
      page: () => const ProductReviewsScreen(),
      transition: Transition.rightToLeft,
    ),
    GetPage(
      name: AppRoutes.shippingAddress,
      page: () => const ShippingAddressScreen(),
      transition: Transition.rightToLeft,
    ),
    GetPage(
      name: AppRoutes.videoCall,
      page: () => const VideoCallScreen(),
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: AppRoutes.voiceCall,
      page: () => const VoiceCallScreen(),
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: AppRoutes.notificationSettings,
      page: () => const NotificationSettingsScreen(),
      transition: Transition.rightToLeft,
    ),
  ];
}
