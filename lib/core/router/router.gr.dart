// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:ui' as _i10;

import 'package:assignment/features/add_expense_income/view/add_expense_income_page.dart'
    deferred as _i1;
import 'package:assignment/features/auth/view/auth_page.dart' as _i2;
import 'package:assignment/features/getting_started/view/getting_started_page.dart'
    deferred as _i3;
import 'package:assignment/features/home/view/home_page.dart' deferred as _i4;
import 'package:assignment/features/navigation/view/navigation_page.dart'
    deferred as _i5;
import 'package:assignment/features/profile/view/profle_page.dart' as _i6;
import 'package:assignment/features/splash/view/splash_page.dart'
    deferred as _i7;
import 'package:auto_route/auto_route.dart' as _i8;
import 'package:flutter/material.dart' as _i9;

abstract class $AppRouter extends _i8.RootStackRouter {
  $AppRouter({super.navigatorKey});

  @override
  final Map<String, _i8.PageFactory> pagesMap = {
    AddExpenseIncomeRoute.name: (routeData) {
      final args = routeData.argsAs<AddExpenseIncomeRouteArgs>();
      return _i8.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i8.DeferredWidget(
          _i1.loadLibrary,
          () => _i1.AddExpenseIncomePage(
            key: args.key,
            color: args.color,
            routeName: args.routeName,
          ),
        ),
      );
    },
    AuthRoute.name: (routeData) {
      return _i8.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i2.AuthPage(),
      );
    },
    GettingStartedRoute.name: (routeData) {
      return _i8.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i8.DeferredWidget(
          _i3.loadLibrary,
          () => _i3.GettingStartedPage(),
        ),
      );
    },
    HomeRoute.name: (routeData) {
      return _i8.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i8.DeferredWidget(
          _i4.loadLibrary,
          () => _i4.HomePage(),
        ),
      );
    },
    NavigationRoute.name: (routeData) {
      return _i8.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i8.DeferredWidget(
          _i5.loadLibrary,
          () => _i5.NavigationPage(),
        ),
      );
    },
    ProfileRoute.name: (routeData) {
      return _i8.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i6.ProfilePage(),
      );
    },
    SplashRoute.name: (routeData) {
      return _i8.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i8.DeferredWidget(
          _i7.loadLibrary,
          () => _i7.SplashPage(),
        ),
      );
    },
  };
}

/// generated route for
/// [_i1.AddExpenseIncomePage]
class AddExpenseIncomeRoute
    extends _i8.PageRouteInfo<AddExpenseIncomeRouteArgs> {
  AddExpenseIncomeRoute({
    _i9.Key? key,
    required _i10.Color color,
    required String routeName,
    List<_i8.PageRouteInfo>? children,
  }) : super(
          AddExpenseIncomeRoute.name,
          args: AddExpenseIncomeRouteArgs(
            key: key,
            color: color,
            routeName: routeName,
          ),
          initialChildren: children,
        );

  static const String name = 'AddExpenseIncomeRoute';

  static const _i8.PageInfo<AddExpenseIncomeRouteArgs> page =
      _i8.PageInfo<AddExpenseIncomeRouteArgs>(name);
}

class AddExpenseIncomeRouteArgs {
  const AddExpenseIncomeRouteArgs({
    this.key,
    required this.color,
    required this.routeName,
  });

  final _i9.Key? key;

  final _i10.Color color;

  final String routeName;

  @override
  String toString() {
    return 'AddExpenseIncomeRouteArgs{key: $key, color: $color, routeName: $routeName}';
  }
}

/// generated route for
/// [_i2.AuthPage]
class AuthRoute extends _i8.PageRouteInfo<void> {
  const AuthRoute({List<_i8.PageRouteInfo>? children})
      : super(
          AuthRoute.name,
          initialChildren: children,
        );

  static const String name = 'AuthRoute';

  static const _i8.PageInfo<void> page = _i8.PageInfo<void>(name);
}

/// generated route for
/// [_i3.GettingStartedPage]
class GettingStartedRoute extends _i8.PageRouteInfo<void> {
  const GettingStartedRoute({List<_i8.PageRouteInfo>? children})
      : super(
          GettingStartedRoute.name,
          initialChildren: children,
        );

  static const String name = 'GettingStartedRoute';

  static const _i8.PageInfo<void> page = _i8.PageInfo<void>(name);
}

/// generated route for
/// [_i4.HomePage]
class HomeRoute extends _i8.PageRouteInfo<void> {
  const HomeRoute({List<_i8.PageRouteInfo>? children})
      : super(
          HomeRoute.name,
          initialChildren: children,
        );

  static const String name = 'HomeRoute';

  static const _i8.PageInfo<void> page = _i8.PageInfo<void>(name);
}

/// generated route for
/// [_i5.NavigationPage]
class NavigationRoute extends _i8.PageRouteInfo<void> {
  const NavigationRoute({List<_i8.PageRouteInfo>? children})
      : super(
          NavigationRoute.name,
          initialChildren: children,
        );

  static const String name = 'NavigationRoute';

  static const _i8.PageInfo<void> page = _i8.PageInfo<void>(name);
}

/// generated route for
/// [_i6.ProfilePage]
class ProfileRoute extends _i8.PageRouteInfo<void> {
  const ProfileRoute({List<_i8.PageRouteInfo>? children})
      : super(
          ProfileRoute.name,
          initialChildren: children,
        );

  static const String name = 'ProfileRoute';

  static const _i8.PageInfo<void> page = _i8.PageInfo<void>(name);
}

/// generated route for
/// [_i7.SplashPage]
class SplashRoute extends _i8.PageRouteInfo<void> {
  const SplashRoute({List<_i8.PageRouteInfo>? children})
      : super(
          SplashRoute.name,
          initialChildren: children,
        );

  static const String name = 'SplashRoute';

  static const _i8.PageInfo<void> page = _i8.PageInfo<void>(name);
}
