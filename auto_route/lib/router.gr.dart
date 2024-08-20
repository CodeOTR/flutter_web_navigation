// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i4;
import 'package:auto_route_navigation/main.dart' as _i1;
import 'package:auto_route_navigation/screen_one.dart' as _i2;
import 'package:auto_route_navigation/screen_two.dart' as _i3;

/// generated route for
/// [_i1.HomeView]
class HomeRoute extends _i4.PageRouteInfo<void> {
  const HomeRoute({List<_i4.PageRouteInfo>? children})
      : super(
          HomeRoute.name,
          initialChildren: children,
        );

  static const String name = 'HomeRoute';

  static _i4.PageInfo page = _i4.PageInfo(
    name,
    builder: (data) {
      return const _i1.HomeView();
    },
  );
}

/// generated route for
/// [_i2.ScreenOneView]
class ScreenOneRoute extends _i4.PageRouteInfo<void> {
  const ScreenOneRoute({List<_i4.PageRouteInfo>? children})
      : super(
          ScreenOneRoute.name,
          initialChildren: children,
        );

  static const String name = 'ScreenOneRoute';

  static _i4.PageInfo page = _i4.PageInfo(
    name,
    builder: (data) {
      return const _i2.ScreenOneView();
    },
  );
}

/// generated route for
/// [_i3.ScreenTwoView]
class ScreenTwoRoute extends _i4.PageRouteInfo<void> {
  const ScreenTwoRoute({List<_i4.PageRouteInfo>? children})
      : super(
          ScreenTwoRoute.name,
          initialChildren: children,
        );

  static const String name = 'ScreenTwoRoute';

  static _i4.PageInfo page = _i4.PageInfo(
    name,
    builder: (data) {
      return const _i3.ScreenTwoView();
    },
  );
}
