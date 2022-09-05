import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/presentation/widgets/error_success_flash.dart';
import '../../../core/presentation/widgets/logo_image.dart';
import '../../application/password_reset_notifier.dart';
import '../../shared/providers.dart';
import '../widgets/password_reset_form.dart';

class PasswordResetPage extends ConsumerWidget {
  const PasswordResetPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.listen<PasswordResetState>(
      passwordResetNotifierProvider,
      (_, state) => state.maybeWhen(
          submitted: () =>
              showSuccessFlash(context, 'A verification email sent'),
          error: (failure) {
            failure.maybeWhen(
                emailDoesNotExist: () =>
                    showErrorFlash(context, 'Email does not exists'),
                noNetworkConnection: () =>
                    showErrorFlash(context, 'No network connection'),
                tooManyRequests: () =>
                    showErrorFlash(context, 'Too many requests'),
                unexpectedError: () =>
                    showErrorFlash(context, 'An unexpected error occurred'),
                orElse: () {});
            return null;
          },
          orElse: () {
            return null;
          }),
    );

    return Scaffold(
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40.0),
              child: ref.watch(passwordResetNotifierProvider).maybeWhen(
                    loading: () => const CircularProgressIndicator(),
                    orElse: () => Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const LogoImage(),
                        const SizedBox(height: 20),
                        Text(
                          'Reset Your Password',
                          style: Theme.of(context).textTheme.headline5,
                        ),
                        const SizedBox(
                          height: 40,
                        ),
                        const PasswordResetForm(),
                      ],
                    ),
                  ),
            ),
          ),
        ),
      ),
    );
  }
}
