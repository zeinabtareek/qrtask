part of 'sign_up_cubit.dart';

@freezed
class RegisterState with _$RegisterState  {
  const factory RegisterState.initial() = _Initial;
  const factory RegisterState.loading() = Loading;
  const factory RegisterState.error(String message) = Error;
  const factory RegisterState.success() = Success;


}


