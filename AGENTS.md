# AGENTS.md - Project Architecture & Coding Guidelines

> This document defines the standard architecture, coding patterns, conventions, and style used in this codebase. Any AI agent or developer building or extending this project MUST follow these guidelines strictly to maintain consistency.

---

## 1. Project Overview & Tech Stack

This project is a modern Flutter mobile application built with:
- **Framework**: Flutter (Dart SDK `^3.6.1` or latest stable)
- **State Management & Navigation**: [GetX](https://pub.dev/packages/get) (`GetxController`, `GetPage`, `Get.toNamed`, `Get.find`)
- **Networking**: [Dio](https://pub.dev/packages/dio) with [PrettyDioLogger](https://pub.dev/packages/pretty_dio_logger) and custom `BaseClient`
- **Responsive Sizing**: [flutter_screenutil](https://pub.dev/packages/flutter_screenutil) (`.w`, `.h`, `.sp`, `.r`)
- **Local Storage**: [shared_preferences](https://pub.dev/packages/shared_preferences) accessed via centralized `MySharedPref`
- **UI Enhancements**: `flutter_svg`, `lottie`, `pinput`, `flutter_staggered_animations`, `syncfusion_flutter_charts`

---

## 2. Directory Structure Conventions

Always maintain the following folder structure under `lib/`:

```
lib/
├── config/                  # App configurations
│   ├── api_config.dart      # Base URLs, API endpoints, timeouts
│   ├── base_client.dart     # Dio singleton with interceptors & error handling
│   └── translation/         # Localization and string keys
├── const/                   # Design system constants
│   ├── color_const.dart     # App color palette
│   ├── image_const.dart     # Image and SVG asset paths
│   ├── list_const.dart      # Static list items, mock data
│   └── lottie_animations.dart # Lottie animation paths
├── data/                    # Data layer
│   ├── api/                 # Low-level network calls per domain (AuthApi, WalletApi, etc.)
│   └── repository/          # Repository layer abstracting APIs & persistence
├── models/                  # Data models with robust fromJson / toJson
├── controller/              # GetX Controllers handling business logic & state
├── routes/                  # App routing
│   ├── app_routes.dart      # Route string constants
│   └── app_pages.dart       # List of GetPage definitions
├── utils/                   # Helper utilities
│   ├── app_dialog.dart      # Standardized dialog popups
│   ├── app_snack_bar.dart   # Standardized snackbars (success/error)
│   ├── my_shared_pref.dart  # Centralized SharedPreferences wrapper
│   └── binding/             # GetX Bindings
└── view/                    # Presentation layer
    ├── screens/             # Feature screens organized by module
    │   ├── auth/            # Auth screens (login, signup, pin, forget_pass)
    │   ├── bottomNav/       # Main container screen with bottom navigation bar
    │   ├── home/            # Home dashboard
    │   ├── cash_flow/       # Financial transactions & analytics
    │   ├── money_actions/   # Send, request, top-up screens
    │   ├── message/         # In-app chat & messaging
    │   ├── profile/         # User profile, cards, security, settings
    │   └── splash/          # Splash screen
    └── widgets/             # Globally reusable shared widgets (CustomButton, CustomText, etc.)
```

---

## 3. Clean Architecture & Repository Pattern

All feature implementations follow this clean flow:

```
[View / Screen] 
      │ (calls controller methods, reads state)
      ▼
[GetxController] 
      │ (manages loading flags, calls repository, calls update())
      ▼
[Repository] 
      │ (handles data abstraction, returns domain models, manages local session)
      ▼
[API Client / Mock Data Source]
        (during UI development: returns structured mock data cleanly without speculative HTTP calls;
         when backend is ready: makes HTTP requests via BaseClient)
```

### Layer Responsibilities:

1. **`lib/data/repository/*_repository.dart`**:
   - Acts as the single source of truth for the controller.
   - **UI Development Phase (Current)**: Directly provides rich, realistic mock data (optionally with brief simulated latency `await Future.delayed(...)`) without firing speculative HTTP calls to non-existent servers.
   - **Backend Integration Phase**: Once real backend contracts (Swagger / Postman) are available, calls the corresponding API class using `BaseClient` and parses the response into typed Models.
   - Persists session data (tokens, user preferences) via `MySharedPref`.
   - Example (UI / Mock Phase):
     ```dart
     class WalletRepository {
       final List<WalletModel> _mockWallets = const [
         WalletModel(id: 'w_1', balance: 2540.0, currency: 'USD', isActive: true),
       ];

       Future<List<WalletModel>> getWallets() async {
         // Simulated async delay
         await Future.delayed(const Duration(milliseconds: 200));
         return List.from(_mockWallets);
       }
     }
     ```

2. **`lib/controller/*_controller.dart`**:
   - Extends `GetxController`.
   - Manages state variables (`isLoading`, data lists, form fields).
   - Calls `update()` to notify UI observers (or uses `Rx` / `.obs` where reactive streams are appropriate).
   - Catches errors gracefully and surfaces feedback via `AppSnackBar` or `AppDialog`.
   - Example:
     ```dart
     class HomeController extends GetxController {
       final WalletRepository _walletRepository = WalletRepository();

       bool isLoadingWallets = false;
       List<WalletModel> wallets = [];

       @override
       void onInit() {
         super.onInit();
         fetchWallets();
       }

       Future<void> fetchWallets() async {
         try {
           isLoadingWallets = true;
           update();
           wallets = await _walletRepository.getWallets();
         } catch (e) {
           AppSnackBar.showError(message: 'Failed to load wallets');
         } finally {
           isLoadingWallets = false;
           update();
         }
       }
     }
     ```

3. **`lib/data/api/*_api.dart` & `BaseClient`**:
   - Dedicated networking layer ready for when the live backend is connected.
   - Avoid creating speculative endpoints or fake HTTP calls until real backend documentation is available.

4. **`lib/view/screens/*` (View Layer)**:
   - Never call APIs or write directly to storage inside widgets.
   - Access controllers via `Get.find<T>()` or `GetBuilder<T>`.

---

## 4. UI & Widget Design Rules

### 1. Screen vs. Widget Modularization
- Each screen lives in its own folder under `lib/view/screens/<module>/<feature>/`.
- The main screen file must be clean and declarative (e.g., `home_screen.dart`).
- Break down sub-sections of a screen into a local `widget/` subfolder (e.g., `lib/view/screens/home/widget/`).
- Prefix all custom modular widgets with `Custom` (e.g., `CustomHomeHeader`, `CustomCards`, `CustomLoginFormField`).
- Truly global widgets shared across multiple distinct screens belong in `lib/view/widgets/` (e.g., `CustomArrowBack`, `CustomButton`, `CustomInputField`).

### 2. Responsive Sizing with ScreenUtil
- **Never hardcode pixel sizes** directly.
- Use extensions from `flutter_screenutil`:
  - Width: `.w` (e.g., `16.w`)
  - Height: `.h` (e.g., `24.h`)
  - Font size: `.sp` (e.g., `18.sp`)
  - Radius / Border: `.r` (e.g., `12.r`)

### 3. Design System Constants
- Use `ColorConst` for all colors (e.g., `ColorConst.primaryColor`, `ColorConst.textBlackColor`).
- Use `ImageConst` for assets (e.g., `ImageConst.logo`, `ImageConst.cardBg`).
- Never introduce random hex color codes directly into widgets; define them in `lib/const/color_const.dart`.

### 4. Stateless Preference
- Favor `StatelessWidget` combined with GetX (`GetBuilder` or `Obx`) instead of `StatefulWidget`. Use `StatefulWidget` only when managing ephemeral local animation controllers or controllers required by third-party packages.

---

## 5. Network & API Standards

1. **`BaseClient` Singleton**:
   - All network calls MUST route through `BaseClient`.
   - `BaseClient` automatically injects the `Authorization: Bearer <token>` header from `MySharedPref.getAuthToken()`.
   - Handles network timeouts, logging (in debug mode), and 401 Unauthorized handling (token refresh or redirect to login).

2. **Endpoints**:
   - All endpoint paths, base URLs, and timeout configurations MUST be declared as `static const` in `lib/config/api_config.dart`.
   - Do NOT hardcode URL strings inside API service classes.

3. **Data Models**:
   - Write safe `fromJson` constructors that defensively handle missing fields, nulls, and type conversions:
     ```dart
     factory WalletModel.fromJson(Map<String, dynamic> json) {
       return WalletModel(
         id: json['id']?.toString() ?? '',
         balance: (json['balance'] as num?)?.toDouble() ?? 0.0,
         currency: json['currency']?.toString() ?? 'USD',
         isActive: json['isActive'] as bool? ?? true,
       );
     }
     ```

---

## 6. Local Storage Standards

- Always access `SharedPreferences` through `MySharedPref` (`lib/utils/my_shared_pref.dart`).
- Provide typed static getters and setters for keys (e.g., `getAuthToken()`, `setAuthToken(String)`, `isLoggedIn()`, `clearSession()`).
- Never call `SharedPreferences.getInstance()` directly inside controllers or widgets.

---

## 7. Routing & Navigation Rules

- Define named route strings in `lib/routes/app_routes.dart` (e.g., `static const home = '/home';`).
- Register pages and bindings in `lib/routes/app_pages.dart`.
- Navigate using GetX:
  ```dart
  Get.toNamed(AppRoutes.home);
  Get.offAllNamed(AppRoutes.login);
  ```

---

## 8. Summary Checklist for AI Agents

When implementing any new feature in this project:
1. [ ] **Model**: Create/update the model class in `lib/models/` with null-safe `fromJson` / `toJson`.
2. [ ] **Repository**: Create `lib/data/repository/<feature>_repository.dart` returning clean, structured mock data (and handling local storage via `MySharedPref`).
3. [ ] **Controller**: Create `lib/controller/<feature>_controller.dart` extending `GetxController` consuming the repository.
4. [ ] **Routes**: Register route name in `AppRoutes` and page in `AppPages`.
5. [ ] **UI / View**: Create screen in `lib/view/screens/<feature>/<feature>_screen.dart`, breaking down sections into `widget/custom_<name>.dart`.
6. [ ] **ScreenUtil & Constants**: Use `.w`, `.h`, `.sp`, `.r` and tokens from `ColorConst` / `ImageConst`.
7. [ ] **Widget Extraction**: Apply the widget extraction rules from Section 9 — every screen section that is more than ~30 lines or is logically independent MUST become a dedicated widget file.
8. [ ] **Validation**: Run `dart format lib/` and `flutter analyze` — zero issues are required before a feature is considered complete.
9. [ ] **Backend Readiness**: When the backend is ready, wire the repository to `lib/data/api/<feature>_api.dart` using `BaseClient` and `ApiConfig`.

---

## 9. Widget Extraction & Modularization Rules

> These rules apply to ALL screens, both new ones and when refactoring existing ones.

### 9.1 — When to Extract a Widget

Extract a UI section into its own `Custom*` widget when **any** of the following is true:

| Condition | Example |
|---|---|
| The section is **longer than ~30 lines** | A product image carousel with thumbnails |
| The section is **logically self-contained** | A search bar, a rating star row, a list tile |
| The section is **repeated** across screens | A filter chip row, a back-button top bar |
| The section has **its own data / callback params** | A cart item card that takes a `CartItemModel` |

### 9.2 — File Naming & Location Rules

```
lib/view/screens/<feature>/
├── <feature>_screen.dart         ← clean, declarative, top-level screen only
└── widget/
    ├── custom_<section>.dart     ← each extracted section
    └── custom_<element>.dart     ← each extracted element
```

- Widget file names must be `snake_case` and prefixed with `custom_`.
- Widget class names must be `PascalCase` and prefixed with `Custom`.
- If a widget is used in **two or more distinct screens**, move it to `lib/view/widgets/`.

### 9.3 — Widget Structure Rules

Every extracted widget MUST follow these rules:

```dart
// ✅ CORRECT — Stateless, receives data via constructor
class CustomProductImageCarousel extends StatelessWidget {
  final ProductDetailsController controller;   // pass the controller, not raw data

  const CustomProductImageCarousel({super.key, required this.controller});

  @override
  Widget build(BuildContext context) { ... }
}

// ✅ CORRECT — Pure data widget (no controller needed)
class CustomChatListTile extends StatelessWidget {
  final ChatItemModel chat;

  const CustomChatListTile({super.key, required this.chat});

  @override
  Widget build(BuildContext context) { ... }
}

// ❌ WRONG — Business logic or API calls inside a widget
class CustomSomeTile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final data = SomeApi().fetch(); // Never do this
    ...
  }
}
```

- Prefer **`StatelessWidget`** in all extracted widgets.
- Use **`StatefulWidget`** only for widgets that manage ephemeral local state (e.g., animation controllers) unrelated to business logic.
- Never call APIs, repositories, or `SharedPreferences` inside a widget.
- Always declare `const` constructors where possible.

### 9.4 — Screen File Rules (After Extraction)

The main `<feature>_screen.dart` file MUST remain clean and declarative:

```dart
// ✅ CORRECT — Screen file is a simple composition of Custom* widgets
class ProductDetailsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProductDetailsController>(
      init: ProductDetailsController(),
      builder: (controller) {
        return Scaffold(
          body: Column(
            children: [
              CustomProductDetailsTopBar(controller: controller),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      CustomProductImageCarousel(controller: controller),
                      CustomProductInfoSection(controller: controller),
                    ],
                  ),
                ),
              ),
              CustomProductAddToCartBar(controller: controller),
            ],
          ),
        );
      },
    );
  }
}
```

- The screen's `build()` method should read like an **outline** of the screen, not a wall of widget code.
- Target: **fewer than 80 lines** in the main screen file after extraction.

### 9.5 — Standard Sections to Always Extract

The following UI sections appear in many screens and MUST always be extracted:

| Section | Widget Name Pattern | Notes |
|---|---|---|
| Top navigation bar (back + title + action) | `Custom<Feature>TopBar` | Use `Get.back()` for navigation |
| Sticky bottom action bar | `Custom<Feature>BottomBar` | Price + CTA button(s) |
| List / grid item tile | `Custom<Feature>Card` or `Custom<Feature>Tile` | Receives a model via constructor |
| Search bar | `Custom<Feature>SearchBar` | Passes `onChanged` callback |
| Filter / category chip row | `Custom<Feature>FilterPills` | Receives list + selectedValue + onSelected |
| Avatar with edit badge | `Custom<Feature>Avatar` | Receives image path + name |
| Star rating row | `CustomStarSelector` | Generic — lives in `lib/view/widgets/` |

### 9.6 — Reusable Global Widgets

If a widget is needed in **2 or more screens**, it belongs in `lib/view/widgets/`:

```
lib/view/widgets/
├── custom_back_button.dart
├── custom_star_selector.dart        ← used in product_details & leave_review
├── custom_filter_chip_row.dart      ← used in filter, wishlist, catalog
├── custom_primary_button.dart
└── ...
```

### 9.7 — Code Quality After Extraction

After every extraction or refactor:
1. Run `dart format lib/` — all files must be properly formatted.
2. Run `flutter analyze` — **zero issues** are acceptable. Fix all warnings and hints.
3. Verify the screen still renders and behaves identically to before the refactor.

---

## 10. Established Widget Patterns (Reference)

The following patterns are established in this codebase and MUST be followed consistently:

### Controller passed to widget
```dart
// Widget accepts the full controller (preferred when widget needs multiple fields)
class CustomCartItemCard extends StatelessWidget {
  final CartItemModel item;
  final VoidCallback onRemove;
  final VoidCallback onIncrement;
  final VoidCallback onDecrement;

  const CustomCartItemCard({
    super.key,
    required this.item,
    required this.onRemove,
    required this.onIncrement,
    required this.onDecrement,
  });
}
```

### Chip/pill row (reusable pattern)
```dart
class CustomFilterChipRow extends StatelessWidget {
  final List<String> options;
  final String selectedValue;
  final ValueChanged<String> onSelected;

  const CustomFilterChipRow({
    super.key,
    required this.options,
    required this.selectedValue,
    required this.onSelected,
  });
}
```

### List tile (model-driven pattern)
```dart
class CustomOrderCard extends StatelessWidget {
  final OrderModel order;
  final VoidCallback? onTap;

  const CustomOrderCard({super.key, required this.order, this.onTap});
}
```

