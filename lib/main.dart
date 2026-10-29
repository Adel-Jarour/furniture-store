import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'const/color_const.dart';
import 'routes/app_pages.dart';
import 'routes/app_routes.dart';
import 'utils/my_shared_pref.dart';

void main() async {
  final widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);

  // Initialize Local Storage
  await MySharedPref.init();

  // Determine initial route based on auth status
  final isLoggedIn = MySharedPref.isLoggedIn();
  final initialRoute = isLoggedIn ? AppRoutes.bottomNav : AppRoutes.welcome;

  // System UI Overlay Style (Status bar & Navigation bar)
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.dark,
      systemNavigationBarColor: Colors.white,
      systemNavigationBarIconBrightness: Brightness.dark,
    ),
  );

  // Dismiss native splash screen seamlessly once Flutter is ready
  FlutterNativeSplash.remove();

  runApp(FurnitureStoreApp(initialRoute: initialRoute));
}

class FurnitureStoreApp extends StatelessWidget {
  final String initialRoute;

  const FurnitureStoreApp({super.key, this.initialRoute = AppPages.initial});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize:
          const Size(375, 812), // Standard iPhone / Modern Android sizing
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return GetMaterialApp(
          title: 'Furniture Store',
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            useMaterial3: true,
            scaffoldBackgroundColor: ColorConst.scaffoldBgColor,
            primaryColor: ColorConst.primaryColor,
            colorScheme: ColorScheme.fromSeed(
              seedColor: ColorConst.primaryColor,
              primary: ColorConst.primaryColor,
              secondary: ColorConst.accentColor,
              surface: ColorConst.scaffoldBgColor,
            ),
            textTheme: GoogleFonts.plusJakartaSansTextTheme(
              Theme.of(context).textTheme,
            ),
            appBarTheme: const AppBarTheme(
              backgroundColor: Colors.transparent,
              elevation: 0,
              centerTitle: true,
              scrolledUnderElevation: 0,
            ),
          ),
          initialRoute: initialRoute,
          getPages: AppPages.routes,
        );
      },
    );
  }
}
