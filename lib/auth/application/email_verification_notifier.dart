import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../domain/auth_failure.dart';
import '../infrastructure/auth_repository.dart';
part 'email_verification_notifier.freezed.dart';

@freezed
class EmailVerificationState with _$EmailVerificationState {
  const EmailVerificationState._();
  const factory EmailVerificationState.initial() = _Initial;
  const factory EmailVerificationState.submitted() = _Submitted;
  const factory EmailVerificationState.loading() = _Loading;
  const factory EmailVerificationState.error(AuthFailure failure) = _Error;
}

class EmailVerificationNotifier extends StateNotifier<EmailVerificationState> {
  final AuthRepository _authRepository;
  EmailVerificationNotifier(this._authRepository)
      : super(const EmailVerificationState.initial());

  ///email verification check
  Future<bool> isEmailVerified() async {
    final successOrFailure = await _authRepository.isEmailVerified();
    return successOrFailure.fold((failure) {
      state = EmailVerificationState.error(failure);
      return false;
    }, (r) => r);
  } //email verification ends

  ///email verification resend
  Future<void> resendVerificationEmail() async {
    final successOrFailure = await _authRepository.resendVerificationEmail();
    successOrFailure.fold((failure) => EmailVerificationState.error(failure),
        (r) => const EmailVerificationState.submitted());
  }
}
