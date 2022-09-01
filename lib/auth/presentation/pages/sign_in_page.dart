import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:auto_route/auto_route.dart';

import '../../../core/presentation/router/router.gr.dart';
import '../../../core/presentation/widgets/error_success_flash.dart';
import '../../../core/presentation/widgets/logo_image.dart';
import '../../application/auth_notifier.dart';
import '../../shared/providers.dart';
import '../widgets/bottom_text_link.dart';
import '../widgets/google_sign_in_button.dart';
import '../widgets/sign_in_form.dart';

class SignInPage extends ConsumerWidget {
  const SignInPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.listen<AuthState>(authNotifierProvider, (_, state) {
      state.maybeWhen(
          error: (failure) {
            failure.maybeWhen(
              userDisabled: () => showErrorFlash(context, "User is disabled"),
              noNetworkConnection: () =>
                  showErrorFlash(context, 'No Network Connection'),
              tooManyRequests: () =>
                  showErrorFlash(context, 'Too Many Requests'),
              unexpectedError: () =>
                  showErrorFlash(context, 'Unexpected Error'),
              invalidEmailAndPasswordCombination: () => showErrorFlash(
                  context, 'Invalid email and password combination'),
              orElse: () {},
            );
          },
          orElse: () {});
    });

    return Scaffold(
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const LogoImage(),
                  const SizedBox(height: 30),
                  Text(
                    'Sign In',
                    style: Theme.of(context).textTheme.headline5,
                  ),
                  const SizedBox(height: 40),
                  const SignInForm(),
                  const GoogleSignInButton(),
                  const SizedBox(height: 5),
                  TextButton(
                    onPressed: () {
                      context.pushRoute(const PasswordResetRoute());
                    },
                    child: const Text(
                      'Forgot your password?',
                    ),
                  ),
                  BottomTextLink(
                    text: 'Don\'t have an account?',
                    link: 'Create one now.',
                    onPressed: () {
                      context.pushRoute(const SignUpRoute());
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
