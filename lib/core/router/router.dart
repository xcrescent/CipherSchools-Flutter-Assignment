import 'package:auto_route/auto_route.dart';
import 'package:assignment/core/router/router.gr.dart';

/// This class used for defined routes and paths na dother properties
@AutoRouterConfig()
class AppRouter extends $AppRouter {
  @override
  late final List<AutoRoute> routes = [
    AutoRoute(
      page: SplashRoute.page,
      path: '/',
      initial: true,
    ),
    AutoRoute(
      page: GettingStartedRoute.page,
      path: '/getting-started',
    ),
    AutoRoute(
      page: AuthRoute.page,
      path: '/auth',
    ),
    AutoRoute(
      page: NavigationRoute.page,
      path: '/navigation',
    ),
    // AutoRoute(
    //   page: HomeRoute.page,
    //   path: '/home',
    // ),
  ];
}
