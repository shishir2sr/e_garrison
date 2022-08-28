import 'package:freezed_annotation/freezed_annotation.dart';
part 'auth_failure.freezed.dart';

///AuthFailure class
///making exceptions into failure
///And provide it to the state class if exception occurs
///Populate to the user interface
@freezed
class AuthFailure with _$AuthFailure {
  const AuthFailure._();
  const factory AuthFailure.unexpectedError() = _UnexpectedError;
  const factory AuthFailure.emailInUse() = _EmailInUse;
  const factory AuthFailure.noNetworkConnection() = _NoNetworkConnection;        
  const factory AuthFailure.tooManyRequests() = _TooManyRequests;        
  const factory AuthFailure.userDisabled() = _UserDisabled;                
  const factory AuthFailure.emailDoesNotExist() = _EmailDoesNotExist;                
  const factory AuthFailure.invalidEmailAndPasswordCombination() = _InvalidEmailAndPasswordCombination;
  const factory AuthFailure.cancelledByUser() = _CancelledByUser;
                  
  
  }
