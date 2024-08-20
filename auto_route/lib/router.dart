import 'package:auto_route/auto_route.dart';
import 'package:auto_route_navigation/confirm_guard.dart';

import 'router.gr.dart';

final router = AppRouter();

@AutoRouterConfig(replaceInRouteName: 'View,Route')
class AppRouter extends RootStackRouter {

  @override
  
  @override
  List<AutoRoute> get routes => [
        AutoRoute(initial: true, page: HomeRoute.page),
        AutoRoute(
          page: ScreenOneRoute.page,
          guards: [ConfirmGuard()],
          path: '/screen-one',
        ),
        AutoRoute(
          page: ScreenTwoRoute.page,
          path: '/screen-two',
        ),
      ];
}
