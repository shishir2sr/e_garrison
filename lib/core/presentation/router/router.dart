import 'package:auto_route/annotations.dart';

import '../../../auth/presentation/pages/email_verification_page.dart';
import '../../../auth/presentation/pages/password_reset_page.dart';
import '../../../auth/presentation/pages/sign_in_page.dart';
import '../../../auth/presentation/pages/sign_up_page.dart';
import '../../../home/presentation/bottom navigation/widgets/guard_widget.dart';
import '../../../home/presentation/bottom navigation/widgets/home_widget.dart';
import '../../../home/presentation/home_page.dart';
import '../../../splash/presentation/splash_page.dart';

@MaterialAutoRouter(
  routes: [
    MaterialRoute(page: SplashPage, initial: true),
    MaterialRoute(page: SignInPage),
    MaterialRoute(page: SignUpPage),
    MaterialRoute(page: PasswordResetPage),
    MaterialRoute(page: EmailVerificationPage),
    MaterialRoute(page: HomePage, children: [
      MaterialRoute(page: MainPage),
      MaterialRoute(page: AnotherPage),
    ]),
  ],
  replaceInRouteName: 'Page,Route',
)
class $AppRouter {}
