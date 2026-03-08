import 'package:go_router/go_router.dart';
import 'package:quran/core/constants/app_globals.dart';
import 'package:quran/core/routes/route_names.dart' show RouteNames;
import 'package:quran/features/home/presentation_layer/screens/home_screen.dart';
import 'package:quran/features/qibla/presentation_layer/screens/qibla_screen.dart';
import 'package:quran/features/quran/presentation_layer/screens/page_screen.dart';
import 'package:quran/features/quran/presentation_layer/screens/quran_screen.dart';
import 'package:quran/features/splash_screen/presentation_layer/screens/splash_screen.dart';
import 'package:quran/features/tabs/presentation_layer/screens/tabs_screen.dart';
import 'package:quran/features/tasbih/presentation_layer/screens/tasbih_screen.dart';

class AppRoutes {
  static final GoRouter routes = GoRouter(
    initialLocation: RouteNames.splashScreen,
    navigatorKey: AppGlobals.navigatorKey,
    routes: [
      GoRoute(
        path: RouteNames.splashScreen,
        builder: (context, state) => const SplashScreen(),
      ),
      GoRoute(
        path: RouteNames.tabsScreen,
        builder: (context, state) => const AppTabsScreen(),
      ),
      GoRoute(
        path: RouteNames.homeScreen,
        builder: (context, state) => const HomeScreen(),
      ),
      GoRoute(
        path: RouteNames.quranScreen,
        builder: (context, state) => const QuranScreen(),
      ),
      GoRoute(
        path: RouteNames.qiblaScreen,
        builder: (context, state) => const QiblaScreen(),
      ),
      GoRoute(
        path: RouteNames.tasbihScreen,
        builder: (context, state) => const TasbihScreen(),
      ),
    ],
  );
}
