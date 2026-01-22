part of 'auth_cubit.dart';

@immutable
sealed class AuthState {}

final class AuthInitial extends AuthState {}

final class LoginLoadingState extends AuthState {}

final class LoginSuccessState extends AuthState {
  final LoginResponseModel responseModel;
  LoginSuccessState(this.responseModel);
}

final class LoginErrorState extends AuthState {
  final String errString;
  LoginErrorState(this.errString);
}
