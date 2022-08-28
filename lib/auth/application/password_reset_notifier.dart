import 'package:firebase_auth_with_riverpod_tutorial/auth/domain/auth_failure.dart';
import 'package:firebase_auth_with_riverpod_tutorial/auth/infrastructure/auth_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'password_reset_notifier.freezed.dart';

@freezed
class PasswordResetState with _$PasswordResetState {
  const PasswordResetState._();
  const factory PasswordResetState.initial() = _Initial;
  const factory PasswordResetState.submitted() = _Submitted;
  const factory PasswordResetState.error(AuthFailure failure) = _Error;
}

class PasswordResetNotifier extends StateNotifier<PasswordResetState> {
  PasswordResetNotifier(this._authRepository)
      : super(const PasswordResetState.initial());
  final AuthRepository _authRepository;

  Future<void> sendPasswordResetEmail(String email) async {
    final failureOrSuccess =
        await _authRepository.sendPasswordResetEmail(email);
    failureOrSuccess.fold(
        (failure) => state = PasswordResetState.error(failure),
        (success) => const PasswordResetState.submitted());
  }
}
