import 'package:firebase_auth_with_riverpod_tutorial/auth/domain/auth_failure.dart';
import 'package:firebase_auth_with_riverpod_tutorial/auth/infrastructure/auth_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'email_verification_notifier.freezed.dart';

@freezed
class EmailVerificationState with _$EmailVerificationState {
  const EmailVerificationState._();
  const factory EmailVerificationState.initial() = _Initial;
  const factory EmailVerificationState.submitted() = _Submitted;
  const factory EmailVerificationState.error(AuthFailure failure) = _Error;
}

class EmailVerificationNotifier extends StateNotifier<EmailVerificationState> {
  final AuthRepository _authRepository;
  EmailVerificationNotifier(this._authRepository)
      : super(const EmailVerificationState.initial());

  Future<bool> isEmailVerified() async {
    final successOrFailure = await _authRepository.isEmailVerified();

    return successOrFailure.fold((failure) {
      state = EmailVerificationState.error(failure);
      return false;
    }, (r) => r);
  }
}
