# 🛋️ Furniture Store Mobile App

A modern, responsive, and full-featured e-commerce mobile application for furniture shopping built with **Flutter** and **Dart**. Architected following clean code principles with a 4-tier modular pattern.

---

## ✨ Features

- **🔐 Authentication & Onboarding**:
  - Splash, Welcome, and interactive Onboarding carousel.
  - Sign in, Sign up, OTP verification, Complete Profile, and Password Reset flows.
  - Session management using `shared_preferences`.

- **🛋️ Browse & Catalog**:
  - Home dashboard with categories, flash sales, best collections, and banners.
  - Category exploration and granular Filter dialogs (price, rating, categories, sorting).
  - Search and dynamic catalogs.

- **📦 Product Details & Reviews**:
  - Multi-image product carousels with zoom and thumbnail selection.
  - Color, size, and quantity selection.
  - Interactive customer reviews, ratings breakdown, and Leave a Review flow.

- **🛍️ Cart, Wishlist & Checkout**:
  - Wishlist management with quick add-to-cart.
  - Real-time shopping cart with quantity adjustments and custom remove confirmation modal.
  - Step-by-step Checkout: Shipping address selection, shipping speed/courier choice, promo codes/coupons, and detailed order summary.

- **💳 Payments & Addresses**:
  - Payment Methods screen supporting Cash, Credit/Debit Cards, PayPal, Apple Pay, and Google Pay.
  - Interactive Add Card with live card preview and formatting.
  - Manage saved cards and default payment methods.
  - Address book with Home, Office, Apartment labels and Add Address form.
  - Payment success screen with quick access to E-Receipt.

- **📋 Orders & Tracking**:
  - Orders dashboard with status tabs: **Active**, **Completed**, and **Cancelled**.
  - Real-time shipment and order timeline tracking with status steps and carrier details.
  - Digital E-Receipt with barcode and breakdown.

- **💬 Support, Notifications & Settings**:
  - Real-time Customer Support chat interface with media attachments and status indicators.
  - Notifications center with categorized order, promo, and system alerts.
  - Settings screen with push notification toggles, dark mode, biometric authentication, and language settings.

---

## 🛠️ Tech Stack & Architecture

- **Framework**: [Flutter](https://flutter.dev) (Dart SDK `^3.6.1`)
- **State Management & Routing**: [GetX](https://pub.dev/packages/get)
- **Networking**: [Dio](https://pub.dev/packages/dio) with custom `BaseClient` & `PrettyDioLogger`
- **Responsive Layout**: [flutter_screenutil](https://pub.dev/packages/flutter_screenutil)
- **Local Persistence**: [shared_preferences](https://pub.dev/packages/shared_preferences) via centralized `MySharedPref`
- **UI & Animations**: `flutter_svg`, `lottie`, `pinput`, `flutter_staggered_animations`

### 4-Tier Architecture
```
[View / Screen] 
      │ (declarative UI & extracted modular widgets)
      ▼
[GetxController] 
      │ (state management, loading flags, updates)
      ▼
[Repository] 
      │ (domain logic, JSON-to-Model parsing, persistence)
      ▼
[API Client & BaseClient]
        (HTTP calls with automatic Bearer token injection)
```

---

## 🚀 Getting Started

### Prerequisites
- [Flutter SDK](https://docs.flutter.dev/get-started/install) (`>= 3.6.1`)
- [Dart SDK](https://dart.dev/get-dart)
- Android Studio / Xcode / VS Code with Flutter extension

### Installation

1. **Clone the repository**:
   ```bash
   git clone https://github.com/Adel-Jarour/furniture-store.git
   cd furniture-store
   ```

2. **Install dependencies**:
   ```bash
   flutter pub get
   ```

3. **Run code generation / analysis**:
   ```bash
   flutter analyze
   ```

4. **Launch the application**:
   ```bash
   flutter run
   ```

---

## 📂 Project Structure

```
lib/
├── config/                  # App configurations, API endpoints & BaseClient
├── const/                   # Design system tokens (colors, asset paths, mock data)
├── controller/              # GetX Controllers handling business logic
├── data/                    # API services & repositories
├── models/                  # Type-safe data models
├── routes/                  # Named routes and GetPage route definitions
├── utils/                   # Helpers, dialogs, snackbars, and SharedPreferences wrapper
└── view/                    # Presentation layer
    ├── screens/             # Feature screens organized by module
    └── widgets/             # Global reusable components
```

---

## 📄 License
This project is licensed under the MIT License.
