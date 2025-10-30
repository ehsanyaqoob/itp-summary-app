import 'package:flutter/services.dart';
import 'package:trafficlly/app/life_cycle.dart';
import 'package:trafficlly/utills/export.dart';
import '../screens/splash.dart';

class AppView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (_, child) {
        return AnnotatedRegion<SystemUiOverlayStyle>(
          value: const SystemUiOverlayStyle(
            statusBarColor: Colors.transparent,
            statusBarIconBrightness: Brightness.dark, 
            systemNavigationBarColor: AppColors.scaffoldBackgroundColor,
            systemNavigationBarIconBrightness: Brightness.dark,
            systemNavigationBarDividerColor: Colors.transparent,
          ),
          child: GetMaterialApp(
            debugShowCheckedModeBanner: false,
            title: "ITP Summary",
            theme: ThemeData.light(),
            darkTheme: ThemeData.dark(),
            themeMode: ThemeMode.system,
            home: StateAwareWidget(
              onResume: () => debugPrint("🔄 App resumed"),
              onPause: () => debugPrint("⏸️ App paused"),
              onInactive: () => debugPrint("🔶 App inactive"),
              child: const SplashView(),
            ),
          ),
        );
      },
    );
  }
}

class AppRootWrapper extends StatelessWidget {
  const AppRootWrapper({super.key});

  @override
  Widget build(BuildContext context) {
    // Use MediaQuery to get the current brightness
    final brightness = MediaQuery.of(context).platformBrightness;
    final isDarkMode = brightness == Brightness.dark;

    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: isDarkMode ? Brightness.light : Brightness.dark,
        systemNavigationBarColor: isDarkMode 
            ? AppColors.black // Use appropriate dark color
            : AppColors.scaffoldBackgroundColor,
        systemNavigationBarIconBrightness: isDarkMode ? Brightness.light : Brightness.dark,
        systemNavigationBarDividerColor: Colors.transparent,
      ),
      child: StateAwareWidget(
        onResume: () => debugPrint("🔄 App resumed"),
        onPause: () => debugPrint("⏸️ App paused"),
        onInactive: () => debugPrint("🔶 App inactive"),
        child: const SplashView(),
      ),
    );
  }
}