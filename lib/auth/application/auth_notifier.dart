import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_auth_with_riverpod_tutorial/auth/domain/auth_failure.dart';
import 'package:firebase_auth_with_riverpod_tutorial/auth/infrastructure/auth_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'auth_notifier.freezed.dart';

@freezed
class AuthState with _$AuthState {
  const AuthState._();
  const factory AuthState.initial() = _Initial;
  const factory AuthState.authenticated() = _Authenticated;
  const factory AuthState.unAuthenticated() = _UnAuthenticated;
  const factory AuthState.error(AuthFailure failure) = _Error;
}

/// auth notifier
/// listen to the state changes
class AuthNotifier extends StateNotifier<AuthState> {
  final AuthRepository _authRepository;
  late StreamSubscription<User?> _authStateChangesSubscription;

  AuthNotifier(this._authRepository) : super(const AuthState.initial()) {
    _authStateChangesSubscription = _authRepository.authStateChanges().listen(
      (user) {
        if (user != null) {
          state = const AuthState.authenticated();
        } else {
          state = const AuthState.unAuthenticated();
        }
      },
    );
  } // Auth notifier constructor ends

  /// register with email and pass notifier
  Future<void> registerWithEmailAndPassword(
      String email, String password) async {
    final failureOrSuccess =
        await _authRepository.registerWithEmailAndPassword(email, password);
    failureOrSuccess.fold(
        (failure) => state = AuthState.error(failure), (r) {});
  } // ends

  ///sign in with email and password
  ///returns nothing if success
  ///returns failure if occurd
  Future<void> signInWithEmailAndPassword(String email, String password) async {
    final failureOrSuccess =
        await _authRepository.signInWithEmailAndPassword(email, password);

    failureOrSuccess.fold(
        (failure) => state = AuthState.error(failure), (r) {});
  } //signin with email pass ennds

  ///sign in with google method
  ///
  Future<void> signInWithGoogle() async {
    final failureOrSuccess = await _authRepository.signInWithGoogle();
    failureOrSuccess.fold(
        (failure) => state = AuthState.error(failure), (r) {});
  }

  Future<void> signOut() async {
    await _authRepository.signOut();
  }

  Future<void> isEmailVerified() async {
    final failureOrSuccess = await _authRepository.isEmailVerified();

    failureOrSuccess.fold((failure) => state = AuthState.error(failure),
        (isVarified) => state = const AuthState.authenticated());
  }

  @override
  Future<void> dispose() async {
    super.dispose();
    _authStateChangesSubscription.cancel();
  }
}
