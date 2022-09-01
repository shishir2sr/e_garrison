import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../application/auth_notifier.dart';
import '../application/email_verification_notifier.dart';
import '../application/password_reset_notifier.dart';
import '../infrastructure/auth_repository.dart';

final firebaseAuthProvider = Provider((ref) => FirebaseAuth.instance);

final googleSignInProvider = Provider((ref) => GoogleSignIn());

final authrepoSitoryProvider = Provider<AuthRepository>((ref) => AuthRepository(
    ref.watch(firebaseAuthProvider), ref.watch(googleSignInProvider)));

final authNotifierProvider = StateNotifierProvider<AuthNotifier, AuthState>(
  (ref) => AuthNotifier(
    ref.watch(authrepoSitoryProvider),
  ),
);

final passwordResetNotifierProvider =
    StateNotifierProvider<PasswordResetNotifier, PasswordResetState>(
  (ref) => PasswordResetNotifier(
    ref.watch(authrepoSitoryProvider),
  ),
);

final emailVerificationNotifierProvider =
    StateNotifierProvider<EmailVerificationNotifier, EmailVerificationState>(
  (ref) => EmailVerificationNotifier(
    ref.watch(authrepoSitoryProvider),
  ),
);
