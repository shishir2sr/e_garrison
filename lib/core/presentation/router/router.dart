import 'package:auto_route/annotations.dart';
import 'package:firebase_auth_with_riverpod_tutorial/auth/presentation/pages/email_verification_page.dart';
import 'package:firebase_auth_with_riverpod_tutorial/auth/presentation/pages/password_reset_page.dart';
import 'package:firebase_auth_with_riverpod_tutorial/auth/presentation/pages/sign_in_page.dart';
import 'package:firebase_auth_with_riverpod_tutorial/auth/presentation/pages/sign_up_page.dart';
import 'package:firebase_auth_with_riverpod_tutorial/home/presentation/home_page.dart';
import 'package:firebase_auth_with_riverpod_tutorial/splash/presentation/splash_page.dart';

@MaterialAutoRouter(
  routes: [
    MaterialRoute(page: SplashPage, initial: true),
    MaterialRoute(page: SignInPage),
    MaterialRoute(page: SignUpPage),
    MaterialRoute(page: PasswordResetPage),
    MaterialRoute(page: EmailVerificationPage),
    MaterialRoute(page: HomePage),
  ],
  replaceInRouteName: 'Page,Route',
)
class $AppRouter {}
