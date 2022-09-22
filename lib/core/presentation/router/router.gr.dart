// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i9;
import 'package:flutter/material.dart' as _i10;

import '../../../auth/presentation/pages/email_verification_page.dart' as _i5;
import '../../../auth/presentation/pages/password_reset_page.dart' as _i4;
import '../../../auth/presentation/pages/sign_in_page.dart' as _i2;
import '../../../auth/presentation/pages/sign_up_page.dart' as _i3;
import '../../../home/presentation/bottom_navigation/widgets/guard_widget.dart'
    as _i8;
import '../../../home/presentation/bottom_navigation/widgets/home_widget.dart'
    as _i7;
import '../../../home/presentation/home_page.dart' as _i6;
import '../../../splash/presentation/splash_page.dart' as _i1;

class AppRouter extends _i9.RootStackRouter {
  AppRouter([_i10.GlobalKey<_i10.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i9.PageFactory> pagesMap = {
    SplashRoute.name: (routeData) {
      return _i9.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i1.SplashPage());
    },
    SignInRoute.name: (routeData) {
      return _i9.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i2.SignInPage());
    },
    SignUpRoute.name: (routeData) {
      return _i9.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i3.SignUpPage());
    },
    PasswordResetRoute.name: (routeData) {
      return _i9.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i4.PasswordResetPage());
    },
    EmailVerificationRoute.name: (routeData) {
      return _i9.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i5.EmailVerificationPage());
    },
    HomeRoute.name: (routeData) {
      return _i9.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i6.HomePage());
    },
    MainRoute.name: (routeData) {
      return _i9.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i7.MainPage());
    },
    GuardsRoute.name: (routeData) {
      return _i9.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i8.GuardsPage());
    }
  };

  @override
  List<_i9.RouteConfig> get routes => [
        _i9.RouteConfig(SplashRoute.name, path: '/'),
        _i9.RouteConfig(SignInRoute.name, path: '/sign-in-page'),
        _i9.RouteConfig(SignUpRoute.name, path: '/sign-up-page'),
        _i9.RouteConfig(PasswordResetRoute.name, path: '/password-reset-page'),
        _i9.RouteConfig(EmailVerificationRoute.name,
            path: '/email-verification-page'),
        _i9.RouteConfig(HomeRoute.name, path: '/home-page', children: [
          _i9.RouteConfig(MainRoute.name,
              path: 'main-page', parent: HomeRoute.name),
          _i9.RouteConfig(GuardsRoute.name,
              path: 'guards-page', parent: HomeRoute.name)
        ])
      ];
}

/// generated route for
/// [_i1.SplashPage]
class SplashRoute extends _i9.PageRouteInfo<void> {
  const SplashRoute() : super(SplashRoute.name, path: '/');

  static const String name = 'SplashRoute';
}

/// generated route for
/// [_i2.SignInPage]
class SignInRoute extends _i9.PageRouteInfo<void> {
  const SignInRoute() : super(SignInRoute.name, path: '/sign-in-page');

  static const String name = 'SignInRoute';
}

/// generated route for
/// [_i3.SignUpPage]
class SignUpRoute extends _i9.PageRouteInfo<void> {
  const SignUpRoute() : super(SignUpRoute.name, path: '/sign-up-page');

  static const String name = 'SignUpRoute';
}

/// generated route for
/// [_i4.PasswordResetPage]
class PasswordResetRoute extends _i9.PageRouteInfo<void> {
  const PasswordResetRoute()
      : super(PasswordResetRoute.name, path: '/password-reset-page');

  static const String name = 'PasswordResetRoute';
}

/// generated route for
/// [_i5.EmailVerificationPage]
class EmailVerificationRoute extends _i9.PageRouteInfo<void> {
  const EmailVerificationRoute()
      : super(EmailVerificationRoute.name, path: '/email-verification-page');

  static const String name = 'EmailVerificationRoute';
}

/// generated route for
/// [_i6.HomePage]
class HomeRoute extends _i9.PageRouteInfo<void> {
  const HomeRoute({List<_i9.PageRouteInfo>? children})
      : super(HomeRoute.name, path: '/home-page', initialChildren: children);

  static const String name = 'HomeRoute';
}

/// generated route for
/// [_i7.MainPage]
class MainRoute extends _i9.PageRouteInfo<void> {
  const MainRoute() : super(MainRoute.name, path: 'main-page');

  static const String name = 'MainRoute';
}

/// generated route for
/// [_i8.GuardsPage]
class GuardsRoute extends _i9.PageRouteInfo<void> {
  const GuardsRoute() : super(GuardsRoute.name, path: 'guards-page');

  static const String name = 'GuardsRoute';
}
