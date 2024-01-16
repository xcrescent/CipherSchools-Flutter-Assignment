// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:ui' as _i11;

import 'package:assignment/features/add_expense_income/view/add_expense_income_page.dart'
    deferred as _i1;
import 'package:assignment/features/auth/view/auth_page.dart' as _i2;
import 'package:assignment/features/auth/view/splash_page.dart' deferred as _i8;
import 'package:assignment/features/budget/view/budget_page.dart'
    deferred as _i3;
import 'package:assignment/features/getting_started/view/getting_started_page.dart'
    deferred as _i4;
import 'package:assignment/features/home/view/home_page.dart' deferred as _i5;
import 'package:assignment/features/navigation/view/navigation_page.dart'
    deferred as _i6;
import 'package:assignment/features/profile/view/profle_page.dart' as _i7;
import 'package:auto_route/auto_route.dart' as _i9;
import 'package:flutter/material.dart' as _i10;

abstract class $AppRouter extends _i9.RootStackRouter {
  $AppRouter({super.navigatorKey});

  @override
  final Map<String, _i9.PageFactory> pagesMap = {
    AddExpenseIncomeRoute.name: (routeData) {
      final args = routeData.argsAs<AddExpenseIncomeRouteArgs>();
      return _i9.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i9.DeferredWidget(
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
      return _i9.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i2.AuthPage(),
      );
    },
    BudgetRoute.name: (routeData) {
      return _i9.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i9.DeferredWidget(
          _i3.loadLibrary,
          () => _i3.BudgetPage(),
        ),
      );
    },
    GettingStartedRoute.name: (routeData) {
      return _i9.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i9.DeferredWidget(
          _i4.loadLibrary,
          () => _i4.GettingStartedPage(),
        ),
      );
    },
    HomeRoute.name: (routeData) {
      return _i9.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i9.DeferredWidget(
          _i5.loadLibrary,
          () => _i5.HomePage(),
        ),
      );
    },
    NavigationRoute.name: (routeData) {
      return _i9.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i9.DeferredWidget(
          _i6.loadLibrary,
          () => _i6.NavigationPage(),
        ),
      );
    },
    ProfileRoute.name: (routeData) {
      return _i9.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i7.ProfilePage(),
      );
    },
    SplashRoute.name: (routeData) {
      return _i9.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i9.DeferredWidget(
          _i8.loadLibrary,
          () => _i8.SplashPage(),
        ),
      );
    },
  };
}

/// generated route for
/// [_i1.AddExpenseIncomePage]
class AddExpenseIncomeRoute
    extends _i9.PageRouteInfo<AddExpenseIncomeRouteArgs> {
  AddExpenseIncomeRoute({
    _i10.Key? key,
    required _i11.Color color,
    required String routeName,
    List<_i9.PageRouteInfo>? children,
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

  static const _i9.PageInfo<AddExpenseIncomeRouteArgs> page =
      _i9.PageInfo<AddExpenseIncomeRouteArgs>(name);
}

class AddExpenseIncomeRouteArgs {
  const AddExpenseIncomeRouteArgs({
    this.key,
    required this.color,
    required this.routeName,
  });

  final _i10.Key? key;

  final _i11.Color color;

  final String routeName;

  @override
  String toString() {
    return 'AddExpenseIncomeRouteArgs{key: $key, color: $color, routeName: $routeName}';
  }
}

/// generated route for
/// [_i2.AuthPage]
class AuthRoute extends _i9.PageRouteInfo<void> {
  const AuthRoute({List<_i9.PageRouteInfo>? children})
      : super(
          AuthRoute.name,
          initialChildren: children,
        );

  static const String name = 'AuthRoute';

  static const _i9.PageInfo<void> page = _i9.PageInfo<void>(name);
}

/// generated route for
/// [_i3.BudgetPage]
class BudgetRoute extends _i9.PageRouteInfo<void> {
  const BudgetRoute({List<_i9.PageRouteInfo>? children})
      : super(
          BudgetRoute.name,
          initialChildren: children,
        );

  static const String name = 'BudgetRoute';

  static const _i9.PageInfo<void> page = _i9.PageInfo<void>(name);
}

/// generated route for
/// [_i4.GettingStartedPage]
class GettingStartedRoute extends _i9.PageRouteInfo<void> {
  const GettingStartedRoute({List<_i9.PageRouteInfo>? children})
      : super(
          GettingStartedRoute.name,
          initialChildren: children,
        );

  static const String name = 'GettingStartedRoute';

  static const _i9.PageInfo<void> page = _i9.PageInfo<void>(name);
}

/// generated route for
/// [_i5.HomePage]
class HomeRoute extends _i9.PageRouteInfo<void> {
  const HomeRoute({List<_i9.PageRouteInfo>? children})
      : super(
          HomeRoute.name,
          initialChildren: children,
        );

  static const String name = 'HomeRoute';

  static const _i9.PageInfo<void> page = _i9.PageInfo<void>(name);
}

/// generated route for
/// [_i6.NavigationPage]
class NavigationRoute extends _i9.PageRouteInfo<void> {
  const NavigationRoute({List<_i9.PageRouteInfo>? children})
      : super(
          NavigationRoute.name,
          initialChildren: children,
        );

  static const String name = 'NavigationRoute';

  static const _i9.PageInfo<void> page = _i9.PageInfo<void>(name);
}

/// generated route for
/// [_i7.ProfilePage]
class ProfileRoute extends _i9.PageRouteInfo<void> {
  const ProfileRoute({List<_i9.PageRouteInfo>? children})
      : super(
          ProfileRoute.name,
          initialChildren: children,
        );

  static const String name = 'ProfileRoute';

  static const _i9.PageInfo<void> page = _i9.PageInfo<void>(name);
}

/// generated route for
/// [_i8.SplashPage]
class SplashRoute extends _i9.PageRouteInfo<void> {
  const SplashRoute({List<_i9.PageRouteInfo>? children})
      : super(
          SplashRoute.name,
          initialChildren: children,
        );

  static const String name = 'SplashRoute';

  static const _i9.PageInfo<void> page = _i9.PageInfo<void>(name);
}
