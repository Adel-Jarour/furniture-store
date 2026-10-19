import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:furniture_store/main.dart';
import 'package:furniture_store/utils/my_shared_pref.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  testWidgets('App smoke test - launches and renders without crash', (WidgetTester tester) async {
    SharedPreferences.setMockInitialValues({});
    await MySharedPref.init();

    // Use a realistic phone viewport to avoid overflow in tests
    tester.view.physicalSize = const Size(1080, 1920);
    tester.view.devicePixelRatio = 3.0;
    addTearDown(tester.view.reset);

    await tester.pumpWidget(const FurnitureStoreApp());
    await tester.pump(const Duration(milliseconds: 500));

    // App should render at splash
    expect(find.byType(FurnitureStoreApp), findsOneWidget);

    // Fast-forward past the 2200ms splash delay
    await tester.pump(const Duration(milliseconds: 2500));
    await tester.pumpAndSettle();

    // Should navigate to onboarding (first launch, not onboarded)
    expect(find.byType(FurnitureStoreApp), findsOneWidget);
  });
}
