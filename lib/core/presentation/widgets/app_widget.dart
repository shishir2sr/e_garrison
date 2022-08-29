import 'package:firebase_auth_with_riverpod_tutorial/auth/application/auth_notifier.dart';
import 'package:firebase_auth_with_riverpod_tutorial/auth/application/email_verification_notifier.dart';
import 'package:firebase_auth_with_riverpod_tutorial/auth/shared/providers.dart';
import 'package:firebase_auth_with_riverpod_tutorial/core/presentation/router/router.gr.dart';
import 'package:firebase_auth_with_riverpod_tutorial/core/presentation/theming/custom_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AppWidget extends ConsumerWidget {
  AppWidget({Key? key}) : super(key: key);
  final _appRouter = AppRouter();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    //
    //listening to suthstate searching if user is authenticated or not
    /************************************** */
//
    ref.listen<AuthState>(authNotifierProvider, (_, state) {
      state.maybeWhen(
//
        // if user authenticated then
        //
        authenticated: () async {
          final isEmailVerified = await ref
              .read<EmailVerificationNotifier>(
                  emailVerificationNotifierProvider.notifier)
              .isEmailVerified();
          //if users email not verified, go to Email Verification Page
          //if users email verified, go to Home Page
          //
          if (!isEmailVerified == true) {
            _appRouter.pushAndPopUntil(const EmailVerificationRoute(),
                predicate: (_) => false);
          } else {
            _appRouter.pushAndPopUntil(const HomeRoute(),
                predicate: (_) => false);
          }
        },

        //if user unAuthenticated, go to SignIn Route
        unAuthenticated: () {
          _appRouter.pushAndPopUntil(const SignInRoute(),
              predicate: (_) => false);
        },
        orElse: () {},
      );
    });

    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      theme: CustomTheme.appTheme,
      routerDelegate: _appRouter.delegate(),
      routeInformationParser: _appRouter.defaultRouteParser(),
    );
  }
}
